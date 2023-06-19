import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:wealther_app/domain/entities/user/city_info.dart';
import 'package:wealther_app/domain/entities/weather/forcast_model.dart';
import 'package:wealther_app/global/widgets/weather_offline_item_widget.dart';

import '../../../global/helper/function_helper.dart';
import '../../../global/size/display_size.dart';
import '../../../global/widgets/day_item_widget.dart';
import '../../../injection/injector.dart';
import '../../bloc/save/weather_forecast_save_cubit.dart';
import '../../bloc/weather/weather_forecast_cubit.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});
  final WeatherForecastSaveCubit _weatherForecastSaveCubit =
      injector.get<WeatherForecastSaveCubit>();
  final WeatherForecastCubit _weatherForecastCubit =
  injector.get<WeatherForecastCubit>();
  Future<ForecastModel> fetchData() async {
    if (_weatherForecastSaveCubit.state.cityDetailAppEntity == null) {
      var cityData = _weatherForecastSaveCubit.state.cityListAppEntity!
          .entity![_weatherForecastSaveCubit.state.saveSelectedCityIndex!];
      _weatherForecastSaveCubit
          .getCityDetailInfo("${cityData.locationModel.name}");
    }
    return _weatherForecastSaveCubit.state.cityDetailAppEntity!.entity!;
  }

  @override
  Widget build(BuildContext context) {
    var fullWidth = displayWidth(context);
    var fullHeight = displayHeight(context);
    var cityData = _weatherForecastSaveCubit.state.cityListAppEntity!
        .entity![_weatherForecastSaveCubit.state.saveSelectedCityIndex!];
    return BlocConsumer<WeatherForecastSaveCubit, WeatherForecastSaveState>(
        bloc: _weatherForecastSaveCubit,
        listener: (BuildContext context, WeatherForecastSaveState state) {},
        builder: (BuildContext context, WeatherForecastSaveState state) {
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
                child: FutureBuilder<ForecastModel>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (state.cityDetailAppEntity == null) {
                        return Center(
                            child: SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator()));
                      }
                      return SafeArea(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            InkWell(
                                onTap: () {
                                  context.pop();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                                  child: Icon(Icons.arrow_back_ios_new,
                                      color: Colors.black54),
                                )),
                            Container(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: fullWidth,
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        margin:
                                        const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.7),
                                            borderRadius: BorderRadius.circular(10)),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                    '${cityData.currentModel.tempC }°C',
                                                    style: const TextStyle(
                                                        fontSize: 40,
                                                        color: Colors.black54),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    children: [
                                                      const Icon(Icons.location_on),
                                                      Text(
                                                        '${cityData.locationModel.name}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black54),
                                                      ),
                                                      InkWell(
                                                          onTap: () async {


                                                            _weatherForecastSaveCubit.deleteCityData(CityInfo(
                                                              cityId: cityData.cityId! ,
                                                              cityName: cityData.locationModel.name
                                                            ));
                                                            _weatherForecastSaveCubit.updateFetchData(false);
                                                            if(cityData.locationModel.name.toString().trim() ==
                                                                "${_weatherForecastCubit.state.appEntity!.entity!.location!.name}".toString().trim()){
                                                              _weatherForecastCubit.setCityFound(false);
                                                            }

                                                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                                              content: Text("Deleted ${cityData.locationModel.name }"),
                                                            ));
                                                            Future.delayed(const Duration(milliseconds: 1000),(){
                                                              context.pop();
                                                            });

                                                          },
                                                          child: const Icon(
                                                              Icons.bookmark)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        '${cityData.currentModel.condition!.text!}',
                                                        style: const TextStyle(
                                                            fontSize: 20,
                                                            color: Colors.black54),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                  Container(
                                      width: fullWidth,
                                      height: fullHeight / 3.5,
                                      margin:
                                      const EdgeInsets.symmetric(horizontal: 10),
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
                                                      _weatherForecastSaveCubit
                                                          .setSelectedDayIndex(index);
                                                    },
                                                    child: dayItemWidget(
                                                        context,
                                                        FunctionsHelper.dayList()[index]
                                                            .dayName,
                                                        state.saveSelectedDayIndex ==
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
                                                      .cityDetailAppEntity!
                                                      .entity!
                                                      .forecastday![
                                                  state.saveSelectedDayIndex!]
                                                      .hour!;
                                                  return weatherOfflineItemWidget(
                                                      context, hourData[index]);
                                                }),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
              ),
            ),
          );
        });
  }
}
