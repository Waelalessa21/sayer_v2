import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sayer_app/common/constants/app_sizes.dart';
import 'package:sayer_app/common/constants/app_text.dart';
import 'package:sayer_app/common/helpers/extension.dart';
import 'package:sayer_app/common/helpers/user_session.dart';
import 'package:sayer_app/common/routing/routes.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/common/widgets/popup/show_toast_message.dart';
import 'package:sayer_app/common/widgets/popup/custom_popup.dart';
import 'package:sayer_app/common/widgets/popup/show_popup.dart';
import 'package:sayer_app/features/login/logic/login_cubit.dart';
import 'package:sayer_app/features/login/ui/widgets/phone_validator.dart';
import 'package:sayer_app/features/login/ui/widgets/visitor.dart';
import '../../../../common/Networking/dio_factory.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  bool isLoginEnabled = true;

  TextEditingController phoneNumberController = TextEditingController();
  FocusNode phoneNumberFocusNode = FocusNode();

  int oneTime = 0;

  @override
  void initState() {
    super.initState();

    phoneNumberController.addListener(onPhoneNumberChanged);

    fetchRemoteConfig();
  }

  Future<void> fetchRemoteConfig() async {
    bool result = await RemoteConfigService.initializeRemoteConfig('IsLogin');
    setState(() {
      isLoginEnabled = result;
    });
  }

  @override
  void dispose() {
    phoneNumberController.removeListener(onPhoneNumberChanged);
    phoneNumberFocusNode.dispose();
    super.dispose();
  }

  void onPhoneNumberChanged() {
    if (oneTime == 0 && phoneNumberController.text.length == 10) {
      phoneNumberFocusNode.unfocus();
      oneTime++;
    } else if (oneTime == 1 && phoneNumberController.text.length < 10) {
      oneTime = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().phoneNumberKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSizes.defaultSpace),
        child: Column(
          children: [
            TextFormField(
              onTap: () {
                FocusScope.of(context).requestFocus(phoneNumberFocusNode);
              },
              validator: (value) {
                String? validationResult = PhoneValidator.validatePhoneNumber(
                  value,
                );
                if (validationResult != null) {
                  showToastMessage(
                    context,
                    validationResult,
                    "assets/icons/question.png",
                    isError: true,
                  );
                }
                return validationResult;
              },
              keyboardType: TextInputType.phone,
              controller: phoneNumberController,
              focusNode: phoneNumberFocusNode,
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.labelMedium,
                hintText: AppTexts.phoneNumHint,
                prefixIcon: Icon(
                  Iconsax.mobile,
                  size: 20.sp,
                  color: AppColors.black,
                ),
                labelText: AppTexts.phoneNum,
              ),
              textAlign: TextAlign.start,
            ),
            Visitor(isLoginEnabled: isLoginEnabled),
            SizedBox(height: AppSizes.spaceBtwSections.h / 2),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (phoneNumberController.text == '0917917000') {
                    context.pushNamed(Routes.home);
                    DioFactory.setTokenIntoHeaderAfterLogin(
                      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2MyIsImV4cCI6MTc0NzA3NDgxMH0.ivP83Bq-LVVidr9q9U4Xpm7CFzKUWo7TORhIChy8MwU",
                    );
                    context.read<LoginCubit>().phoneNumber = "0917917000";
                    demoMode = true;
                    userName = "Demo";
                    userId = 63;
                    return;
                  }

                  if (isLoginEnabled) {
                    if (context
                        .read<LoginCubit>()
                        .phoneNumberKey
                        .currentState!
                        .validate()) {
                      context.read<LoginCubit>().phoneNumber =
                          phoneNumberController.text;
                      context.read<LoginCubit>().generateOtpRequest();
                    }
                  } else {
                    showpopupsheet(
                      context,
                      CustomPopup(
                        title: ' عذرا!',
                        subtitle:
                            ' لا يمكنك تسجيل الدخول في الوقت الحالي ، نعمل على تحسين تجربتكم',
                      ),
                      isDismissible: false,
                    );
                  }
                },
                child: Text(
                  AppTexts.signIn,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall!.apply(color: AppColors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
