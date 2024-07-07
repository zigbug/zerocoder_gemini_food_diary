import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/day_progress.dart';
import '../widgets/list_item.dart'; // Import intl package

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  int _selectedIndex = 0;
  final List<String> _bottomNavigationBarTitles = [
    'Домой',
    'Работа',
    'Настройки',
    'Профиль',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0, // Убрать тень
        title: Text(_bottomNavigationBarTitles[_selectedIndex]),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                theme.colorScheme.secondary,
                theme.colorScheme.primary,
              ],
              stops: [0.1, 0.8],
              tileMode: TileMode.repeated),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DayProgress(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Домой',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work),
            label: 'Работа',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Настройки',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Добавить задачу',
        child: const Icon(Icons.add),
      ),
    );
  }
}
