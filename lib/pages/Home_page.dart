import 'package:flutter/material.dart';
import 'package:fooddelivery2/components/My_food_tile.dart';
import 'package:fooddelivery2/components/my_current_location.dart';
import 'package:fooddelivery2/components/my_description_nox.dart';
import 'package:fooddelivery2/components/my_drawer.dart';
import 'package:fooddelivery2/components/my_silver_app_bar.dart';
import 'package:fooddelivery2/components/my_tab_bar.dart';
import 'package:fooddelivery2/models/Food.dart';
import 'package:fooddelivery2/models/restaurant.dart';
import 'package:fooddelivery2/pages/food_pages.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // tab controller
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: FoodCategory.values.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  // sort out and return a list of food items that belong to specific category
  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((Food) => Food.category == category).toList();
  }
  // return list of foods in given category

  List<Widget> getFoodInThisCategory(List<Food> fullMenu) {
    return FoodCategory.values.map((Category) {
      List<Food> categoryMenu = _filterMenuByCategory(Category, fullMenu);

      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          //get individual food
          final Food = categoryMenu[index];
          return FoodTile(
            food: Food,
            onTap:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FoodPage(food: Food)),
                ),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder:
            (context, innerBoxIsScrolled) => [
              MySilverAppBar(
                title: MyTabBar(tabController: _tabController),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    // my current location
                    MyCurrentLocation(),

                    // descroption box
                    MyDescriptionNox(),
                  ],
                ),
              ),
            ],
        body: Consumer<Restaurant>(
          builder:
              (context, restaurant, child) => TabBarView(
                controller: _tabController,
                children: getFoodInThisCategory(restaurant.menu),
              ),
        ),
      ),
    );
  }
}
