import 'package:flutter/material.dart';
import 'package:uop_sports_v3/common/app_features/images.dart';
import 'package:uop_sports_v3/common/widgets/service_grid.dart';
import 'package:uop_sports_v3/components/input/search_input.dart';
import 'package:uop_sports_v3/components/wrappers/default_wrapper.dart';
import 'package:uop_sports_v3/screens/services/service_model.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({super.key});

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  List<SportsType>? filteredSports;

  @override
  void initState() {
    super.initState();
    filteredSports = List.from(sportsGrid);
  }

  void filterSearchResults(String query) {
    if (query.isEmpty || query == "") {
      setState(() {
        filteredSports = List.from(sportsGrid);
      });
      return;
    }

    final results = sportsGrid.where((sport) {
      return sport.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredSports = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var screenHeight = screenSize.height;
    var screenWidth = screenSize.width;
    return DefaultWrapper(
        child: Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [],
        // ),
        //TODO: Change this to a filter instead.
        // SearchInput(
        //   onChanged: (_) {
        //     filterSearchResults(_);
        //   },
        //   controller: TextEditingController(),
        //   autofocus: false,
        //   keyboardType: TextInputType.text,
        //   action: TextInputAction.search,
        //   // labelText: 'Search Sports',
        //   hintText: 'Search for your favourite sport',
        // ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: RefreshIndicator.adaptive(
              onRefresh: () async {},
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5,
                      mainAxisSpacing: 2),
                  itemCount: filteredSports?.length,
                  itemBuilder: (BuildContext context, int index) {
                    final sports = filteredSports?[index];
                    return ServiceCard(
                      caption: sports?.name,
                      image: sports?.imageUrl,
                    );
                  }),
            ),
          ),
        ),
      ],
    ));
  }
}
