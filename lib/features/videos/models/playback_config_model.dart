class PlaybackconfigModel {

  //데이터의 형태를 class 내부에서 정의
  bool muted;
  bool autoplay;

  //Contructor를 만들어서 API에서 나온 JSON을 dart 코드로 만들기도함
  PlaybackconfigModel({
    required this.muted,
    required this.autoplay,
  });
}