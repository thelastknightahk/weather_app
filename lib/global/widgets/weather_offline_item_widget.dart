import 'package:flutter/material.dart';
import 'package:wealther_app/domain/entities/weather/hour.dart';
import 'package:wealther_app/global/helper/function_helper.dart';

Widget weatherOfflineItemWidget(BuildContext context, Hour hourData) {
  return Column(
    children: [
      Card(
        elevation: 2,
        child: SizedBox(
          width: 150,
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
                child:  Text('${hourData.condition!.text }', textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black54),
                ),
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
