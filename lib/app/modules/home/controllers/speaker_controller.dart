import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class SpeakerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  
  final String audioAssetPath = 'assets/lagu.mp3';

  Future<void> playAudio() async {
    try {
      await _audioPlayer.setAsset(audioAssetPath); 
      await _audioPlayer.play();
    } catch (e) {
      Get.snackbar(
        "Error",
        "Gagal memutar audio: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Method untuk menghentikan audio
  Future<void> stopAudio() async {
    await _audioPlayer.stop();
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
