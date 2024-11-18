import 'package:get/get.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MicrophoneController extends GetxController {
  late stt.SpeechToText _speechToText;
  var isListening = false.obs;
  var recognizedText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _speechToText = stt.SpeechToText();
  }

  Future<void> startListening() async {
    bool available = await _speechToText.initialize();
    if (available) {
      isListening.value = true;
      _speechToText.listen(
        onResult: (result) {
          recognizedText.value = result.recognizedWords;
        
        },
      );
    } else {
      Get.snackbar(
        "Error",
        "Fitur speech-to-text tidak tersedia pada perangkat ini.",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> stopListening() async {
    await _speechToText.stop();
    isListening.value = false;
  }

  @override
  void onClose() {
    _speechToText.stop();
    super.onClose();
  }
}
