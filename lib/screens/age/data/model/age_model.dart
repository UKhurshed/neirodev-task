class AgeModel {
  final int age;
  final int count;
  final String name;

  AgeModel({
    required this.age,
    required this.count,
    required this.name,
  });

  factory AgeModel.fromJson(Map<String, dynamic> json) => AgeModel(
    age: json["age"],
    count: json["count"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "age": age,
    "count": count,
    "name": name,
  };
}