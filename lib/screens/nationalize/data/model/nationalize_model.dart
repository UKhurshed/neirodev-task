class NationalizeModel {
  final List<Country> country;
  final String name;

  NationalizeModel({
    required this.country,
    required this.name,
  });

  factory NationalizeModel.fromJson(Map<String, dynamic> json) => NationalizeModel(
    country: List<Country>.from(json["country"].map((x) => Country.fromJson(x))),
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "country": List<dynamic>.from(country.map((x) => x.toJson())),
    "name": name,
  };
}

class Country {
  final String countryId;
  final double probability;

  Country({
    required this.countryId,
    required this.probability,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    countryId: json["country_id"],
    probability: json["probability"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "country_id": countryId,
    "probability": probability,
  };
}
