import 'package:flutter/material.dart';

//1
class VideoConfig extends ChangeNotifier {
  bool autoMute = false;

  void toggleAutoMute() {
    //API 데이터 가져오기 + notifilistener
    autoMute = !autoMute;
    notifyListeners();
  }
}

final videoConfig = VideoConfig();

//2
final videoConfig2 = ValueNotifier(false);

//3
class VideoConfig3 extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoplay = false;

  void toggleisMuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleAutoplay() {
    isAutoplay = !isAutoplay;
    notifyListeners();
  }
}
