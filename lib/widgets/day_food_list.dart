import 'package:flutter/material.dart';
import 'package:gemeni_food_diary/widgets/list_item.dart';
import 'package:intl/intl.dart';

class DayFoodfList extends StatelessWidget {
  const DayFoodfList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 16),
        Text(
          'Съедено еды на день:',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 30, // Замените на фактическое количество задач
          itemBuilder: (context, index) {
            return DayFoodListItem(
                dishName: "яичница $index",
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
