import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sayer_app/common/layout/app_default_bar.dart';
import 'package:sayer_app/common/layout/app_white_pattern.dart';
import 'package:sayer_app/features/home/logic/car_offers_cubit.dart';
import 'package:sayer_app/features/search/ui/widgets/car_search_bar.dart';
import 'package:sayer_app/features/search/ui/widgets/search_offer_listener.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _searchTextController = TextEditingController();
  late String searchQuery;

  @override
  void initState() {
    super.initState();
    searchQuery = '';

    _searchTextController.addListener(() {
      setState(() {
        searchQuery = _searchTextController.text;
      });

      if (searchQuery.isNotEmpty) {
        context.read<CarOffersCubit>().getCarOffersByCarName(
          searchQuery,
          1,
          20,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppWhitePattern(
      appBar: AppDefaultBar(showbackArrow: true, arrowColor: Colors.black),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarSearchBar(onSearch: (_) {}, controller: _searchTextController),
            SearchOfferListener(searchQuery: searchQuery),
          ],
        ),
      ),
    );
  }
}
