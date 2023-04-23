
class Course {
  String image;
  String name;
  String description;
  int price;

  Course(this.image, this.name, this.description, this.price);

  Course.fromMap(Map<String, dynamic> map)
    : image = map['image'],
      name = map['name'],
      description = map['description'],
      price = map['price'];
}
