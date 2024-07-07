import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'list_item.dart';

class DayProgress extends StatelessWidget {
  const DayProgress({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: CircularProgressIndicator(
                          value: 0.8, // Added value
                          strokeWidth: 10,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      Text(
                        'К.кал',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: 0.8, // Added value
                              strokeWidth: 5,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            'Белки',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: 0.8, // Added value
                              strokeWidth: 5,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            'Жиры',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: 0.8, // Added value
                              strokeWidth: 5,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            'Углеводы',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: 0.8, // Added value
                              strokeWidth: 5,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          Text(
                            'Вода',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Задачи',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 16),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 30, // Замените на фактическое количество задач
          itemBuilder: (context, index) {
            return ListItem(
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
