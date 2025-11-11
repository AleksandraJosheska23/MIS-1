import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({super.key, required this.exam, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    return Card(
      color: isPast ? Colors.grey[300] : Colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          Icons.school,
          color: isPast ? Colors.green[500] : Colors.green[500],
        ),
        title: Text(exam.subject, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 5),
              Text(
                "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            Row(children: [
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 5),
              Text(
                "${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            ]),
            Row(children: [
              const Icon(Icons.location_on_outlined, size: 16, color: Colors.blue),
              const SizedBox(width: 5),
              Expanded(child: Text(exam.rooms.join(", ")))
            ]),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}