import 'package:flutter/material.dart';

Widget weatherItemWidget(BuildContext context) {
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
              const Text('10AM'),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: Image.network(
                    'https://cdn.weatherapi.com/weather/64x64/night/116.png'),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('26°C'),
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
