import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import '../widgets/gemini_dialog.dart';
import '../widgets/history_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/today_widget.dart';
import 'package:voice_to_text/voice_to_text.dart';

class WorkPage extends StatefulWidget {
  const WorkPage({super.key});

  @override
  State<WorkPage> createState() => _WorkPageState();
}

class _WorkPageState extends State<WorkPage> {
  final _gemini = Gemini.instance;
  int _selectedIndex = 0;
  final List<String> _bottomNavigationBarTitles = [
    'День',
    'История',
    'Цели',
    'Профиль',
  ];
  final VoiceToText _speech = VoiceToText();
  String text =
      ""; //this is optional, I could get the text directly using speechResult
  @override
  void initState() {
    super.initState();
    _speech.initSpeech();
    _speech.addListener(() {
      setState(() {
        text = _speech.speechResult;
        print(text);
      });
    });
  }

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
              stops: const [0.1, 0.8],
              tileMode: TileMode.repeated),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildBody(context),
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
            icon: Icon(Icons.today),
            label: 'День',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'История',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grade),
            label: 'Цели',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          _speech.isNotListening ? _speech.startListening : _speech.stop;
          final response = await showDialog<String>(
            context: context,
            builder: (context) => GeminiDialog(
              gemini: _gemini, // Pass the Gemini instance
              initialPrompt: text, // Set the initial prompt
            ),
          );

          // Handle the response from Gemini
          if (response != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(response)),
            );
          }
        },
        tooltip: 'Gemini',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    switch (_selectedIndex) {
      case 0:
        return const TodayWidget();
      case 1:
        return const HistoryWidget();
      case 3:
        return const ProfileWidget();

      default:
        return const Center(
          child: CircularProgressIndicator(),
        );
    }
  }
}
