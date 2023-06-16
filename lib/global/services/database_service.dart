import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wealther_app/domain/entities/user/city_info.dart';
import 'package:wealther_app/domain/entities/weather/current_model.dart';
import 'package:wealther_app/domain/entities/weather/forcast_model.dart';
import 'package:wealther_app/domain/entities/weather/location_model.dart';
import 'package:wealther_app/domain/entities/weather/weather_model.dart';

import '../../domain/entities/user/city_offline.dart';
import '../../domain/entities/weather/condition_model.dart';
import '../../domain/entities/weather/forecast_day.dart';
import '../../domain/entities/weather/hour.dart';

class DatabaseService {
  static const _databaseName = "weather_database.db";
  static const _databaseVersion = 1;

  static const currentTable = 'currentTable';
  static const forecastTable = 'forecastTable';
  static const columnId = '_id';

  // location key
  static const locationName = 'locationName';
  static const locationRegion = 'locationRegion';
  static const locationCountry = 'locationCountry';
  static const locationLat = 'locationLat';
  static const locationLng = 'locationLng';
  static const locationTzId = 'locationTzId';
  static const locationLocalTime = 'locationLocalTime';

  // current key

  static const currentTempC = 'currentTempC';
  static const currentTempF = 'currentTempF';
  static const currentIsDay = 'currentIsDay';
  static const currentConditionText = 'currentConditionText';
  static const currentConditionIcon = 'currentConditionIcon';
  static const currentConditionCode = 'currentConditionCode';
  static const currentPressureMb = 'currentPressureMb';
  static const currentPressureIn = 'currentPressureIn';
  static const currentHumidity = 'currentHumidity';
  static const currentCloud = 'currentCloud';
  static const currentFeelTempC = 'currentFeelTempC';
  static const currentFeelTempF = 'currentFeelTempF';

  // forecast day key

  static const forecastDate = 'forecastDate';
  static const forecastCity = 'forecastCity';
  // forecast hour key

