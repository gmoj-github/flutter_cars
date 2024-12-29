import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cars/api/api_response.dart';
import 'package:flutter_cars/api/cars_api.dart';
import 'package:flutter_cars/models/car.dart';
import 'package:flutter_cars/pages/cars_page.dart';
import 'package:flutter_cars/utils/navigation.dart';

class CarsListview extends StatefulWidget {
  String kind;

  CarsListview(this.kind);

  @override
  State<CarsListview> createState() => _CarsListviewState();
}

class _CarsListviewState extends State<CarsListview>
    with AutomaticKeepAliveClientMixin<CarsListview> {
  @override
  // Usado para manter no cache as informações das TABS carregadas!
  bool get wantKeepAlive => true;

  List<Car>? cars;

  @override
  void initState() {
    super.initState();

    print("CarsListview initState -> ${widget.kind}!");

    _loadCars();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("CarsListview build -> ${widget.kind}");

    if (cars == null) {
      print("CarsListview build -> Cars ${widget.kind} loading!");
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    print("CarsListview build -> Cars ${widget.kind} loaded!");
    return _listView(cars);
  }

  _listView(cars) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: cars.length,
          itemBuilder: (context, index) {
            Car car = cars[index];
            return Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        car.urlPhoto!,
                        width: 150,
                      ),
                    ),
                    Text(
                      car.name!,
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    Text(
                      "Descrição...",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('DETAILS'),
                          onPressed: () => _onClickDetails(car),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('SHARE'),
                          onPressed: () {
                            /* ... */
                          },
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _onClickDetails(car) {
    navigate(context, CarsPage(car));
  }

  void _loadCars() async {
    ApiResponse<List<Car>> cars = await CarsApi.getCars();
    setState(() {
      this.cars = cars.result;
    });
  }
}
