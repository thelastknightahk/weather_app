import 'package:wealther_app/domain/entities/weather/current_model.dart';
import 'package:wealther_app/domain/entities/weather/location_model.dart';

class CityOffline {
  int? cityId;
  LocationModel locationModel;
  CurrentModel currentModel;
  CityOffline({
    this.cityId,
    required this.locationModel,
    required this.currentModel,
  });
}