  static const hourTime = 'hourTime';
  static const hourTempC = 'hourTempC';
  static const hourTempF = 'hourTempF';
  static const hourIsDay = 'hourIsDay';
  static const hourConditionText = 'hourConditionText';
  static const hourConditionIcon = 'hourConditionIcon';
  static const hourConditionCode = 'hourConditionCode';
  static const hourWillItRain = 'hourWillItRain';
  static const hourChanceOfRain = 'hourChanceOfRain';
  DatabaseService();
  DatabaseService._privateConstructor();
  static final DatabaseService instance = DatabaseService._privateConstructor();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $currentTable (
        $columnId INTEGER PRIMARY KEY,
        $locationName TEXT NOT NULL,
        $locationRegion TEXT NOT NULL,
        $locationCountry TEXT NOT NULL,
        $locationLat REAL NOT NULL,
        $locationLng REAL NOT NULL,
        $locationTzId TEXT NOT NULL,
        $locationLocalTime TEXT NOT NULL,
        $currentTempC REAL NOT NULL,
        $currentTempF REAL NOT NULL,
        $currentIsDay INTEGER NOT NULL,
        $currentConditionText TEXT NOT NULL,
        $currentConditionIcon TEXT NOT NULL,
        $currentConditionCode INTEGER NOT NULL,
        $currentPressureMb REAL NOT NULL,
        $currentPressureIn REAL NOT NULL,
        $currentHumidity INTEGER NOT NULL,
        $currentCloud INTEGER NOT NULL, 
        $currentFeelTempC REAL NOT NULL,
        $currentFeelTempF REAL NOT NULL
      )
      ''');
    await db.execute('''
      CREATE TABLE $forecastTable (
        $columnId INTEGER PRIMARY KEY,
        $forecastCity TEXT NOT NULL,
        $forecastDate TEXT NOT NULL,
        $hourTime TEXT NOT NULL,
        $hourTempC REAL NOT NULL,
        $hourTempF REAL NOT NULL, 
        $hourIsDay INTEGER NOT NULL,
        $hourConditionText TEXT NOT NULL,
        $hourConditionIcon TEXT NOT NULL,
        $hourConditionCode INTEGER NOT NULL, 
        $hourWillItRain INTEGER NOT NULL,
        $hourChanceOfRain INTEGER NOT NULL 
      )
      ''');
  }

  Future<void> insertCityData(WeatherModel weatherModel) async {
    Database? db = await instance.database;
    LocationModel locationModel = weatherModel.location!;
    CurrentModel currentModel = weatherModel.current!;
    List<ForecastDay> forecastDays = weatherModel.forecast!.forecastday!;
    for (var day = 0; day < forecastDays.length; day++) {
      ForecastDay forecastDay = forecastDays[day];
      for (var hour = 0; hour < forecastDay.hour!.length; hour++) {
        Hour hourData = forecastDay.hour![hour];
        await db!.insert(forecastTable, {
          forecastCity: weatherModel.location!.name!,
          forecastDate: forecastDay.date,
          hourTime: hourData.time,
          hourTempC: hourData.tempC,
          hourTempF: hourData.tempF,
          hourIsDay: hourData.isDay,
          hourConditionText: hourData.condition!.text,
          hourConditionIcon: hourData.condition!.icon,
          hourConditionCode: hourData.condition!.code,
          hourWillItRain: hourData.willItRain,
          hourChanceOfRain: hourData.chanceOfRain
        });
      }
    }

    await db!.insert(currentTable, {
      locationName: locationModel.name,
      locationRegion: locationModel.region,
      locationCountry: locationModel.country,
      locationLat: locationModel.lat,
      locationLng: locationModel.lon,
      locationTzId: locationModel.tzId,
      locationLocalTime: locationModel.localtime,
      currentTempC: currentModel.tempC,
      currentTempF: currentModel.tempC,
      currentIsDay: currentModel.isDay,
      currentConditionText: currentModel.condition!.text,
      currentConditionIcon: currentModel.condition!.icon,
      currentConditionCode: currentModel.condition!.code,
      currentPressureMb: currentModel.pressureMb,
      currentPressureIn: currentModel.pressureIn,
      currentHumidity: currentModel.humidity,
      currentCloud: currentModel.cloud,
      currentFeelTempC: currentModel.feelslikeC,
      currentFeelTempF: currentModel.feelslikeF,
    });
  }

  Future<void> deleteData(CityInfo cityInfo) async {
    Database? db = await instance.database;
    db!
      ..delete(currentTable,
          where: '$columnId = ?', whereArgs: [cityInfo.cityId])
      ..delete(forecastTable,
          where: '$forecastCity = ?', whereArgs: [cityInfo.cityName]);
  }

  Future<List<CityOffline>> fetchCitiesData() async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> fetchCurrentData = await db!.query(currentTable);
    List<CityOffline> cityOfflineList = [];
    for (var cityIndex = 0; cityIndex < fetchCurrentData.length; cityIndex++) {
      LocationModel locationModel = LocationModel(
          country: fetchCurrentData[cityIndex]['locationCountry'],
          lat: fetchCurrentData[cityIndex]['locationLat'],
          localtime: fetchCurrentData[cityIndex]['locationLocalTime'],
          lon: fetchCurrentData[cityIndex]['locationLng'],
          name: fetchCurrentData[cityIndex]['locationName'],
          region: fetchCurrentData[cityIndex]['locationRegion'],
          tzId: fetchCurrentData[cityIndex]['locationTzId']);
      CurrentModel currentModel = CurrentModel(
          tempC: fetchCurrentData[cityIndex]['currentTempC'],
          tempF: fetchCurrentData[cityIndex]['currentTempF'],
          isDay: fetchCurrentData[cityIndex]['currentIsDay'],
          condition: ConditionModel(
              code: fetchCurrentData[cityIndex]['currentConditionCode'],
              icon: fetchCurrentData[cityIndex]['currentConditionIcon'],
              text: fetchCurrentData[cityIndex]['currentConditionText']),
          pressureMb: fetchCurrentData[cityIndex]['currentPressureMb'],
          pressureIn: fetchCurrentData[cityIndex]['currentPressureIn'],
          humidity: fetchCurrentData[cityIndex]['currentHumidity'],
          cloud: fetchCurrentData[cityIndex]['currentCloud'],
          feelslikeC: fetchCurrentData[cityIndex]['currentFeelTempC'],
          feelslikeF: fetchCurrentData[cityIndex]['currentFeelTempF']);
      cityOfflineList.add(CityOffline(
          locationModel: locationModel, currentModel: currentModel));
    }
    return cityOfflineList;
  }

  Future<ForecastModel> fetchForecastCityData(String cityName) async {
    Database? db = await instance.database;
    List<Map<String, dynamic>> fetchForecastCityData = await db!.query(
        forecastTable,
        where: '$forecastCity = ?',
        whereArgs: [cityName]);
    List<ForecastDay> forecastDayList = [];
    List<Hour> hourList = [];

    for (var hour = 0; hour < fetchForecastCityData.length; hour++) {
      hourList.add(Hour(
          time: fetchForecastCityData[hour]['hourTime'],
          tempC: fetchForecastCityData[hour]['hourTempC'],
          tempF: fetchForecastCityData[hour]['hourTempF'],
          isDay: fetchForecastCityData[hour]['hourIsDay'],
          condition: ConditionModel(
              text: fetchForecastCityData[hour]['hourConditionText'],
              icon: fetchForecastCityData[hour]['hourConditionIcon'],
              code: fetchForecastCityData[hour]['hourConditionCode']),
          willItRain: fetchForecastCityData[hour]['hourWillItRain'],
          chanceOfRain: fetchForecastCityData[hour]['hourChanceOfRain']));
    }

    for (var day = 0; day < 3; day++) {
      if (day == 0) {
        forecastDayList.add(ForecastDay(
            date: fetchForecastCityData[day]['forecastDate'],
            hour: hourList.sublist(0, 24)));
      } else if (day == 1) {
        forecastDayList.add(ForecastDay(
            date: fetchForecastCityData[day]['forecastDate'],
            hour: hourList.sublist(24, 48)));
      } else {
        forecastDayList.add(ForecastDay(
            date: fetchForecastCityData[day]['forecastDate'],
            hour: hourList.sublist(48, 72)));
      }
    }
    ForecastModel forecastModel = ForecastModel(forecastday: forecastDayList);
    return forecastModel;
  }
}
