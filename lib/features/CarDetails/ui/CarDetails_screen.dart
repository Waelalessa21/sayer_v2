import 'package:flutter/material.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/up_part.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/body_part.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/submit_section.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/features/home/data/model/car_offers_model.dart';

class CarDetailsScreen extends StatefulWidget {
  final CarOfferData carOfferData;

  const CarDetailsScreen({Key? key, required this.carOfferData})
    : super(key: key);

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CarData carData = widget.carOfferData.car;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          UpPart(offer: widget.carOfferData),
          BodyPart(
            carData: carData,
            carOfferData: widget.carOfferData,
            tabController: tabController,
          ),
        ],
      ),

      bottomNavigationBar: SubmitSection(onPressed: () {}),
    );
  }
}
