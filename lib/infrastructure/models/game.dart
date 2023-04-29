import '../enums/game_type.dart';

class Game {
  GameType? type;
  String? image;
  String? title;
  String? subtitle;

  Game({this.type, this.image, this.title, this.subtitle});

  factory Game.fromJson(Map<String, dynamic> json) {
    return Game(
      type: GameType.img,
      title: json['name'],
      image: json['picture'],
    );
  }
}
