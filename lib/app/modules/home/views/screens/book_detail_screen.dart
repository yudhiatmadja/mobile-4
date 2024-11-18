import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/book_controller.dart';

class BookDetailScreen extends StatelessWidget {
  final BookController bookController = Get.find();

  @override
  Widget build(BuildContext context) {
    final selectedBook = bookController.selectedBook.value;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedBook['title'] ?? 'Book Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              selectedBook['image'] ?? '',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            Text(
              selectedBook['title'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24.0),
            ),
            const SizedBox(height: 8.0),
            Text(
              selectedBook['author'] ?? '',
              style: const TextStyle(color: Colors.grey, fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Description:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'it tells of a café in Tokyo that allows its customers to travel back in time, as long as they return before their coffee gets cold. The story originally began as a play in 2010, before being adapted into a novel in 2015.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
