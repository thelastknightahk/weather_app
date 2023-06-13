import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wealther_app/domain/entities/weather/current_model.dart';
import 'package:wealther_app/domain/entities/weather/forcast_model.dart';
import 'package:wealther_app/domain/entities/weather/location_model.dart';

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

  Future<int> insertCurrentWeatherData(
      LocationModel locationModel, CurrentModel currentModel) async {
    Database? db = await instance.database;

    return await db!.insert(currentTable, {
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

  Future<void> insertHourWeatherData(
      String cityName, ForecastModel forecastModel) async {
    Database? db = await instance.database;
    List<ForecastDay> forecastDays = forecastModel.forecastday!;
    for (var day = 0; day < forecastDays.length; day++) {
      ForecastDay forecastDay = forecastDays[day];
      for (var hour = 0; hour < forecastDay.hour!.length; hour++) {
        Hour hourData = forecastDay.hour![hour];
        await db!.insert(forecastTable, {
          forecastCity: cityName,
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
  }

  Future<List<Map<String, dynamic>>> fetchCurrentData() async {
    Database? db = await instance.database;
    return await db!.query(currentTable);
  }

  Future<List<Map<String, dynamic>>> fetchForecastData() async {
    Database? db = await instance.database;
    return await db!.query(forecastTable);
  }

  Future<List<Map<String, dynamic>>> fetchForecastCityData(
      String forecastName) async {
    Database? db = await instance.database;
    return await db!.query(forecastTable,
        where: '$forecastCity = ?', whereArgs: [forecastName]);
  }

  Future<int> deleteData(int id) async {
    Database? db = await instance.database;
    return await db!
        .delete(currentTable, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteForecastData(String cityName) async {
    Database? db = await instance.database;
    return await db!.delete(forecastTable,
        where: '$forecastCity = ?', whereArgs: [cityName]);
  }
}
