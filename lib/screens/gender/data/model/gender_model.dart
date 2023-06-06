class GenderModel {
  final int count;
  final String gender;
  final String name;
  final double probability;

  GenderModel({
    required this.count,
    required this.gender,
    required this.name,
    required this.probability,
  });

  factory GenderModel.fromJson(Map<String, dynamic> json) => GenderModel(
    count: json["count"],
    gender: json["gender"],
    name: json["name"],
    probability: json["probability"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "count": count,
    "gender": gender,
    "name": name,
    "probability": probability,
  };
}