import 'package:flutter/material.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/body_part.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/car_details_helpers.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/submit_section.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/up_part.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';
import 'package:sayer_app/common/theming/app_colors.dart';

class CarDetailsScreen extends StatefulWidget {
  final CarOfferData carOfferData;

  const CarDetailsScreen({super.key, required this.carOfferData});

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  bool isAddFavorite = false;

  final GlobalKey<FormState> financeFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    _checkIfFavorite();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  Future<void> _checkIfFavorite() async {
    final result = await CarDetailsHelpers.checkIfFavorite(
      context,
      widget.carOfferData.id,
    );
    setState(() {
      isAddFavorite = result;
    });
  }

  Future<void> _toggleFavorite() async {
    await CarDetailsHelpers.toggleFavorite(
      context,
      widget.carOfferData,
      isAddFavorite,
      (newValue) {
        setState(() {
          isAddFavorite = newValue;
        });
      },
    );
  }

  Future<void> _submitLead(bool isFinance) async {
    await CarDetailsHelpers.submitLead(
      context,
      widget.carOfferData,
      isFinance: isFinance,
      formKey: isFinance ? financeFormKey : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    final CarData carData = widget.carOfferData.car;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          UpPart(
            offer: widget.carOfferData,
            isAddFavorite: isAddFavorite,
            onFavoriteTap: _toggleFavorite,
          ),
          BodyPart(
            carData: carData,
            carOfferData: widget.carOfferData,
            tabController: tabController,
            financeFormKey: financeFormKey,
          ),
        ],
      ),
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: tabController.animation!,
        builder: (context, _, __) {
          final isFinanceTab = tabController.index == 2;

          return SubmitSection(
            onPressed: () => _submitLead(isFinanceTab),
            buttonText: isFinanceTab ? 'إرسال طلب تمويل' : 'إرسال الطلب',
          );
        },
      ),
    );
  }
}
