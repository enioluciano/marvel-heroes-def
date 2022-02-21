import 'package:flutter/material.dart';
import 'package:project_test/app/core/ui/widgets/shimmer_custom.dart';
import 'package:project_test/app/core/util/size_and_colors.dart';

class LoadComics extends StatelessWidget {
  const LoadComics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 290,
      child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  _imageComic(),
                  const SizedBox(height: TEN),
                  SizedBox(
                      width: 120,
                      child:
                          ShimmerCustom.square(width: TWENTY, height: FIFTEEN)),
                ],
              ),
            );
          }),
    );
  }

  Widget _imageComic() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ShimmerCustom.square(width: 130, height: 200));
  }
}
