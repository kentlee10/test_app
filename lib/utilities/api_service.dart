import 'package:chopper/chopper.dart';
part 'api_service.chopper.dart';

@ChopperApi(baseUrl: '/users')
abstract class ApiService extends ChopperService {
  @Get(headers: {'Content-Type' : 'text/plain'})
  Future<Response> getUser();

  static ApiService create() {
    final app = ChopperClient(
      baseUrl: Uri.parse('https://jsonplaceholder.typicode.com'),
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      services: [_$ApiService()],
      converter: const JsonConverter(),
    );
    return _$ApiService(app);
  }
}