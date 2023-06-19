class HourOffline {
  String forecastCity;
  String forecastDate;
  String hourTime;
  double hourTempC;
  double hourTempF;
  int hourIsDay;
  String hourConditionText;
  String hourConditionIcon;
  int hourConditionCode;
  int hourWillItRain;
  int hourChanceOfRain;
  HourOffline({
    required this.forecastCity,
    required this.forecastDate,
    required this.hourTime,
    required this.hourTempC,
    required this.hourTempF,
    required this.hourIsDay,
    required this.hourConditionText,
    required this.hourConditionIcon,
    required this.hourConditionCode,
    required this.hourWillItRain,
    required this.hourChanceOfRain,
  });
}
