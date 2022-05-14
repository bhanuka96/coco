import 'package:coco/components/spacing.dart';
import 'package:coco/state/cocoExplorer/cocoExplorerManager.dart';
import 'package:coco/state/searchCategory/searchManager.dart';
import 'package:coco/views/dashboard/widgets/appBar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../components/customError.dart';
import '../../components/customLoading.dart';
import '../../components/customText.dart';
import '../../constants/palette.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class DashboardPage extends HookConsumerWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
    final search = useValueListenable(searchController).text;
    final chooseCatState = ref.watch(chooseCategoryProvider);
    return Scaffold(
      appBar: DashboardAppBar(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      isDense: true,
                      prefixIcon: Icon(Icons.search, color: Palette.defaultColorDart),
                    ),
                  ),
                ),
                const Spacing(width: 10),
                ElevatedButton(
                  onPressed: chooseCatState.isEmpty
                      ? null
                      : () {
                          ref.read(cocoProvider.notifier).getData(ref.read(chooseCategoryProvider));
                        },
                  child: CustomText(text: 'Search', textColor: Palette.white),
                )
              ],
            ),
            const Spacing(height: 10),
            SizedBox(
              height: 50,
              child: ref.watch(searchCategoryProvider(search)).when(
                  data: (data) {
                    if ((data?.length ?? 0) == 0) return const SizedBox();
                    return ListView.separated(
                        itemCount: data?.length ?? 0,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (_, int index) {
                          return const Divider();
                        },
                        itemBuilder: (_, int index) {
                          if (data?[index].id == null) return const SizedBox();
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: InkWell(
                              onTap: () {
                                ref.read(chooseCategoryProvider.notifier).update(data![index].id!);
                              },
                              child: Chip(
                                label: CustomText(
                                  text: data?[index].name ?? '',
                                  textColor: chooseCatState.contains(data?[index].id) ? Palette.white : null,
                                ),
                                backgroundColor: chooseCatState.contains(data?[index].id) ? Palette.defaultColorLight : null,
                              ),
                            ),
                          );
                        });
                  },
                  error: (e, s) {
                    return const CustomError();
                  },
                  loading: () => const LoadingWidget()),
            )
          ],
        ),
      ),
    );
  }
}
