class Book {
  int? id;
  String title;
  String author;
  String description;
  String image;
  String favourite;

  Book({
    this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.image,
    required this.favourite,
  });

  factory Book.fromJson(Map<String, dynamic> json) => Book(
    title: json["title"],
    author: json["author"],
    description: json["description"],
    image: json["image"],
    favourite: json["favourite"],
  );


  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "author": author,
    "description": description,
    "image": image,
    "favourite": favourite,
  };
}