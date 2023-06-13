import 'package:flutter/material.dart';
import 'package:wealther_app/global/constants/app_styles.dart';
import 'package:wealther_app/global/constants/city_constant.dart';

import '../../injection/injector.dart';
import '../../presentation/bloc/weather/weather_forecast_cubit.dart';

Widget autoCompleteTextField(BuildContext context) {
  final WeatherForecastCubit weatherForecastCubit =
      injector.get<WeatherForecastCubit>();
  return Autocomplete(
    optionsBuilder: (TextEditingValue textEditingValue) {
      if (textEditingValue.text == '') {
        return const Iterable<String>.empty();
      } else {
        List<String> matches = <String>[];
        matches.addAll(cityList);

        matches.retainWhere((s) {
          return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
        });
        return matches;
      }
    },
    fieldViewBuilder: (BuildContext context,
        TextEditingController textEditingController,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted) {
      return TextFormField(
          decoration: getInputDecoration(
            hint: 'Search City Name',
            darkMode: false,
          ),
          controller: textEditingController,
          focusNode: focusNode,
          cursorColor: Colors.black38);
    },
    optionsViewBuilder: (BuildContext context, void Function(String) onSelected,
        Iterable<String> options) {
      List myCity = options.toList();
      return Material(
        color: Colors.white.withOpacity(0.0),
        child: SizedBox(
            height: 100,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: myCity.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onSelected(myCity[index]);
                    },
                    child: Container(
                        padding: const EdgeInsets.only(right: 30),
                        child: Card(
                            child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          child: Text(myCity[index]),
                        ))),
                  );
                })),
      );
    },
    onSelected: (String selection) {
      weatherForecastCubit.fetchWeatherData(selection);
    },
  );
}
