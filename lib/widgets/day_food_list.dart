import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gemeni_food_diary/widgets/day_food_list_item.dart';
import 'package:intl/intl.dart';

class DayFoodfList extends StatelessWidget {
  const DayFoodfList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: FirebaseFirestore.instance
          .collection('myfood') // Замените 'myfood' на имя вашей коллекции
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Ошибка: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        final myfood = snapshot.data!.docs;

        return Column(
          children: [
            const SizedBox(height: 16),
            Text(
              'За день:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 16),
            if (myfood.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: myfood.length,
                itemBuilder: (context, index) {
                  final foodData = myfood[index].data();
                  return DayFoodListItem(
                    dishName: foodData['dishName'] ?? '',
                    time: DateFormat('HH:mm').format(
                        DateTime.fromMillisecondsSinceEpoch(
                            foodData['time']?.millisecondsSinceEpoch ?? 0)),
                    protein: foodData['protein']?.toString() ?? '',
                    fat: foodData['fat']?.toString() ?? '',
                    carbs: foodData['carbs']?.toString() ?? '',
                    calories: foodData['calories']?.toString() ?? '',
                  );
                },
              )
            else
              const Center(
                child: Text('Пока нет записей, голодаете?'),
              ),
          ],
        );
      },
    );
  }
}
