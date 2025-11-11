import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'exam_details.dart';

class ExamListScreen extends StatelessWidget {
  final List<Exam> exams = [
    Exam(subject: "Оперативни Системи", dateTime: DateTime(2025, 1, 20, 9, 0), rooms: ["Лаб 12"]),
    Exam(subject: "Веб Програмирање", dateTime: DateTime(2025, 11, 22, 10, 30), rooms: ["Лаб 215"]),
    Exam(subject: "Менаџмент на информациски системи", dateTime: DateTime(2024, 12, 15, 8, 0), rooms: ["Лаб 138"]),
    Exam(subject: "Бази на податоци", dateTime: DateTime(2025, 12, 5, 11, 0), rooms: ["Лаб 3"]),
    Exam(subject: "Компјутерски мрежи и безбедност", dateTime: DateTime(2024, 12, 10, 13, 0), rooms: ["Лаб 117"]),
    Exam(subject: "Вовед во науката за податоци", dateTime: DateTime(2025, 1, 28, 9, 0), rooms: ["Лаб 200а"]),
    Exam(subject: "Управување со техничка поддршка", dateTime: DateTime(2025, 11, 17, 14, 0), rooms: ["Лаб 200в"]),
    Exam(subject: "Мобилни информациски системи", dateTime: DateTime(2025, 12, 15, 8, 0), rooms: ["Лаб 215"]),
    Exam(subject: "Маркетинг", dateTime: DateTime(2025, 11, 18, 9, 30), rooms: ["Лаб 12"]),
    Exam(subject: "Софтверско инженерство", dateTime: DateTime(2025, 2, 12, 10, 0), rooms: ["Лаб 2"]),
    Exam(subject: "Основи на Веб дизајн", dateTime: DateTime(2025, 11,27, 12, 0), rooms: ["Лаб 200а"]),
    Exam(subject: "Електронска и мобилна трговија", dateTime: DateTime(2025, 11, 23, 16, 0), rooms: ["Лаб 215"]),
    Exam(subject: "Е-влада", dateTime: DateTime(2025, 2, 9, 9, 0), rooms: ["Лаб 138"]),
  ];

  ExamListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: Text(
          "Распоред за испити - 223168".toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: exams.length,
        itemBuilder: (context, index) {
          final exam = exams[index];
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: SizedBox(
                width: 300,
                child: ExamCard(
                  exam: exam,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ExamDetailScreen(exam: exam)),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        color: Colors.green[300],
        padding: const EdgeInsets.all(16),
        child: Text(
          "Вкупно испити: ${exams.length}".toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}