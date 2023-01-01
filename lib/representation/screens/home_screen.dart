import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:travo/core/constants/dimension_constants.dart';
import 'package:travo/core/helper/asset_helper.dart';
import 'package:travo/core/helper/image_helper.dart';
import 'package:travo/representation/screens/hotel_booking_screen.dart';
import 'package:travo/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String searchText = '';

  late FocusNode myFocusNode;

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  void searchHandler(String value) {
    setState(() {
      searchText = value;
    });
  }

  Widget _buildCategoryItem(
      Widget icon, String title, Function() onTap, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              vertical: AppDimension.kMediumPadding,
            ),
            decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(AppDimension.kItemPadding)),
            child: icon,
          ),
          const Gap(AppDimension.kItemPadding),
          Text(title)
        ],
      ),
    );
  }

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
                  onTap: () {},
                  child: const Icon(
                    FontAwesomeIcons.bell,
                    size: AppDimension.kDefaultIconSize,
                    color: Colors.white,
                  ),
                ),
                const Gap(AppDimension.kItemPadding * 2),
                GestureDetector(
                  onTap: () {},
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
        // color: Colors.lightGreenAccent,
        child: Column(
          children: [
            TextField(
              // autofocus: false,
              // focusNode: myFocusNode,
              decoration: const InputDecoration(
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
                // focusedBorder: OutlineInputBorder(
                //   borderSide: BorderSide(color: Colors.grey, width: 1.0),
                //   borderRadius: BorderRadius.all(Radius.circular(8)),
                // ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: AppDimension.kItemPadding),
              ),
              style: const TextStyle(fontSize: 17),
              onChanged: (value) => searchHandler(value),
            ),
            const Gap(AppDimension.kDefaultPadding),
            Row(
              children: [
                Expanded(
                  child: _buildCategoryItem(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icHotel,
                      width: AppDimension.kDefaultIconSize * 2,
                      height: AppDimension.kDefaultIconSize * 2,
                    ),
                    'Hotels',
                    () => {
                      Navigator.of(context)
                          .pushNamed(HotelBookingScreen.routeName)
                    },
                    const Color(0xffFE9C5E),
                  ),
                ),
                const Gap(15),
                Expanded(
                  child: _buildCategoryItem(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icFlight,
                      width: AppDimension.kDefaultIconSize * 2,
                      height: AppDimension.kDefaultIconSize * 2,
                    ),
                    'Flights',
                    () => {},
                    const Color(0xffF77777),
                  ),
                ),
                const Gap(15),
                Expanded(
                  child: _buildCategoryItem(
                    ImageHelper.loadFromAsset(
                      AssetHelper.icHotelPlane,
                      width: AppDimension.kDefaultIconSize * 2,
                      height: AppDimension.kDefaultIconSize * 2,
                    ),
                    'All',
                    () => {},
                    const Color(0xff3EC8BC),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
