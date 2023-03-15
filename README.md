# test_app

Mobile App Exercise

# Packages Use
- flutter_native_splash: ^2.2.19
- pull_to_refresh: ^2.0.0
- chopper: ^6.1.1
- provider: ^6.0.5
- xml2json: ^5.3.6
- url_launcher: ^6.1.10

# HTTP
Uses chopper API service package in getting user data from https://jsonplaceholder.typicode.com/users.

# Reading assets files
Uses rootBundle.loadString() function from flutter services.

# App Architecture
Custom archetecture using Provider for state management.
- model(Directory for Data Objects class)
- screens(Directory for flutter pages)
- provider(Directory for providers)
- widgets(Directory for reusable widgets)
- utilities(Directory that contains helper file , chopper service files , initiation of active routes, initiation of active providers, and data repository)
