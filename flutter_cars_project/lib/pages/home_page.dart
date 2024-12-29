import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cars/pages/cars_listview.dart';
import 'package:flutter_cars/utils/preferences.dart';
import 'package:flutter_cars/widgets/drawer_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  late TabController _tabController;

  @override
  void initState() {
    print("HomePage -> [+] initState");

    super.initState();

    _initTabs();

    print("HomePage -> [-] initState");
  }

  _initTabs() async {
    _tabController = TabController(length: 3, vsync: this);

    int tabIndex = await Preferences.getInt("tabIndex");
    _tabController.index = tabIndex;

    _tabController.addListener(() {
      Preferences.setInt("tabIndex", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {

    print("HomePage -> build!");

    return Scaffold(
      appBar: _buildAppBar(),
      drawer: DrawerList(),
      body: _buildTabBarView(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Carros"),
      bottom: _buildTabBar(),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: [
        CarsListview("Clássicos"),
        CarsListview("Esportivos"),
        CarsListview("Luxo"),
      ],
    );
  }

  TabBar _buildTabBar() {
    return TabBar(
        controller: _tabController,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,
        indicatorColor: Colors.white,
        tabs: _tabs());
  }

  List<Widget> _tabs() {
    return [
      Tab(
        text: "Clássicos",
      ),
      Tab(
        text: "Esportivos",
      ),
      Tab(
        text: "Luxo",
      ),
    ];
  }
}
