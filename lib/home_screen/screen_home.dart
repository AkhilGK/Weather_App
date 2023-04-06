import 'package:flutter/material.dart';
import 'package:weather_app/api_functions/api_functions.dart';
import 'package:weather_app/constants/constant_widgets.dart';
import 'package:weather_app/home_screen/widgets.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/search/screen_search.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? dataaa;

  WeatherApi client = WeatherApi();
  Future<WeatherModel?> getData() async {
    dataaa = await client.getCurrentWeather('Amsterdam ');
    return dataaa;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather Today',
          style: TextStyle(fontStyle: FontStyle.italic, fontSize: 26),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchScreen(),
                ));
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          widthBox10
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Colors.green,
              Colors.white,
            ])),
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            String? tempNow = dataaa?.temperature == null
                ? '0'
                : dataaa?.temperature.toString();
            String? city = dataaa?.cityName;
            String? stateNow = dataaa?.overallState;
            String? feelsLike = dataaa?.feelsLike.toString();
            String? icon = dataaa?.iconCode ?? '04d';
            if (snapshot.connectionState == ConnectionState.done) {
              return Column(children: [
                currentWeather("$tempNow", "$city", stateNow!, feelsLike!, icon,
                    dataaa!.minTemp!.toString(), dataaa!.maxTemp!.toString()),
              ]);
            } else {
              return loadingText();
            }
          },
        ),
      ),
    );
  }

  Center loadingText() {
    return const Center(
        child: CircularProgressIndicator(
      color: Colors.black87,
    ));
  }
}
