
import 'package:flutter/material.dart';

class ButtonsWidget extends StatefulWidget  {

  final VoidCallback displayOnConsole;
  final Function increment;
  final Function changeNumber;

  const ButtonsWidget({
    Key key,
    @required this.displayOnConsole,
    @required this.increment,
    @required this.changeNumber}) : super(key: key);

  @override
  _ButtonsWidgetState createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  TextEditingController _controller;

  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text("Increment"),
          onPressed: () => widget.increment(),
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            onSubmitted: (String value) {
              widget.changeNumber(int.parse(value));
              _controller.text = "";
            },
          ),
        ),
        RaisedButton(
          child: Text("Display On Console"),
          onPressed: () => widget.displayOnConsole(),
        ),
      ],
    );
  }
}
