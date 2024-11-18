import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/book_controller.dart';
import '../widgets/book_card.dart';
import 'book_detail_screen.dart';
import 'camera_screen.dart';
import 'microphone_screen.dart';
import 'speaker_screen.dart';
class HomeScreen extends StatelessWidget {
  final BookController bookController = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFF001F54),
        title: Text(
          'KINGKALEED',
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(3, 3),
              ),
              Shadow(
                blurRadius: 20.0,
                color: Colors.white.withOpacity(0.6),
                offset: Offset(-3, -3),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFF001F54), Color(0xFFB0C4DE)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'HALID GACOR Collection',
                              style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Silahkan',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Color(0xFFB0C4DE),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Hero(
                              tag: 'cameraButton',
                              child: ElevatedButton(
                                onPressed: () => Get.to(() => CameraScreen()),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  backgroundColor: Color(0xFF001F54),
                                ),
                                child: const Text(
                                  "Fitur Kamera",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            Hero(
                              tag: 'microphoneButton',
                              child: ElevatedButton(
                                onPressed: () => Get.to(() => MicrophoneScreen()),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  backgroundColor: Color(0xFF001F54),
                                ),
                                child: const Text(
                                  "Audio",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                            Hero(
                              tag: 'speakerButton',
                              child: ElevatedButton(
                                onPressed: () => Get.to(() => SpeakerScreen()),
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                                  backgroundColor: Color(0xFF001F54),
                                ),
                                child: const Text(
                                  "Fitur Speaker",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Buku Rekomendasi Gue nih bro',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF001F54),
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black.withOpacity(0.1),
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: bookController.books.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      bookController.selectBook(bookController.books[index]);
                      Get.to(() => BookDetailScreen());
                    },
                    child: BookCard(
                      title: bookController.books[index]['title']!,
                      author: bookController.books[index]['author']!,
                      image: bookController.books[index]['image']!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
