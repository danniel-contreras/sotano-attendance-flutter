import 'package:dio/dio.dart';
import 'package:sotano_attendance/utils/constants.dart';

class ApiClient {
  final Dio _dio = Dio();
  final Constants _constants = Constants();

  Future<dynamic> login(String vendorCode, String password) async {
    try {
      Response response = await _dio.post(
          "http://10.0.5.3:3000/api/auth/loginEmployee",
          data: {vendorCode, password},
          options: Options(
              headers: {Headers.contentTypeHeader: "application/json"}));

      return response.data;
    } on DioError catch (e) {
      print(e);
      return e.response!.data;
    }
  }
}
