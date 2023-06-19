import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wealther_app/domain/entities/user/city_info.dart';
import 'package:wealther_app/global/helper/function_helper.dart';
import 'package:wealther_app/injection/injector.dart';
import 'package:wealther_app/presentation/bloc/weather/weather_forecast_cubit.dart';
import '../../../domain/entities/user/city_offline.dart';
import '../../../global/global_exports.dart';
import '../../bloc/save/weather_forecast_save_cubit.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  final WeatherForecastCubit _weatherForecastCubit =
      injector.get<WeatherForecastCubit>();
  final WeatherForecastSaveCubit _weatherForecastSaveCubit =
  injector.get<WeatherForecastSaveCubit>();
  @override
  Widget build(BuildContext context) {
    var fullWidth = displayWidth(context);
    var fullHeight = displayHeight(context);

    return BlocConsumer<WeatherForecastCubit, WeatherForecastState>(
        bloc: _weatherForecastCubit,
        listener: (BuildContext context, WeatherForecastState state) {
          if (state.appEntity != null) {
            FocusManager.instance.primaryFocus?.unfocus();
            _weatherForecastSaveCubit.getCitiesList().then((value) {
              List<CityOffline> cityDbList = _weatherForecastSaveCubit.state.cityListAppEntity!.entity!;


              String cityNameToFind = _weatherForecastCubit.state.appEntity!.entity!.location!.name!.toString();

              CityOffline? city = cityDbList.firstWhere(
                    (city) => city.locationModel.name == cityNameToFind,
              );

              if (city != null) {
                _weatherForecastCubit.setCityFound(true);
                _weatherForecastSaveCubit.setSelectedCityId(city!.cityId!);
              } else {

              }

            });
          }
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 100),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                FunctionsHelper.timeGreeting(),
                                style: const TextStyle(
                                    fontSize: 37, color: Colors.black54),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.go('/offline');
                                    },
                                    child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Icon(
                                          Icons.bookmark,
                                          color: Colors.black.withOpacity(0.7),
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      context.go('/admin');
                                    },
                                    child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            borderRadius:
                                                BorderRadius.circular(4)),
                                        child: Icon(
                                          Icons.admin_panel_settings_sharp,
                                          color: Colors.black.withOpacity(0.7),
                                        )),
                                  ),
                                ],
                              ),
                            ],
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
                                      state.appEntity == null
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
                                          state.appEntity == null
                                              ? ''
                                              : '${state.appEntity!.entity!.location!.name}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black54),
                                        ),
                                        state.appEntity == null
                                            ? Container()
                                            : state.cityFound == true ?
                                        InkWell(
                                            onTap: () async {
                                              if(_weatherForecastSaveCubit.state.saveSelectedCityId != null){
                                                _weatherForecastSaveCubit.deleteCityData(CityInfo(
                                                  cityName:state.appEntity!.entity!.location!.name ,
                                                  cityId: _weatherForecastSaveCubit.state!.saveSelectedCityId!,
                                                ) );
                                                _weatherForecastCubit.setCityFound(false);
                                              }
                                              else{
                                                List<CityOffline> cityDbList = _weatherForecastSaveCubit.state.cityListAppEntity!.entity!;


                                                String cityNameToFind = _weatherForecastCubit.state.appEntity!.entity!.location!.name!.toString();

                                                CityOffline? city = cityDbList.firstWhere(
                                                      (city) => city.locationModel.name == cityNameToFind,
                                                );
                                                _weatherForecastSaveCubit.deleteCityData(CityInfo(
                                                  cityName:state.appEntity!.entity!.location!.name ,
                                                  cityId: city!.cityId,
                                                ) );
                                                _weatherForecastCubit.setCityFound(false);
                                              }

                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                content: Text("Deleted ${state.appEntity!.entity!.location!.name }"),
                                              ));
                                            },
                                            child: const Icon(
                                                Icons.bookmark)):
                                        InkWell(
                                                onTap: () async {
                                                  _weatherForecastSaveCubit.saveCityData(state.appEntity!.entity!);
                                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                    content: Text("Saved"),
                                                  ));
                                                  _weatherForecastCubit.setCityFound(true);
                                                  },
                                                child: const Icon(
                                                    Icons.bookmark_border)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                child: state.appEntity == null
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
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              state.appEntity == null
                                                  ? ''
                                                  : FunctionsHelper
                                                      .convertDateFormat(
                                                          '${state.appEntity!.entity!.location!.localtime}'),
                                              style: const TextStyle(
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
                    state.appEntity == null
                        ? Container()
                        : Container(
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
                                      itemCount:
                                          FunctionsHelper.dayList().length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            _weatherForecastCubit
                                                .setSelectedIndex(index);
                                          },
                                          child: dayItemWidget(
                                              context,
                                              FunctionsHelper.dayList()[index]
                                                  .dayName,
                                              state.appEntity == null
                                                  ? FunctionsHelper.dayList()[
                                                          index]
                                                      .selected
                                                  : state.selectedIndex ==
                                                      index),
                                        );
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
                                        var hourData = state
                                            .appEntity!
                                            .entity!
                                            .forecast!
                                            .forecastday![state.selectedIndex!]
                                            .hour!;
                                        return weatherItemWidget(
                                            context, hourData[index]);
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
