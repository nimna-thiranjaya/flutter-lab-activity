import 'package:flutter/material.dart';
import 'package:lab_activity_saturday/model/recipe.dart';
import 'package:lab_activity_saturday/repository/recipeRepository.dart';
import 'package:lab_activity_saturday/screen/recipeScreens/addRecipe.dart';
import 'package:lab_activity_saturday/screen/recipeScreens/updateRecipe.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    final RecipeRepository recipeRepository = RecipeRepository();

    //delete function
    void _DeleteRecipe(String id) {
      setState(() {
        recipeRepository.deleteRecipe(id);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<Recipe>>(
                future: recipeRepository.getAllRecipes(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<Recipe>? recipes = snapshot.data;
                    return ListView.builder(
                      itemCount: recipes!.length,
                      itemBuilder: (context, index) {
                        final recipe = recipes[index];
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: ListTile(
                            title: Text(recipe.title.toString()),
                            subtitle: Text(recipe.description.toString()),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            UpdateRecipe(recipe),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _DeleteRecipe(recipe.id.toString());
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddRecipePage(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
