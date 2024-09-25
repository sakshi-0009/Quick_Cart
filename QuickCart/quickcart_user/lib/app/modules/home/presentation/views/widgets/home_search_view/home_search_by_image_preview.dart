import 'package:extended_themes/extended_themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controllers/home_controller.dart';


class SearchPhotoPreview extends GetView<HomeController> {
  final VoidCallback removePhoto;

  const SearchPhotoPreview({super.key, required this.removePhoto});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: const Color(0xFFC4C4C4),
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                    image: Image.file(controller.imageFile).image,
                    fit: BoxFit.cover)),
          ),
        ),
        Positioned(
            top: 8,
            right: 8,
            child: GestureDetector(
                onTap: removePhoto,
                child:
                const SizedBox(height: 30, width: 30, child: AppIcons.close()))),
      ],
    );
  }
}
