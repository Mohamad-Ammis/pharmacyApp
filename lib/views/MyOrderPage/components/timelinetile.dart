import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/MyOrderPage/components/event_card.dart';
import 'package:timeline_tile/timeline_tile.dart';

class CustomTimeLineTile extends StatelessWidget {
  const CustomTimeLineTile(
      {super.key,
      required this.isFirst,
      required this.isLast,
      required this.isPast,
      required this.eventCard});
  final bool isFirst;
  final bool isLast;
  final bool isPast;
  final eventCard;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //gap
      height: 130,
      child: TimelineTile(
        isFirst: isFirst,
        isLast: isLast,
        beforeLineStyle: LineStyle(
            color: isPast ? Color.fromARGB(255, 98, 202, 219)
                : Color.fromARGB(255, 217, 225, 243)),
        indicatorStyle: IndicatorStyle(
            width: 30,
            color: isPast ? Color.fromARGB(255, 98, 176, 194)
                : Color.fromARGB(255, 217, 225, 243),
            iconStyle: IconStyle(
                iconData: Icons.done,
                color: isPast ? Colors.white :  Color.fromARGB(255, 217, 225, 243))),
        endChild: EventCard(
          isPast: isPast,
          child: eventCard,
        ),
      ),
    );
  }
}
