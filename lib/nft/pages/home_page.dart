import 'package:flutter/material.dart';
import 'package:mentali/nft/tabs/recent_tab.dart';
import 'package:mentali/nft/tabs/top_tab.dart';
import 'package:mentali/nft/tabs/trending_tab.dart';
import 'package:mentali/nft/widgets/glass_box.dart';
import 'package:mentali/nft/widgets/my_app_bar.dart';
import 'package:mentali/nft/widgets/my_bottom_bar.dart';
import 'package:mentali/nft/widgets/my_tab_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _searchButtonTapped() {}

  int _currentBottomIndex = 0;
   _handleBottomIndexChange(int? index){
     setState(() {
       _currentBottomIndex = index!;
     });
   }

  List tabOptions = const [
    ["Recent", RecentTab()],
    ["Trending", TrendingTab()],
    ["Top", TopTab()]
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabOptions.length,
      child: Scaffold(
        extendBody: true,
        bottomNavigationBar: GlassBox(
          child: MyBottomBar(
            index: _currentBottomIndex,
            onTap: _handleBottomIndexChange,
          ),
        ),
        backgroundColor: Colors.grey[300],
        body: ListView(
          children: [
            MyAppBar(
              title: "Explore\nCollections",
              onTap: _searchButtonTapped,
            ),
            SizedBox(
              height: 700,
              child: MyTabBar(tabOptions: tabOptions),
            )
          ],
        ),
      ),
    );
  }
}
