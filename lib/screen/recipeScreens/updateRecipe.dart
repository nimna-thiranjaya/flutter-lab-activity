import 'package:flutter/material.dart';
import 'package:lab_activity_saturday/model/recipe.dart';
import 'package:lab_activity_saturday/repository/recipeRepository.dart';
import 'package:lab_activity_saturday/screen/recipeScreens/displayRecipe.dart';

class UpdateRecipe extends StatefulWidget {
  final Recipe? recipe;
  const UpdateRecipe(this.recipe, {super.key});

  @override
  State<UpdateRecipe> createState() => _UpdateRecipeState();
}

class _UpdateRecipeState extends State<UpdateRecipe> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final RecipeRepository recipeRepository = RecipeRepository();

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.recipe!.title.toString();
    _descriptionController.text = widget.recipe!.description.toString();

    void _updateRecipe(Recipe recipe) {
      setState(() {
        recipeRepository.updateRecipe(recipe);
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const RecipePage();
      }));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Recipe'),
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
            Text("Ingredients: ${widget.recipe!.ingredients}"),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                _updateRecipe(Recipe(
                    id: widget.recipe!.id,
                    title: _titleController.text,
                    description: _descriptionController.text,
                    ingredients: widget.recipe!.ingredients));
              },
              child: const Text('Update Recipe'),
            ),
          ],
        ),
      ),
    );
  }
}
