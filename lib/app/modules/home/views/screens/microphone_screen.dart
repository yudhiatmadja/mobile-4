import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/microphone_controller.dart';

class MicrophoneScreen extends StatelessWidget {
  final MicrophoneController micController = Get.put(MicrophoneController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Speech to Text"),
        backgroundColor: Colors.blueAccent,
        elevation: 5,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Status Mendengarkan
              Obx(() => Text(
                micController.isListening.value
                    ? "Mendengarkan..."
                    : "Tidak Mendengarkan",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: micController.isListening.value
                      ? Colors.green
                      : Colors.red,
                ),
              )),
              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  micController.isListening.value
                      ? micController.stopListening()
                      : micController.startListening();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: micController.isListening.value
                      ? Colors.redAccent
                      : Colors.greenAccent,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 5,
                ),
                child: Obx(() => Text(
                    micController.isListening.value ? "Stop" : "Mulai Mendengarkan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )),
              ),
              const SizedBox(height: 30),

              // Teks yang dikenali
              Obx(() => Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  micController.recognizedText.value.isNotEmpty
                      ? "Teks Terkenali:\n${micController.recognizedText.value}"
                      : "Belum ada teks yang dikenali.",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
