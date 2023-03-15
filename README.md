# test_app

Mobile App Exercise

# Packages Use
- flutter_native_splash: ^2.2.19 - used in https://github.com/kentlee10/test_app/blob/main/flutter_native_splash.yaml
- pull_to_refresh: ^2.0.0 - used in https://github.com/kentlee10/test_app/blob/main/lib/widgets/main_screen_body/body_country.dart, etc.
- chopper: ^6.1.1 - used in https://github.com/kentlee10/test_app/blob/main/lib/utilities/api_service.dart
- provider: ^6.0.5 - used in https://github.com/kentlee10/test_app/blob/main/lib/provider/main_provider.dart
- xml2json: ^5.3.6 - used in https://github.com/kentlee10/test_app/blob/main/lib/provider/main_provider.dart
- url_launcher: ^6.1.10 - used in https://github.com/kentlee10/test_app/blob/main/lib/widgets/main_screen_body/body_website.dart

# HTTP
Uses chopper API service package in getting user data from https://jsonplaceholder.typicode.com/users.

# Reading assets files
Uses rootBundle.loadString() function from flutter services.

# App Architecture
Custom archetecture
- model(Directory for Data Objects class)
- screens(Directory for flutter pages)
- provider(Directory for providers)
- widgets(Directory for reusable widgets)
- utilities(Directory that contains helper file , chopper service files , initiation of active routes, initiation of active providers, and data repository)
