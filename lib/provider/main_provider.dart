import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:test_app/model/user.dart';
import 'package:test_app/model/website.dart';
import 'package:test_app/utilities/api_service.dart';
import 'package:test_app/utilities/data_repositories.dart';
import 'package:chopper/chopper.dart';
import 'package:xml2json/xml2json.dart';

import '../model/country.dart';

class MainProvider with ChangeNotifier {
  late DataRepository _dataRepository = DataRepository(apiService: ApiService.create());

  List<User> _userList = [];
  List<Website> _websiteList = [];
  List<Country> _countryList = [];
  bool _isError = false;
  bool _isInitialized = false;
  bool _isLoading = true;

  List<User> get userList => _userList;
  List<Website> get websiteList => _websiteList;
  List<Country> get countryList => _countryList;
  bool get isError => _isError;
  bool get isInitialized => _isInitialized;
  bool get isLoading => _isLoading;

  initialized() async {
    //Reset all data
    _userList = [];
    _websiteList = [];
    _countryList = [];
    notifyListeners();
    _isInitialized = true;
    //Start Fetch data
    await setUserList();
    await getWebsiteList();
    await getCountryList();
    _isLoading = false;
    notifyListeners();
  }

  setUserList() async {
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * FEATURES NO. 2 A. I. * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    Response response = await _dataRepository.getUserList();
    if(response.isSuccessful){
      _isError = false;
      List userListMap = json.decode(response.bodyString) as List;
      for(Map<String, dynamic> user in userListMap){
        _userList.add(User.fromMap(user));
      }
    } else {
      _isError = true;
    }
  }

  refreshUserList() async {
    _isLoading = true;
    _userList = [];
    notifyListeners();
    await setUserList();
    _isLoading = false;
    notifyListeners();
  }

  refreshWebsiteList() async {
    _isLoading = true;
    _websiteList = [];
    notifyListeners();
    await getWebsiteList();
    _isLoading = false;
    notifyListeners();
  }

  refreshCountryList() async {
    _isLoading = true;
    _countryList = [];
    notifyListeners();
    await getCountryList();
    _isLoading = false;
    notifyListeners();
  }

  getWebsiteList() async {
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * FEATURES NO. 2 B. I. * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      String dataString = await rootBundle.loadString('assets/json/website.txt', cache: false);
      Map<String, dynamic> data = json.decode(dataString);
      List websiteData = data['data']['data'] as List;
      for(Map<String, dynamic> website in websiteData){
        String status = website['status']['name'] ?? '';
        if(status.toLowerCase() == 'published'){
          _websiteList.add(Website.fromMap(website));
        }
      }
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * BONUS * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
      _websiteList.sort((data, nextData) => (data.sequence ?? 0).compareTo(nextData.sequence ?? 0));
  }

  getCountryList() async {
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * BONUS * * * * * * * * * * * * * * * * * * * * * * * */
    /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
    final myTransformer = Xml2Json();
    String data = await rootBundle.loadString('assets/xml/country.xml', cache: false);
    myTransformer.parse(data);
    data = myTransformer.toGData();
    Map<String, dynamic> countryData = json.decode(data);
    List countryList = countryData['countries']['country'] as List;
    for(Map<String, dynamic> country in countryList){
      _countryList.add(Country.fromMap(country));
    }
  }

}
