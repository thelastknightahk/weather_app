import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wealther_app/global/helper/function_helper.dart';
import 'package:wealther_app/injection/injector.dart';
import 'package:wealther_app/presentation/bloc/weather/weather_forecast_cubit.dart';
import '../../../global/global_exports.dart';
import 'package:intl/intl.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  final WeatherForecastCubit _weatherForecastCubit =
      injector.get<WeatherForecastCubit>();
  @override
  Widget build(BuildContext context) {
    var fullWidth = displayWidth(context);
    var fullHeight = displayHeight(context);
    dynamic cityResult = '';
    return BlocConsumer<WeatherForecastCubit, WeatherForecastState>(
        bloc: _weatherForecastCubit,
        listener: (BuildContext context, WeatherForecastState state) {
          log("Clicked Return $state");
        },
        builder: (BuildContext context, WeatherForecastState state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: fullWidth,
                height: fullHeight,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        opacity: 0.8,
                        fit: BoxFit.fitHeight,
                        image:
                            AssetImage('assets/images/evening_pic_one.jpeg'))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 100),
                          child: Text(
                            'Good Morning!',
                            style:
                                TextStyle(fontSize: 40, color: Colors.black54),
                          ),
                        ),
                        Container(
                          width: fullWidth,
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 8),
                                  child: autoCompleteTextField(context)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Text(
                                      state.appEntity!.entity == null
                                          ? '0°C'
                                          : '${state.appEntity!.entity!.current!.tempC!.toInt()}°C',
                                      style: const TextStyle(
                                          fontSize: 40, color: Colors.black54),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.location_on),
                                        Text(
                                          state.appEntity!.entity == null
                                              ? ''
                                              : '${state.appEntity!.entity!.location!.name}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                child: state.appEntity!.entity == null
                                    ? const SizedBox(
                                        height: 65,
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Image.network(
                                                  'https:${state.appEntity!.entity!.current!.condition!.icon}'),
                                              Text(
                                                '${state.appEntity!.entity!.current!.condition!.text}',
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.black54),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              state.appEntity!.entity == null
                                                  ? ''
                                                  : FunctionsHelper
                                                      .convertDateFormat(
                                                          '${state.appEntity!.entity!.location!.localtime}'),
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                        width: fullWidth,
                        height: fullHeight / 3.5,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 50,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: FunctionsHelper.dayList().length,
                                  itemBuilder: (context, index) {
                                    return dayItemWidget(
                                        context,
                                        FunctionsHelper.dayList()[index]
                                            .dayName,
                                        FunctionsHelper.dayList()[index]
                                            .selected);
                                  }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: fullWidth,
                              height: fullHeight / 6,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: 24,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                        child: weatherItemWidget(context));
                                  }),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
