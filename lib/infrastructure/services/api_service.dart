import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../models/game.dart';

class ApiService {
  final _dio = Dio(BaseOptions(baseUrl: 'https://api.petcentral.id/'));

  Future<Either<String, bool>> getSignin({
    required String emailOrPhone,
    required String password,
  }) async {
    try {
      var res = await _dio.get(
        'auth/customer/signin',
        data: {
          "emailOrPhone": emailOrPhone,
          "password": password,
        },
      );

      return right(true);
    } on DioError catch (_) {
      return left('Request failed');
    }
  }

  Future<Either<String, bool>> postSignup({
    required String name,
    required String email,
    required String password,
    required String mobilePhone,
  }) async {
    try {
      var res = await _dio.post(
        'auth/customer/signup',
        data: {"name": name, "email": email, "password": password, "mobilePhone": mobilePhone},
      );

      return right(true);
    } on DioError catch (e) {
      return left('Request failed');
    }
  }

  Future<Either<String, List<Game>>> getProduct() async {
    try {
      var res = await _dio.get("ecommerce/product/top");
      if (res.statusCode == 200) {
        return Right(List.from(res.data.map((e) => Game.fromJson(e))));
      }

      return left('Data not found');
    } on DioError catch (e) {
      return left('Request failed');
    }
  }
}
