import 'package:coco/notifiers/cocoExplorer/cocoNotifier.dart';
import 'package:coco/services/cocoExplorer/cocoRepository.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/coco/cocoModel.dart';

final cocoResProvider = Provider<CocoRepository>((ref) {
  Dio dio = Dio();
  dio.options.contentType = Headers.formUrlEncodedContentType;
  return CocoRepositoryImpl(dio);
});

final cocoDataProvider = StateProvider<List<CocoModel?>?>((ref) => []);

final cocoProvider = StateNotifierProvider<CocoNotifier, CocoState>(
  (ref) => CocoNotifier(ref.watch(cocoResProvider)),
);
