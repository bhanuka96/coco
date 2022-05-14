import 'package:coco/models/coco/cocoCaptionsModel.dart';
import 'package:coco/models/coco/cocoImagesModel.dart';
import 'package:coco/models/coco/cocoInstancesModel.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../core/exceptions/appException.dart';
import '../../core/net/apiEndpoints.dart';
import '../../models/coco/cocoModel.dart';

abstract class CocoRepository {
  Future<List<CocoModel?>?>? getData(List<int> id);
}

class CocoRepositoryImpl implements CocoRepository {
  final Dio _dio;

  CocoRepositoryImpl(this._dio);

  @override
  Future<List<CocoModel?>?>? getData(List<int> id) async {
    List<int>? ids = await getImagesByCats(id);
    if ((ids?.length ?? 0) == 0) return null;
    List<CocoImagesModel?>? images = await getImages(ids!);
    if ((images?.length ?? 0) == 0) return null;
    List<CocoInstancesModel?>? instances = await getInstances(ids);
    if ((instances?.length ?? 0) == 0) return null;
    List<CocoCaptionsModel?>? captions = await getCaptions(ids);
    if ((captions?.length ?? 0) == 0) return null;
    return CocoModel().getData(captions: captions, images: images, instances: instances);
  }

  Future<List<int>?>? getImagesByCats(List<int> ids) async {
    try {
      Map<String, dynamic> body = {'querytype': 'getImagesByCats'};
      for (int i = 0; i < ids.length; i++) {
        body['category_ids[$i]'] = ids[i];
      }
      final response = await _dio.post(APIEndpoints.baseUrl, data: body);
      debugPrint('Response 1 : ${response.data}');
      if (response.statusCode == 200 && response.data != null) {
        List<int> ids = List.from(response.data);
        if ((ids.length) > 5) {
          ids = ids.getRange(0, 5).toList();
        }
        return ids;
      }
      return [];
    } on DioError catch (dioError) {
      debugPrint('error $dioError');
      throw AppException.fromDioError(dioError);
    }
  }

  Future<List<CocoImagesModel?>?> getImages(List<int> ids) async {
    try {
      Map<String, dynamic> body = {'querytype': 'getImages'};
      for (int i = 0; i < ids.length; i++) {
        body['image_ids[$i]'] = ids[i];
      }
      final response = await _dio.post(APIEndpoints.baseUrl, data: body);
      debugPrint('Response 2 : ${response.data}');
      if (response.statusCode == 200 && response.data != null) {
        final results = List<Map<String, dynamic>>.from(response.data);
        return results.map((data) => CocoImagesModel.fromJson(data)).toList();
      }
      return [];
    } on DioError catch (dioError) {
      debugPrint('error $dioError');
      throw AppException.fromDioError(dioError);
    }
  }

  Future<List<CocoInstancesModel?>?> getInstances(List<int> ids) async {
    try {
      Map<String, dynamic> body = {'querytype': 'getInstances'};
      for (int i = 0; i < ids.length; i++) {
        body['image_ids[$i]'] = ids[i];
      }
      final response = await _dio.post(APIEndpoints.baseUrl, data: body);
      debugPrint('Response 3 : ${response.data}');
      if (response.statusCode == 200 && response.data != null) {
        final results = List<Map<String, dynamic>>.from(response.data);
        return results.map((data) => CocoInstancesModel.fromJson(data)).toList();
      }
      return [];
    } on DioError catch (dioError) {
      debugPrint('error $dioError');
      throw AppException.fromDioError(dioError);
    }
  }

  Future<List<CocoCaptionsModel?>?> getCaptions(List<int> ids) async {
    try {
      Map<String, dynamic> body = {'querytype': 'getCaptions'};
      for (int i = 0; i < ids.length; i++) {
        body['image_ids[$i]'] = ids[i];
      }
      final response = await _dio.post(APIEndpoints.baseUrl, data: body);
      debugPrint('Response 4 : ${response.data}');
      if (response.statusCode == 200 && response.data != null) {
        final results = List<Map<String, dynamic>>.from(response.data);
        return results.map((data) => CocoCaptionsModel.fromJson(data)).toList();
      }
      return [];
    } on DioError catch (dioError) {
      debugPrint('error $dioError');
      throw AppException.fromDioError(dioError);
    }
  }
}
