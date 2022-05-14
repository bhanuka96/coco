import 'package:coco/notifiers/cocoExplorer/cocoNotifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/customSnackBar.dart';
import '../../../components/customText.dart';
import '../../../constants/palette.dart';
import '../../../state/cocoExplorer/cocoExplorerManager.dart';
import '../../../state/searchCategory/searchManager.dart';

class SearchButtonWidget extends ConsumerWidget {
  final int length;

  const SearchButtonWidget({Key? key, required this.length}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(cocoProvider, (previous, value) {
      if (value is CocoLoaded && value.data != null) {
        ref.read(cocoDataProvider.notifier).update((state) => value.data);
      } else if (value is CocoError) {
        CustomSnackBar.showSnackBar(value.message);
      }
    });
    final state = ref.watch(cocoProvider);
    return ElevatedButton(
      onPressed: length == 0 || state is CocoLoading
          ? null
          : () {
              FocusManager.instance.primaryFocus?.unfocus();
              ref.read(cocoProvider.notifier).getData(ref.read(chooseCategoryProvider));
            },
      child: CustomText(text: 'Search', textColor: Palette.white),
    );
  }
}
