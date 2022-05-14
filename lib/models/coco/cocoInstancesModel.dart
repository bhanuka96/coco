class CocoInstancesModel {
  CocoInstancesModel({
    this.imageId,
    this.segmentation,
    this.categoryId,
  });

  int? imageId;
  String? segmentation;
  int? categoryId;

  factory CocoInstancesModel.fromJson(Map<String, dynamic> json) => CocoInstancesModel(
    imageId: json["image_id"],
    segmentation: json["segmentation"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "image_id": imageId,
    "segmentation": segmentation,
    "category_id": categoryId,
  };
}