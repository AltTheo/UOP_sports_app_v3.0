enum Environment { dev, staging, prod }

abstract class Appconfig {
  static late String baseApiUrl;
  static late String title;
  static late bool debugBanner;
  static late Environment _environment;

  static Environment get environment => _environment;

  static void setupEnv(Environment env) {
    _environment = env;
    switch (env) {
      case Environment.dev:
        {
          title = 'Development Environment';
          debugBanner = true;
          break;
        }
      case Environment.staging:
        {
          title = 'Staging Environment';
          debugBanner = true;
          break;
        }
      case Environment.prod:
        {
          title = 'Production Environment';
          debugBanner = true;
          break;
        }
    }
  }
}
