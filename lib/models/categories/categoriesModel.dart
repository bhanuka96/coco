class CategoriesModel {
  CategoriesModel({
    this.outdoor,
    this.food,
    this.indoor,
    this.appliance,
    this.sports,
    this.animal,
    this.vehicle,
    this.furniture,
    this.accessory,
    this.electronic,
    this.kitchen,
  });

  List<Accessory?>? outdoor;
  List<Accessory?>? food;
  List<Accessory?>? indoor;
  List<Accessory?>? appliance;
  List<Accessory?>? sports;
  List<Accessory?>? animal;
  List<Accessory?>? vehicle;
  List<Accessory?>? furniture;
  List<Accessory?>? accessory;
  List<Accessory?>? electronic;
  List<Accessory?>? kitchen;

  factory CategoriesModel.fromJson(Map<String, dynamic> json) => CategoriesModel(
    outdoor: List<Accessory>.from(json["outdoor"].map((x) => Accessory.fromJson(x))),
    food: List<Accessory>.from(json["food"].map((x) => Accessory.fromJson(x))),
    indoor: List<Accessory>.from(json["indoor"].map((x) => Accessory.fromJson(x))),
    appliance: List<Accessory>.from(json["appliance"].map((x) => Accessory.fromJson(x))),
    sports: List<Accessory>.from(json["sports"].map((x) => Accessory.fromJson(x))),
    animal: List<Accessory>.from(json["animal"].map((x) => Accessory.fromJson(x))),
    vehicle: List<Accessory>.from(json["vehicle"].map((x) => Accessory.fromJson(x))),
    furniture: List<Accessory>.from(json["furniture"].map((x) => Accessory.fromJson(x))),
    accessory: List<Accessory>.from(json["accessory"].map((x) => Accessory.fromJson(x))),
    electronic: List<Accessory>.from(json["electronic"].map((x) => Accessory.fromJson(x))),
    kitchen: List<Accessory>.from(json["kitchen"].map((x) => Accessory.fromJson(x))),
  );
}

class Accessory {
  Accessory({
    this.superCategory,
    this.id,
    this.name,
  });

  String? superCategory;
  int? id;
  String? name;

  factory Accessory.fromJson(Map<String, dynamic> json) => Accessory(
    superCategory: json["supercategory"],
    id: json["id"],
    name: json["name"],
  );
}