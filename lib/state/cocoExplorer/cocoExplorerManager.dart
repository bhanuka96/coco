import 'package:coco/notifiers/cocoExplorer/cocoNotifier.dart';
import 'package:coco/services/cocoExplorer/cocoRepository.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cocoResProvider = Provider<CocoRepository>((ref) {
  Dio dio = Dio();
  dio.options.contentType = Headers.formUrlEncodedContentType;
  return CocoRepositoryImpl(dio);
});

// final cocoResFutureProvider = FutureProvider.autoDispose<List<CocoModel?>?>((ref) async {
//   // ref.maintainState = true;
//   final cocoResService = ref.watch(cocoResProvider);
//   final ids = ref.read(chooseCategoryProvider);
//   print('data $ids');
//   final cocoRes = await cocoResService.getData(ids);
//   return cocoRes;
// });

final cocoProvider = StateNotifierProvider<CocoNotifier, CocoState>(
  (ref) => CocoNotifier(ref.watch(cocoResProvider)),
);
