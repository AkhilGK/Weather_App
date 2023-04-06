// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:weather_app/api_functions/api_functions.dart';
import 'package:weather_app/constants/constant_widgets.dart';
import 'package:weather_app/home_screen/widgets.dart';

import '../model/weather_model.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  WeatherModel? dataaa;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<void> getData() async {
      dataaa = await client.getCurrentWeather('pattambi');
    }
  }

  WeatherApi client = WeatherApi();
  String toDisplay = 'Waiting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.green,
              Colors.white,
            ])),
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightox20,
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: searchController,
                  cursorColor: Colors.black87,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: 'Search',
                      hintStyle:
                          const TextStyle(color: Colors.grey, fontSize: 18),
                      prefixIcon: Container(
                        padding: const EdgeInsets.all(15),
                        width: 18,
                      )),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  var data = await getData(searchController.text);
                  setState(() {
                    dataaa = data;
                  });
                },
                child: Text('Submit'),
              ),
              dataaa == null
                  ? loadingText()
                  : currentWeather(
                      dataaa!.temperature.toString(),
                      dataaa!.cityName!,
                      dataaa!.overallState!,
                      dataaa!.feelsLike!.toString(),
                      dataaa!.iconCode!,
                      dataaa!.minTemp!.toString(),
                      dataaa!.maxTemp!.toString()),

              // ElevatedButton(
              //   onPressed: (()async {
              //     var data = await getData(searchController.text);
              //     setState(
              //       () {dataaa=data},
              //     );
              //   }),
              //   child: const Text('Submit'),
              // ),
              // dataaa==null?Text(toDisplay):,
            ],
          ),
        ),
      ),
    );
  }

  Center loadingText() {
    return const Center(
        child: Text(
      'Enter a city name and click submit',
      style: TextStyle(color: Colors.black54, fontSize: 23),
    ));
  }

  Future<WeatherModel?> getData(String dataIn) async {
    var val = await client.getCurrentWeather(dataIn);

    return val;
  }
}
