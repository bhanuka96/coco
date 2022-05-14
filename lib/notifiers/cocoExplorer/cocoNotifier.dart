import 'package:coco/models/coco/cocoModel.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/strings.dart';
import '../../core/exceptions/appException.dart';
import '../../services/cocoExplorer/cocoRepository.dart';

abstract class CocoState {
  const CocoState();
}

class CocoInitial extends CocoState {
  const CocoInitial();
}

class CocoLoading extends CocoState {
  const CocoLoading();
}

class CocoLoaded extends CocoState {
  final List<CocoModel?>? message;

  const CocoLoaded(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CocoLoaded && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class CocoError extends CocoState {
  final String message;

  const CocoError(this.message);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CocoError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class CocoNotifier extends StateNotifier<CocoState> {
  final CocoRepository _cocoRepository;

  CocoNotifier(this._cocoRepository) : super(const CocoInitial());

  Future<void> getData(List<int> ids) async {
    state = const CocoLoading();
    try {
      var data = await _cocoRepository.getData(ids);
      if (data != null) {
        state = CocoLoaded(data);
      } else {
        state = const CocoError(Strings.somethingError);
      }
    } on NetworkException {
      state = const CocoError(Strings.connectionInternet);
    } catch (e) {
      debugPrint('Error is : $e');
      state = CocoError("$e");
    }
  }
}
