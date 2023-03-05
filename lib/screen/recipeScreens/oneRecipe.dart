import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:lab_activity_saturday/model/recipe.dart';

class OneRecipe extends StatelessWidget {
  final Recipe? recipe;
  const OneRecipe(this.recipe, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("one recipe"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Title : ${recipe!.title.toString()}"),
            Text("Description : ${recipe!.description.toString()}"),
            Text("Ingredients : ${recipe!.ingredients.toString()}"),
          ],
        ),
      ),
    );
  }
}
