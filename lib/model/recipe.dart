class Recipe {
  String? id;
  String? title;
  List<String>? ingredients;

  Recipe({this.id, this.title, this.ingredients});

  Recipe.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    ingredients = json['ingredients'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['ingredients'] = this.ingredients;
    return data;
  }
}
