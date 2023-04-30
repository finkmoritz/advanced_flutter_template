# Advanced Flutter Template

A new Flutter project with advanced setup:

- State management (provider)
- Routing (go_router)
- Theming (Flex color scheme, Google fonts, Font Awesome icons)
- Internationalization
- Launcher and splash icon
- Test case with Provider mocks

<img src="https://github.com/finkmoritz/advanced_flutter_template/blob/master/screenshot.png" alt="Screenshot" width="200"/>

## Getting Started

### Setup
Before you start, follow these steps:
1. Execute ```flutter pub get``` to pull dependencies
2. Execute ```flutter gen-l10n``` to generate translations

### Run
Execute ```flutter run``` or use the respective Flutter plugin for your IDE.

### Test
Execute ```flutter test test``` to run the test cases.

## Customization

### Package Name
Change the package name of this app by executing 
```
flutter pub run change_app_package_name:main com.new.package.name
```
(uses [change_app_package_name](https://pub.dev/packages/change_app_package_name))

### Routing
Add and remove routes in [my_router_config](lib/router/my_router_config.dart) in order to 
implement your custom navigation logic 
(see also [go_router](https://pub.dev/packages/go_router)).

### Theme
If you want to change the app's theme, have a look at the
[ThemeProviderImpl](lib/providers/theme/theme_provider_impl.dart).
Here you can change color schemes and fonts according to your needs.
(see also [flex_color_scheme](https://pub.dev/packages/flex_color_scheme))

### Custom Icon
You can customize launcher and splash icons by
1. Replacing [icon.png](assets/icon.png) with your custom image
2. Executing ```flutter pub run flutter_launcher_icons``` (uses [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons))
3. Executing ```flutter pub run flutter_native_splash:create``` (uses [flutter_native_splash](https://pub.dev/packages/flutter_native_splash))

### Internationalization
In order to add a new language, just add a new file with translations to the
[l10n](lib/l10n) folder and execute ```flutter gen-l10n```.
For more details see also the [official documentation](https://docs.flutter.dev/development/accessibility-and-localization/internationalization).
