import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:italian_foods/foods/detail_food_page.dart';
import 'package:italian_foods/foods/foods_bloc.dart';

class FoodsList extends StatelessWidget {
  const FoodsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = MealBloc();
        bloc.getMeals();
        return bloc;
      },
      child: BlocConsumer<MealBloc, MealState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Color.fromARGB(255, 231, 231, 231),
              appBar: AppBar(title: Text("Italian Food")),
              body: Stack(
                children: [
                  GridView.builder(
                      itemCount: state.listItalianMeal?.meals?.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        var id =
                            state.listItalianMeal?.meals?[index].idMeal ?? "";
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailFoodPage(idMeal: int.parse(id))));
                          },
                          child: Container(
                              margin: EdgeInsets.all(12),
                              padding: EdgeInsets.only(right: 24, bottom: 24),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      spreadRadius: 0.5,
                                      blurRadius: 1,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: NetworkImage(state.listItalianMeal
                                              ?.meals?[index].strMealThumb ??
                                          "https://www.hillaryfarm.co.id/themes/default/backend/images/default-img.png"))),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          spreadRadius: 0.5,
                                          blurRadius: 1,
                                        )
                                      ]),
                                  padding: EdgeInsets.all(2),
                                  child: Text(state.listItalianMeal
                                          ?.meals?[index].strMeal ??
                                      "Food Name"),
                                ),
                              )),
                        );
                      }),
                  Visibility(
                    visible: state.onLoading,
                    child: Container(
                        color: Colors.black.withOpacity(0.4),
                        child: Center(child: CircularProgressIndicator())),
                  ),
                ],
              ));
        },
      ),
    );
  }
}
