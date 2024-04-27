import 'package:flutter/material.dart';
import 'package:navigator/features/calendar/models/playback_config_model.dart';
import 'package:navigator/features/videos/repos/video_playback_config_repo.dart';
//ViewModel -> 데이터와 UI 사이의 간극을 메워주는 곳

//ChangeNotifier -> 데이터를 가지고 있을 수 있고, 위젯이 그 데이터를 listen하게 함
//데이터가 바뀔때 위젯에게 알려줌
class PlaybackConfigViewModel extends ChangeNotifier {
  //==> 데이터에 접근할 수 있어야함, 데이터의 읽기 쓰기 담당과 소통이 되어야함
  final PlaybackConfigRepository _repository;

  //모델 필요
  late final PlaybackConfigModel _model = PlaybackConfigModel(
    muted: _repository.isMuted(), 
    autoplay: _repository.isAutoplay(),
  );

  //Contructor
  PlaybackConfigViewModel(this._repository);

  //[***** 화면 접근 가능] Getter======> 실제로 _model에 접근해서 muted/autoplay를 반환
  //화면에서 이 값들을 접근할 수 있음 (직접적으로 모델 접근 X getter로 접근)
  bool get muted => _model.muted;
  bool get autoplay => _model.autoplay;

  //[***** 화면 접근 가능] Setter
  //데이터를 수정하는 메소드를 공개
  void setMuted(bool value){

    //1. [단말기에 저장] 화면에서 새로 받은 값(value)을 디스크에 저장(persist)
    _repository.setMuted(value);

    //2. [모델 값을 변경] Model을 수정한다
    _model.muted = value;

    //3. [view에 변경된 값을 보냄] listen하고 있는 모두에게 notify
    notifyListeners();
  }

  void setAutoplay(bool value){
    //새 값을 디스크에 저장
    _repository.setAutoplay(value);

    //새 값으로 모델 데이터 변경
    _model.autoplay = value;

    //화면에 알려주기
    notifyListeners();
  }
}