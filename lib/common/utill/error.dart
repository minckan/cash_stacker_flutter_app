import 'package:cash_stacker_flutter_app/common/utill/logger.dart';
import 'package:dio/dio.dart';

setError(String name, dynamic error) {
  if (error is DioException) {
    logger.e('[Error -> loadBudgets] ${(error).response}');
  } else {
    logger.e('[Error -> loadBudgets] $error');
  }
}
