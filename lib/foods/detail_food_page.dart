import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_foods/foods/foods_bloc.dart';

class DetailFoodPage extends StatelessWidget {
  const DetailFoodPage({super.key, required this.idMeal});

  final int idMeal;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        var bloc = MealBloc();
        bloc.getDetails(idMeal);
        return bloc;
      },
      child: BlocConsumer<MealBloc, MealState>(
        listener: (context, state) {
          if (state.onLoading) {
            showDialog(
                context: context,
                builder: (context) => Container(
                      child: CircularProgressIndicator(),
                    ));
          }
        },
        builder: (context, state) {
          log('${state.mealDetail?.meals}');
          return Scaffold(
            backgroundColor: Color.fromARGB(255, 231, 231, 231),
            appBar: AppBar(
                title:
                    Text("Detail ${state.mealDetail?.meals?.first.strMeal}")),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      CircleAvatar(
                        minRadius: 100.0,
                        maxRadius: 150.0,
                        backgroundImage: NetworkImage(state
                                .mealDetail?.meals?.first.strMealThumb ??
                            "https://www.hillaryfarm.co.id/themes/default/backend/images/default-img.png"),
                      ),
                      Container(
                        margin: EdgeInsets.all(24),
                        padding: EdgeInsets.all(24),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 0, 0, 0),
                                spreadRadius: 0.5,
                                blurRadius: 1,
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.mealDetail?.meals?.first.strMeal ?? "",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Ingredients :",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient1 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient2 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient3 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient4 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient5 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient6 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient1 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient7 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strIngredient8 ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Instructions :",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              state.mealDetail?.meals?.first.strInstructions ??
                                  "",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
