import 'dart:convert';

import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  static final String routeName = 'result';
  late final String question;
  late final String answer;
  late final String clue;

  ResultScreen({
    required String code,
    Key? key,
  }) : super(key: key) {
    final json = jsonDecode(code);
    question = json['question'];
    answer = json['answer'];
    clue = json['clue'];
  }

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  var _answeredCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Spacer(flex: 3),
            Text(
              widget.question,
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.all(24),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tip hier je antwoord',
                ),
                onChanged: (value) {
                  setState(() {
                    _answeredCorrect = (value == widget.answer);
                  });
                },
              ),
            ),
            if (_answeredCorrect) ...[
              const SizedBox(height: 24),
              Text(
                widget.clue,
                style: TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
            ],
            const Spacer(flex: 5),
          ],
        ),
      ),
    );
  }
}
