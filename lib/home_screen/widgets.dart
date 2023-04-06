import 'package:flutter/material.dart';
import 'package:weather_app/constants/constant_widgets.dart';

Widget currentWeather(
  String temp,
  String location,
  String state,
  String feelsLike,
  String icon,
  String minTemp,
  String maxTemp,
) {
  return Center(
    child: Column(
      children: [
        heightox10,
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    'http://openweathermap.org/img/w/$icon.png',
                  ),
                  fit: BoxFit.cover)),
        ),
        // Icon(
        //   iconIn,
        //   color: Colors.orange,
        //   size: 60,
        // ),
        heightox10,
        Text(
          location,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: Colors.black87,
          ),
        ),
        heightox10,
        Text(
          '$temp °C',
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 66),
        ),
        heightox10,
        Text(
          'Feels Like $feelsLike',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black54,
          ),
        ),
        heightox20,
        Text(
          state,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        heightox20,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            tempContainer(
                iconTemp: const Icon(
                  Icons.sunny,
                  color: Colors.orange,
                  size: 35,
                ),
                tempType: 'Max.',
                temperature: maxTemp),
            tempContainer(
                iconTemp: const Icon(
                  Icons.cloudy_snowing,
                  color: Colors.lightBlue,
                  size: 35,
                ),
                tempType: "Min.",
                temperature: minTemp)
          ],
        )
      ],
    ),
  );
}

class tempContainer extends StatelessWidget {
  tempContainer({
    Key? key,
    required this.iconTemp,
    required this.tempType,
    required this.temperature,
  }) : super(key: key);
  String temperature;
  Icon iconTemp;
  String tempType;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      decoration: BoxDecoration(
          border:
              Border.all(width: 3, color: Color.fromARGB(255, 143, 211, 145)),
          borderRadius: BorderRadius.circular(10),
          color: Color.fromARGB(255, 167, 233, 169)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(tempType),
          Text("nTemperature"),
          iconTemp,
          Text(
            '$temperature °C',
            style: TextStyle(fontSize: 24),
          )
        ],
      ),
    );
  }
}
