import 'package:flutter/material.dart';
import 'package:wealther_app/domain/entities/weather/hour.dart';
import 'package:wealther_app/global/helper/function_helper.dart';

Widget weatherItemWidget(BuildContext context, Hour hourData) {
  return Column(
    children: [
      Card(
        elevation: 2,
        child: SizedBox(
          width: 80,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(FunctionsHelper.convertDateFormat(hourData.time!)),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: Image.network('https:${hourData.condition!.icon!}'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text('${hourData.tempC!.toInt()}°C'),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
