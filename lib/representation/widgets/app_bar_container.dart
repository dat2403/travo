import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travo/core/constants/color_constants.dart';
import 'package:travo/core/constants/dimension_constants.dart';
import 'package:travo/core/helper/asset_helper.dart';
import 'package:travo/core/helper/image_helper.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key? key,
    required this.child,
    this.title,
    this.titleText,
    this.implementLeading = false,
    this.implementTrailing = false
  }) : super(key: key);

  final Widget child;
  final Widget? title;
  final String? titleText;
  final bool implementLeading;
  final bool implementTrailing;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.scaffoldBackgroundColor,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(AppDimension.kItemPadding),
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(AppDimension.kDefaultPadding),
                                ),
                                color: Colors.white),
                            child: const Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: Colors.blueGrey,
                              size: AppDimension.kDefaultIconSize,
                            ),
                          ),
                        ),
                      Expanded(
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                    titleText ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )
                              ],
                            ),
                          ),
                      ),
                      if (implementTrailing)
                        Container(
                          padding: const EdgeInsets.all(AppDimension.kItemPadding),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(AppDimension.kDefaultPadding),
                              ),
                              color: Colors.white),
                          child: const Icon(
                            FontAwesomeIcons.bars,
                            color: Colors.blueGrey,
                            size: AppDimension.kDefaultIconSize,
                          ),
                        ),
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      gradient: Gradients.defaultGradientColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.oval1),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.oval2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 156),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: child,
          )
        ],
      ),
    );
  }
}
