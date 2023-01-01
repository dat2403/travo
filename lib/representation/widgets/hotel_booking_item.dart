import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:travo/core/constants/text_style_constant.dart';

class HotelBookingItem extends StatelessWidget {
  final Color iconColor;
  final String icon;
  final String itemTitle;
  final String itemDescription;
  final Function()? onTap;

  const HotelBookingItem({
    Key? key,
    required this.iconColor,
    required this.icon,
    required this.itemTitle,
    required this.itemDescription,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              // padding: const EdgeInsets.all(AppDimension.kItemPadding*1.5,),
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(
                icon,
                width: 20,
                height: 20,
              ),
            ),
            const Gap(20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  itemTitle,
                  style: TextStyles.defaultTextStyle.setTextSize(15),
                ),
                const Gap(10),
                Text(
                  itemDescription,
                  style: TextStyles.defaultTextStyle.bold.setTextSize(18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
