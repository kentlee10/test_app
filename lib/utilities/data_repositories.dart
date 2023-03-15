import 'package:chopper/chopper.dart';

import 'api_service.dart';

class DataRepository {
  final ApiService apiService;

  DataRepository({
    required this.apiService,
  });

  Future<Response> getUserList() async {
    return await apiService.getUser();
  }
}