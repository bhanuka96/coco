class CocoImagesModel {
  CocoImagesModel({
    this.imageId,
    this.cocoUrl,
    this.flickrUrl,
  });

  int? imageId;
  String? cocoUrl;
  String? flickrUrl;

  factory CocoImagesModel.fromJson(Map<String, dynamic> json) => CocoImagesModel(
    imageId: json["id"],
    cocoUrl: json["coco_url"],
    flickrUrl: json["flickr_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": imageId,
    "coco_url": cocoUrl,
    "flickr_url": flickrUrl,
  };
}