class LoginAssets {
  static const String eyeOff = 'assets/icon/eye_off.svg';
  static const String eyeOn = 'assets/icon/eye_on.svg';
}

class HomeIcon {
  static const String pin = 'assets/icon/pin.svg';
  static const String bigCloudLightning = 'assets/big_icon/cloud_lightning.png';
  static const String bigCloudRain = 'assets/big_icon/cloud_rain.png';
  static const String bigCloudSnow = 'assets/big_icon/cloud_snow.png';
  static const String bigRain = 'assets/big_icon/rain.png';
  static const String bigSunCloudRain = 'assets/big_icon/sun_cloud_rain.png';
  static const String bigSun = 'assets/big_icon/sun.png';
  static const String smallcCoudLightning =
      'assets/small_icon/cloud_lightning.png';
  static const String smallCloudMoon = 'assets/small_icon/cloud_moon.png';
  static const String smallCloudRain = 'assets/small_icon/cloud_rain.png';
  static const String smallCloudSnow = 'assets/small_icon/cloud_snow.png';
  static const String smallCLoudSun = 'assets/small_icon/cloud_sun.png';
  static const String smallSun = 'assets/small_icon/sun.png';
  static const String wind = 'assets/icon/wind.svg';
  static const String drop = 'assets/icon/drop.svg';

  static String getCodeIcon(String? value, {bool smallIcon = false}) {
    switch (value) {
      case '01d':
        return smallIcon ? smallSun : bigSun; // 	чистое небо
      case '02d':
        return smallIcon ? smallCLoudSun : bigSun; // 	несколько облаков
      case '03d':
        return smallIcon ? smallCLoudSun : bigSun; // 	рассеянные облака
      case '04d':
        return smallIcon ? smallCLoudSun : bigSunCloudRain; // 	разбитые облака
      case '09d':
        return smallIcon ? smallCloudRain : bigCloudRain; // 	небольшой дождь
      case '10d':
        return smallIcon ? smallCloudRain : bigRain; // 	 дождь
      case '11d':
        return smallIcon ? smallcCoudLightning : bigCloudLightning; // 	 гроза
      case '13d':
        return smallIcon ? smallCloudSnow : bigCloudSnow; // 	 снег
      case '50d':
        return smallIcon ? smallCloudRain : bigSunCloudRain; // 	 туман
      case '01n':
        return smallIcon ? smallCloudMoon : bigSun; // 	чистое небо
      case '02n':
        return smallIcon ? smallCloudMoon : bigSun; // 	несколько облаков
      case '03n':
        return smallIcon ? smallCloudMoon : bigSun; // 	рассеянные облака
      case '04n':
        return smallIcon ? smallCloudMoon : bigSunCloudRain; // 	разбитые облака
      case '09n':
        return smallIcon ? smallCloudRain : bigCloudRain; // 	небольшой дождь
      case '10n':
        return smallIcon ? smallCloudRain : bigRain; // 	 дождь
      case '11n':
        return smallIcon ? smallcCoudLightning : bigCloudLightning; // 	 гроза
      case '13n':
        return smallIcon ? smallCloudSnow : bigCloudSnow; // 	 снег
      case '50n':
        return smallIcon ? smallCloudRain : bigSunCloudRain; // 	 туман
    }

    return smallIcon ? smallSun : bigSun;
  }
}
