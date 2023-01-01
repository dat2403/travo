import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:travo/core/helper/asset_helper.dart';
import 'package:travo/representation/widgets/app_bar_container.dart';
import 'package:travo/representation/widgets/app_contained_button.dart';
import 'package:travo/representation/widgets/hotel_booking_item.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({Key? key}) : super(key: key);

  static const String routeName = "/hotel-booking-screen";

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainer(
      titleText: 'Hotel Booking',
      implementLeading: true,
      child: Container(
        child: Column(
          children: [
            const Gap(60),
            HotelBookingItem(
              iconColor: Color(0xffFE9C5E),
              icon: AssetHelper.icLocation,
              itemTitle: 'Destination',
              itemDescription: 'South Korea',
              onTap: (){},
            ),
            const Gap(20),
            HotelBookingItem(
              iconColor: Color(0xffF77777),
              icon: AssetHelper.icCalendar,
              itemTitle: 'Select Date',
              itemDescription: '13 Feb - 18 Feb 2021',
              onTap: (){},
            ),
            const Gap(20),
            HotelBookingItem(
              iconColor: Color(0xff3EC8BC),
              icon: AssetHelper.icBed,
              itemTitle: 'Guest and Room',
              itemDescription: '2 Guest, 1 Room',
              onTap: (){},
            ),
            const Gap(30),
            AppContainedButton(
              buttonTitle: 'Search',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
