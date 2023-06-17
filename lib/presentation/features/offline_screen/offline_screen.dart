import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wealther_app/domain/entities/user/city_offline.dart';
import 'package:wealther_app/presentation/bloc/save/weather_forecast_save_cubit.dart';

import '../../../global/size/display_size.dart';
import '../../../injection/injector.dart';

class OfflineScreen extends StatelessWidget {
  OfflineScreen({super.key});
  final WeatherForecastSaveCubit _weatherForecastSaveCubit =
      injector.get<WeatherForecastSaveCubit>();
  Future<List<CityOffline>> fetchData() async {
    if (_weatherForecastSaveCubit.state.cityListAppEntity == null) {
      _weatherForecastSaveCubit.getCitiesList();
    }
    return _weatherForecastSaveCubit.state.cityListAppEntity!.entity!;
  }

  @override
  Widget build(BuildContext context) {
    var fullWidth = displayWidth(context);

    return BlocConsumer<WeatherForecastSaveCubit, WeatherForecastSaveState>(
        bloc: _weatherForecastSaveCubit,
        listener: (BuildContext context, WeatherForecastSaveState state) {},
        builder: (BuildContext context, WeatherForecastSaveState state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          InkWell(
                              onTap: () {
                                context.pop();
                              },
                              child: Icon(Icons.arrow_back_ios_new,
                                  color: Colors.black54)),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Favorite ',
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 25,
                                color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: FutureBuilder<List<CityOffline>>(
                          future: fetchData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator()));
                            } else if (snapshot.hasError) {
                              return Text('Error: ${snapshot.error}');
                            } else if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount:
                                      state.cityListAppEntity!.entity!.length,
                                  itemBuilder: (context, index) {
                                    var city =
                                        state.cityListAppEntity!.entity![index];
                                    return InkWell(
                                      onTap: () {
                                        _weatherForecastSaveCubit
                                            .setSelectedCityIndex(index);
                                        context.push('/detail');
                                        //context.go('/detail');
                                      },
                                      child: Card(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: Container(
                                            width: fullWidth,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 2.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(
                                                        Icons.location_on,
                                                        size: 17,
                                                      ),
                                                      Text(
                                                        '${city.locationModel.name}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        '${'${city.currentModel.tempC!.toInt()}'}°C',
                                                        style: const TextStyle(
                                                            fontSize: 30,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                      Text(
                                                        '${'${city.currentModel.condition!.text}'}',
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            color:
                                                                Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            } else {
                              return Text('No data available');
                            }
                          }),
                    ),
                  ],
                ),
              ));
        });
  }
}
