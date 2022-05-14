import 'package:coco/components/customText.dart';
import 'package:coco/components/spacing.dart';
import 'package:coco/notifiers/cocoExplorer/cocoNotifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/material.dart';

import '../../../state/cocoExplorer/cocoExplorerManager.dart';

class ListViewWidget extends ConsumerWidget {
  const ListViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(cocoDataProvider);
    final coco = ref.watch(cocoProvider);
    if (coco is CocoLoading) {
      return const CircularProgressIndicator();
    }
    return Expanded(
      child: ListView.builder(
          itemCount: state?.length ?? 0,
          itemBuilder: (_, int index) {
            if (state?[index]?.cocoUrl == null) return const SizedBox();
            return Column(
              children: [
                Container(
                  constraints: const BoxConstraints(minHeight: 100),
                  child: Image.network(
                    state![index]!.cocoUrl!,
                    fit: BoxFit.fill,
                    filterQuality: FilterQuality.low,
                  ),
                ),
                const Spacing(height: 4),
                ListView.builder(
                    itemCount: state[index]?.caption?.length ?? 0,
                    physics: const NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                    itemBuilder: (_, int capI) {
                      String? caption = state[index]?.caption?[capI];
                      if(caption == null) return const SizedBox();
                      return Padding(
                        padding: const EdgeInsets.only(bottom:2.0),
                        child: CustomText(text: '* $caption'),
                      );
                    }),
                const Spacing(height: 10)
              ],
            );
          }),
    );
  }
}
