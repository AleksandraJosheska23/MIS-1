import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({super.key, required this.exam});

  String timeRemaining() {
    final now = DateTime.now();
    final diff = exam.dateTime.difference(now);
    if (diff.isNegative) return "Испитот е поминат";
    final days = diff.inDays;
    return "$days дена";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(exam.subject.toUpperCase()),
        backgroundColor: Colors.green[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Првата картичка за детали на испит
            Card(
              color: Colors.green[200],
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.black, width: 2), // црн дебел border
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Предмет: ${exam.subject}",
                        style: const TextStyle(fontSize: 20, color: Colors.black)),
                    const SizedBox(height: 10),
                    Text(
                        "Датум: ${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
                        style: const TextStyle(color: Colors.black)),
                    Text(
                        "Време: ${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                        style: const TextStyle(color: Colors.black)),
                    Text("Простории: ${exam.rooms.join(', ')}",
                        style: const TextStyle(color: Colors.black)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Втората картичка за преостанато време
            Center(
              child: Card(
                color: Colors.green[100],
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.black, width: 2), // црн дебел border
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Преостанато време до испит: ${timeRemaining()}",
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}