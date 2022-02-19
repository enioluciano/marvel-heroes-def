import 'package:flutter/material.dart';
import 'package:project_test/app/core/ui/widgets/shimmer_custom.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';

class LoadHomePage extends StatelessWidget {
  const LoadHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          maxCrossAxisExtent: 200,
        ),
        itemCount: 7,
        itemBuilder: (context, index) {
          return _item();
        });
  }

  Widget _item() {
    return Card(
      elevation: 3,
      child: SizedBox(
        height: 130,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _image(),
            const SizedBox(height: TEN),
            _title(),
          ],
        ),
      ),
    );
  }

  Widget _image() {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8), topRight: Radius.circular(8)),
        child: ShimmerCustom.square(width: 200, height: 130));
  }

  Widget _title() {
    return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ShimmerCustom.square(width: 50, height: 15),
        ));
  }
}
