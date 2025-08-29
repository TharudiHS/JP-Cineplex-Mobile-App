import 'package:flutter/material.dart';
import 'package:jp_cinema_app/utils/app_colours.dart';
import 'package:jp_cinema_app/utils/text_styles.dart';

PreferredSizeWidget buildAppBar3(BuildContext context, String title) {
  return AppBar(
    backgroundColor: AppColours.grey11,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: AppColours.white),
      onPressed: () => Navigator.pop(context),
    ),
    title: Text(title, style: TextStyles.size16WeightBoldConthraxSemiBold),
    centerTitle: true,
  );
}
