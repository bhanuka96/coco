class CocoCaptionsModel {
  CocoCaptionsModel({
    this.caption,
    this.imageId,
  });

  String? caption;
  int? imageId;

  factory CocoCaptionsModel.fromJson(Map<String, dynamic> json) => CocoCaptionsModel(
    caption: json["caption"],
    imageId: json["image_id"],
  );

  Map<String, dynamic> toJson() => {
    "caption": caption,
    "image_id": imageId,
  };
}