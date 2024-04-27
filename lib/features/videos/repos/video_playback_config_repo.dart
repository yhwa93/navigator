import 'package:shared_preferences/shared_preferences.dart';

//==> Firebase와 같은 DB로부터 데이터를 가져오는 곳이 여기
// Repogitory를 만들고, Firebase에서 데이터를 가져오거나 보내거나함

//데이터를 디스크에게 persist하고 디스크에서 데이터를 가져옴
//레포지토리는 데이터를 유지하고 데이터를 읽는 기능을 책임짐
//데이터를 읽고 + 저장
//간단한 데이터를 사용자 기기 저장소에 persist하는 역할 + 
//사용자 기기 저장소에서 데이터를 읽는 역할
class PlaybackConfigRepository {

  //string -> 디스크에 저장되는 키값 (오타 방지를 위해 변수에 담음 enum 같은거)
  static const String _autoplay = "autoplay";
  static const String _muted = "_muted";

  //SharedPreference 정의
  final SharedPreferences _preferences;

  //Contructor 생성 + SharedPreference를 넣음
  PlaybackConfigRepository(this._preferences);

  //Method 생성
  //1. 음소거 관련 데이터를 디스크에 저장
  //2. 자동재생 관련 데이터를 디스크에 저장
  //3. 2가지를 읽고, 데이터를 저장

  //저장 기능 ===> 키값과 그 키값으로 저장될 데이터 vlaue
  Future<void> setMuted(bool value) async {
    _preferences.setBool(_muted, value);
  }

  Future<void> setAutoplay(bool value) async {
    _preferences.setBool(_autoplay, value);
  }

  //읽는 기능 - 디스크에 없으면 false로 간주하겠다.
  bool isMuted(){
    return _preferences.getBool(_muted) ?? false;
  }

  bool isAutoplay(){
    return _preferences.getBool(_autoplay) ?? false;
  }

} 


