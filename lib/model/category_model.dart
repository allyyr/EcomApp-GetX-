class CategoryModel {
  late String name;
  late String image;

  // Constructor
  CategoryModel(this.name, this.image);

  // fromJson method with null-safety
  CategoryModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }

    // Use null-aware operators to handle possible null values
    name = map['name'] ?? 'Unknown'; // Provide a default value like 'Unknown'
    image = map['image'] ?? ''; // Provide a default empty string for image
  }

  // toJson method
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
