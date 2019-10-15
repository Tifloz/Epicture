
import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final DecorationImage image;
  ImageCard({ this.image });
  @override

  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.only(bottom: 20.0),
        alignment: Alignment.center,
        child: new Card(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.0),
              child: new Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      width: 300.0,
                      height: 250.0,
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        image: image,
                      ),
                  )
              ),
            )
      );

  }
}