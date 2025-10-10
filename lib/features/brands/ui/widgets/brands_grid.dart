import 'package:flutter/material.dart';
import 'package:sayer_app/common/layout/app_grid_layout.dart';
import 'package:sayer_app/common/widgets/cards/company_card_design.dart';
import 'package:sayer_app/features/home/data/model/brands_model.dart';

class BrandsGrid extends StatefulWidget {
  final List<BrandData?>? brands;

  const BrandsGrid({super.key, required this.brands});

  @override
  State<BrandsGrid> createState() => _BrandsGridState();
}

class _BrandsGridState extends State<BrandsGrid> {
  final List<bool> _isVisible = [];

  @override
  void initState() {
    super.initState();
    _isVisible.addAll(List.generate(widget.brands?.length ?? 0, (_) => false));
    _animateItems();
  }

  void _animateItems() async {
    for (int i = 0; i < _isVisible.length; i++) {
      await Future.delayed(const Duration(milliseconds: 100));
      if (mounted) {
        setState(() {
          _isVisible[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppGridLayout(
      maixAxisEctent: 75,
      itemCount: widget.brands!.length,
      itemBuilder: (_, index) {
        final brand = widget.brands![index];

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 500),
          opacity: _isVisible[index] ? 1.0 : 0.0,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 500),
            scale: _isVisible[index] ? 1.0 : 0.8,
            curve: Curves.easeOutCubic,
            child: GestureDetector(
              onTap: () {},
              child: CompanyCardDesign(
                brandName: brand!.name!,
                imageUrl: brand.image_url!,
                numberOfProducts: brand.carIds!.length.toString(),
                isNotAsset: true,
              ),
            ),
          ),
        );
      },
    );
  }
}
