import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class GeminiDialog extends StatefulWidget {
  final Gemini gemini;
  final String initialPrompt;

  const GeminiDialog({
    Key? key,
    required this.gemini,
    required this.initialPrompt,
  }) : super(key: key);

  @override
  State<GeminiDialog> createState() => _GeminiDialogState();
}

class _GeminiDialogState extends State<GeminiDialog> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();
  String? _response;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialPrompt;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Gemini'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Запрос',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, введите запрос';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            if (_response != null)
              Text(
                _response!,
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel', style: TextStyle(color: Colors.red)),
        ),
        TextButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              final response = await widget.gemini.text(
                _controller.text,
              );
              print(response);
            }

            // final response = widget.gemini
            //     .text("Write a story about a magic backpack.")
            //     .then((value) => print(value?.output))

            //     /// or value?.content?.parts?.last.text
            //     .catchError((e) => print(e));
            //   setState(() {
            //     _response = response;
            //   });
            // }
          },
          child: const Text('Generate', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
