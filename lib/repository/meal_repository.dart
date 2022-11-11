import 'package:dio/dio.dart';
import 'package:italian_foods/models/meal.dart';

class MealRepository {
  Future<ListItalianMeal> getMeals() async {
    try {
      Response responseApi = await Dio()
          .get('https://www.themealdb.com/api/json/v1/1/filter.php?a=italian');

      var data = responseApi.data;
      var map = Map<String, dynamic>.from(data);
      var result = ListItalianMeal.fromJson(map);

      return result;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<MealDetail?> mealsDetails({required int? id}) async {
    try {
      Response response = await Dio().getUri(Uri.parse(
          'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'));
      var data = response.data;

      var map = Map<String, dynamic>.from(data);

      var result = MealDetail.fromJson(map);

      return result;
    } on DioError catch (e) {
      throw Exception(e.toString());
    }
  }
}

