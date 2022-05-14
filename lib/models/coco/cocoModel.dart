import 'cocoCaptionsModel.dart';
import 'cocoImagesModel.dart';
import 'cocoInstancesModel.dart';

class CocoModel {
  CocoModel({this.cocoUrl,  this.categoryId, this.caption, this.flickrUrl, this.imageId, this.segmentation});

  String? cocoUrl, flickrUrl;
  int? imageId;
  List<String?>? caption, segmentation;
  List<int>? categoryId;

  factory CocoModel.fromJson(Map<String, dynamic> json) => CocoModel(
        categoryId: List<int>.from(json["categoryId"].map((x) => x)),
        imageId: json["imageId"],
        flickrUrl: json['flickrUrl'],
        cocoUrl: json['cocoUrl'],
        segmentation: List<String>.from(json["segmentation"].map((x) => x)),
        caption: List<String>.from(json["caption"].map((x) => x)),
      );

  List<CocoModel> getData({
    // List<int>? id,
    // List<int>? ids,
    List<CocoImagesModel?>? images,
    List<CocoInstancesModel?>? instances,
    List<CocoCaptionsModel?>? captions,
  }) {
    List<CocoModel> data = [];
    for (var image in images!) {
      Map<String, dynamic> map = {
        'imageId': image?.imageId,
        'flickrUrl': image?.flickrUrl,
        'cocoUrl': image?.cocoUrl,
      };
      List<String> seg = [];
      List<String> cap = [];
      List<int> cat = [];
      for (var instance in instances!) {
        if (instance?.imageId == image?.imageId && instance?.categoryId != null && instance?.segmentation != null) {
          seg.add(instance!.segmentation!);
          cat.add(instance.categoryId!);
        }
      }
      for (var instance in captions!) {
        if (instance?.imageId == image?.imageId && instance?.caption != null) {
          cap.add(instance!.caption!);
        }
      }
      map['categoryId'] = cat;
      map['segmentation'] = seg;
      map['caption'] = cap;
      data.add(CocoModel.fromJson(map));
    }
    return data;
  }
}
