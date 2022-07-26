
import 'package:flutter/material.dart';
import 'package:my_app/models/card_data.dart';

class CardWidget extends StatefulWidget {

  final CardData cardData;

  const CardWidget({Key key, this.cardData}) : super(key: key);

  @override
  _CardWidgetState createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              widget.cardData.title,
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),
          ),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: () => widget.cardData.openCard(context),
            child: Container(
              width: 300,
              height: 120,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                              flex: 2,
                              child: widget.cardData.icon
                          ),
                          Expanded(
                              flex: 1,
                              child: Text(
                                  widget.cardData.subtitle,
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic
                                  ),
                              )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(widget.cardData.line1),
                          Text(widget.cardData.line2),
                          Text(widget.cardData.line3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
