import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_foods/models/meal.dart';
import 'package:italian_foods/repository/meal_repository.dart';

class MealBloc extends Cubit<MealState> {
  MealBloc() : super(MealState());

  MealRepository _mealRepository = MealRepository();

  getMeals() async {
    emit(state.copyWith(onLoading: true));
    var data = await _mealRepository.getMeals();

    emit(state.copyWith(listItalianMeal: data, onLoading: false));
  }

  getDetails(int id) async {
    
    emit(state.copyWith(onLoading: true));

    var data = await _mealRepository.mealsDetails(id: id);
    
    emit(state.copyWith(mealDetail: data, onLoading: false));
  }
}

class MealState extends Equatable {
  final ListItalianMeal? listItalianMeal;
  final MealDetail? mealDetail;
  final bool onLoading;

  MealState({this.listItalianMeal, this.mealDetail, this.onLoading = false});

  @override
  // TODO: implement props
  List<Object?> get props => [listItalianMeal, mealDetail, onLoading];

  MealState copyWith(
          {ListItalianMeal? listItalianMeal,
          MealDetail? mealDetail,
          bool onLoading = false}) =>
      MealState(
          listItalianMeal: listItalianMeal ?? this.listItalianMeal,
          mealDetail: mealDetail ?? this.mealDetail,
          onLoading: onLoading);
}
