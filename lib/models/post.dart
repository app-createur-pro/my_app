
import 'package:flutter/material.dart';
import 'package:my_app/models/card_data.dart';

class Post extends CardData{
  final String userName;
  final Icon picture;
  final bool isOnline;
  final int likes;
  final String postText;
  final int views;

  Post({this.userName,
      this.picture,
      this.isOnline,
      this.likes,
      this.postText,
      this.views}) : super(
                      title: userName,
                      icon: picture,
                      subtitle: (isOnline) ? "en ligne" : "hors ligne",
                      line1: "likes : " + likes.toString(),
                      line2: postText,
                      line3: "${views.toString()} vues",
                     );

  @override
  void openCard(BuildContext context) {
    showDialog(context: context, builder: (_) => AlertDialog(
        title: Text("pop up : $userName"),
      )
    );
  }
}