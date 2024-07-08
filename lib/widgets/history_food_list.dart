import 'package:flutter/material.dart';
import 'package:gemeni_food_diary/widgets/day_food_list_item.dart';
import 'package:intl/intl.dart';

import 'history_day_food_list_item.dart';

class HistoryFoodfList extends StatelessWidget {
  const HistoryFoodfList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          'История питания:',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 30, // Замените на фактическое количество задач
          itemBuilder: (context, index) {
            return HistoryDayFoodListItem(
                time: DateFormat('dd MM yyyy, HH:mm')
                    .format(DateTime.now()), // Форматирование даты
                protein: index.toString(),
                fat: index.toString(),
                carbs: index.toString(),
                calories: index.toString());
          },
        ),
      ],
    );
  }
}
