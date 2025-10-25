import 'package:flutter/material.dart';
import 'package:sayer_app/common/data/Cars/model/cars_model.dart';
import 'package:sayer_app/common/theming/app_colors.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/body_part.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/submit_section.dart';
import 'package:sayer_app/features/CarDetails/ui/widgets/up_part.dart';

class CarDetailsScreen extends StatefulWidget {
  final CarData carData;

  const CarDetailsScreen({Key? key, required this.carData}) : super(key: key);

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
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Container(color: AppColors.white),
          UpPart(carData: widget.carData),
          BodyPart(carData: widget.carData, tabController: tabController),
        ],
      ),
      bottomNavigationBar: SubmitSection(onPressed: () {}),
    );
  }
}
