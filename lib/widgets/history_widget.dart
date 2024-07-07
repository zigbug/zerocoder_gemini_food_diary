import 'package:flutter/material.dart';

import 'history_food_list.dart';

class HistoryWidget extends StatelessWidget {
  const HistoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [HistoryFoodfList()],
    );
  }
}
