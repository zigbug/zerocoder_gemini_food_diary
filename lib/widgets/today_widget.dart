import 'package:flutter/material.dart';

import 'day_food_list.dart';
import 'day_progress.dart';

class TodayWidget extends StatelessWidget {
  const TodayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DayProgress(),
        DayFoodfList(),
      ],
    );
  }
}
