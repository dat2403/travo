import 'package:flutter/material.dart';
import 'package:travo/core/constants/color_constants.dart';
import 'package:travo/core/constants/dimension_constants.dart';
import 'package:travo/core/constants/text_style_constant.dart';

class AppContainedButton extends StatelessWidget {
  const AppContainedButton({Key? key, required this.buttonTitle, this.onTap})
      : super(key: key);

  final String buttonTitle;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: Gradients.defaultGradientColor,
          borderRadius: BorderRadius.circular(AppDimension.kDefaultPadding * 2),
        ),
        padding:
            const EdgeInsets.symmetric(vertical: AppDimension.kDefaultPadding),
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: TextStyles.defaultTextStyle.whiteTextColor.bold
              .copyWith(fontSize: 16),
        ),
      ),
    );
  }
}
