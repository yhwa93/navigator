class PlaybackConfigModel {
  //데이터 형태 정의
  bool muted;
  bool autoplay;

  //Contructor로 API에서 나온 JSON을 dart class로 변환
  PlaybackConfigModel({
    required this.muted,
    required this.autoplay,
  });
}
