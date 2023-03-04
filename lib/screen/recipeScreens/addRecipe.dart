import 'package:flutter/material.dart';
import 'package:lab_activity_saturday/model/recipe.dart';
import 'package:lab_activity_saturday/repository/recipeRepository.dart';
import 'package:lab_activity_saturday/screen/recipeScreens/displayRecipe.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  List<String> ingredients = [];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();

  final RecipeRepository _recipeRepository = RecipeRepository();
  void _addRecipe(Recipe recipe) {
    setState(() {
      _recipeRepository.addRecipe(recipe);
    });

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return const RecipePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Recipe'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title',
                    hintText: "Enter title"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description',
                    hintText: "Enter description"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _ingredientsController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingredients',
                    hintText: "Enter ingredients"),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    ingredients.add(_ingredientsController.text);
                    _ingredientsController.clear();
                  });
                },
                child: const Text('Add Ingredient'),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Enterd Ingredient :  ${ingredients.toString()}"),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  _addRecipe(Recipe(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      ingredients: ingredients));
                },
                child: const Text('Save Recipe'),
              ),
            ],
          ),
        ));
  }
}
