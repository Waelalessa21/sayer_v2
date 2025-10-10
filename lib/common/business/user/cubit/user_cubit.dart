import 'package:bloc/bloc.dart';
import 'package:sayer_app/common/business/user/cubit/user_state.dart';
import 'package:sayer_app/common/data/user/model/user_model.dart';
import 'package:sayer_app/common/data/user/service/user_serivce.dart';
import 'package:sayer_app/common/networking/api_result.dart';
import 'package:sayer_app/common/networking/api_error_model.dart';
import 'package:sayer_app/common/helpers/user_session.dart';

/// This cubit is used to manage the user data above all app
class UserCubit extends Cubit<UserState> {
  final UserService _userService;

  UserCubit(this._userService) : super(UserState.initial());

  Future<void> submitUser(String firstName, String lastName) async {
    emit(UserState.loading());
    final user = UserModel(
      id: userId,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: userPhoneNumber,
    );
    final response = await _userService.submitUser(user);
    response.when(
      success: (voidResponse) async {
        await getUserID();
        userName = firstName;
        lastName = lastName;
        emit(UserState.successSended());
      },
      failure: (error) {
        emit(UserState.error(error));
      },
    );
  }

  Future<String> getUserByPhoneNumber() async {
    try {
      if (userPhoneNumber.isEmpty) return '';
      final phone = userPhoneNumber.replaceFirst('+', '%2B');
      final response = await _userService.getUserByPhoneNumber(phone);
      return response.when(
        success: (userResponse) {
          final user = userResponse.items?.first;
          if (user != null) {
            userId = user.id!;
            userName = user.firstName!;
            emit(UserState.successFetch(user.firstName!));
            return user.firstName!;
          }
          return '';
        },
        failure: (error) {
          emit(UserState.error(error));
          return '';
        },
      );
    } catch (e) {
      emit(UserState.error(ApiErrorModel(msg: 'Failed to fetch user data')));
      return '';
    }
  }

  Future<void> getUserID() async {
    try {
      final phone = userPhoneNumber.replaceFirst('+', '%2B');
      final response = await _userService.getUserId(phone);
      response.when(
        success: (userResponse) {
          final user = userResponse.items;
          if (user != null && user.first.id != null) {
            userId = user.first.id!;
            emit(UserState.successFetchId(user.first.id!));
          }
        },
        failure: (error) {
          emit(UserState.error(error));
        },
      );
    } catch (e) {
      emit(UserState.error(ApiErrorModel(msg: 'Failed to fetch user ID')));
    }
  }

  Future<void> updateUser(String firstName, String lastName) async {
    emit(UserState.loading());
    final user = UserUpdateModel(
      id: userId,
      firstName: firstName,
      lastName: lastName,
      phoneNumber: userPhoneNumber,
    );
    final response = await _userService.updateUser(user);
    response.when(
      success: (voidResponse) {
        userName = firstName;
        emit(UserState.updateUserSuccess(userName));
      },
      failure: (error) {
        emit(UserState.error(error));
      },
    );
  }

  Future<void> initializeUserData() async {
    if (isLoggedInUser && userPhoneNumber.isNotEmpty) {
      await getUserByPhoneNumber();
    }
  }
}
