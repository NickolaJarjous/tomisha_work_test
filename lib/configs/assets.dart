class Assets {
  Assets();

  static final String _basePath = 'assets/images';

  static String get logo {
    return "$_basePath/logo.svg";
  }

  static String empty = "$_basePath/empty.json";
  static String error = "$_basePath/error.png";
  static String slide2Bg = "$_basePath/slide2_bg.png";
  static String slide2BgPhone = "$_basePath/slide2_bg_phone.png";
}
