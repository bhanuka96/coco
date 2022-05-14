class CocoModel {
  CocoModel({this.cocoUrl, this.categoryId, this.caption, this.flickrUrl, this.imageId, this.segmentation});

  String? cocoUrl, flickrUrl, categoryId, imageId;
  List<String?>? caption, segmentation;

  factory CocoModel.fromJson(Map<String, dynamic> json) => CocoModel(
        cocoUrl: json["coco_url"],
        categoryId: json["category_id"],
      );

  Map<String, dynamic> toJson() => {
        "coco_url": cocoUrl,
        "category_id": categoryId,
      };
}
