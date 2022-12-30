import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:travo/core/constants/color_constants.dart';
import 'package:travo/core/constants/dimension_constants.dart';
import 'package:travo/core/constants/text_style_constant.dart';
import 'package:travo/core/helper/asset_helper.dart';
import 'package:travo/core/helper/image_helper.dart';
import 'package:travo/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      title: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimension.kDefaultPadding,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi Robert,',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                Gap(15),
                Text(
                  'Where are you going next?',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: (){

                  },
                  child: const Icon(
                    FontAwesomeIcons.bell,
                    size: AppDimension.kDefaultIconSize,
                    color: Colors.white,
                  ),
                ),
                const Gap(AppDimension.kItemPadding*2),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    width: 40,
                    height: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimension.kItemPadding),
                        color: Colors.white),
                    child: ImageHelper.loadFromAsset(AssetHelper.fakeAvatar,
                        fit: BoxFit.fill),
                    // color: Colors.yellow,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      // titleText: 'Home',
      // implementLeading: true,
      // implementTrailing: true,
      child: Container(
        color: Colors.lightGreenAccent,
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search your destination',
                prefixIcon: Padding(
                    padding: EdgeInsets.all(AppDimension.kTopPadding),
                  child: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: AppDimension.kDefaultPadding,
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: AppDimension.kItemPadding
                ),
              ),
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }
}
