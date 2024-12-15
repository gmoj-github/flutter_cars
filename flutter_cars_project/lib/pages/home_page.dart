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
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    Future<int> future = Preferences.getInt("tabIndex");
    future.then((int tabIndex){
      _tabController.index = tabIndex;
    });

    _tabController.addListener(() {
      Preferences.setInt("tabIndex", _tabController.index);
    });
  }

  @override
  Widget build(BuildContext context) {
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
        CarsListview(),
        CarsListview(),
        CarsListview(),
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
