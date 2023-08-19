import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:exercise_db/utils/toast_utils.dart';

class ApiServices {
  static final dio = Dio(
    BaseOptions(
      headers: {
        "X-RapidAPI-Key": "e4aed7f5b0msh0ab34088aa9fceep16aedfjsn9d3ded22761f",
        "X-RapidAPI-Host": "exercisedb.p.rapidapi.com",
      },
    ),
  );

  static Future<dynamic> getWithOutTokenApiCAlls(String url) async {
    try {
      final response = await dio.get(
        url,
      );
      log("URL::$url");
      log(jsonEncode(response.data));

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.statusMessage);
      }
    } on Exception catch (e) {
      ToastUtils.showErrorMessage(e.toString());
      print("Catch Error=> ${e}");
    }
  }
}
