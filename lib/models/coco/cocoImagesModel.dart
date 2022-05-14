class CocoImagesModel {
  CocoImagesModel({
    this.categoryId,
    this.cocoUrl,
    this.flickrUrl,
  });

  int? categoryId;
  String? cocoUrl;
  String? flickrUrl;

  factory CocoImagesModel.fromJson(Map<String, dynamic> json) => CocoImagesModel(
    categoryId: json["id"],
    cocoUrl: json["coco_url"],
    flickrUrl: json["flickr_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": categoryId,
    "coco_url": cocoUrl,
    "flickr_url": flickrUrl,
  };
}