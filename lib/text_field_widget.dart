
import 'package:flutter/material.dart';

class ButtonsWidget extends StatefulWidget {

  final VoidCallback incrementCallback; //no argument, no return
  final Function increment; //no parameter, no return
  final Function changeNumber; //1 parameter, no return

  final ValueChanged<int> onChanged; //1 argument, no return (underlying value has changed)
  final ValueSetter<int> onSet; //1 argument, no return (value has been set)
  final ValueGetter<String> onGet; //no argument, return something

  const ButtonsWidget({
    Key key,
    @required this.incrementCallback,
    @required this.increment,
    @required this.changeNumber,
    @required this.onChanged,
    @required this.onSet,
    @required this.onGet}) : super(key: key);

  @override
  _ButtonsWidgetState createState() => _ButtonsWidgetState();
}

class _ButtonsWidgetState extends State<ButtonsWidget> {
  TextEditingController _controller = TextEditingController();
  String _countChanged = "Count never changed manually";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedButton(
          child: Text("Increment Function"),
          onPressed: () => widget.increment(),
        ),
        RaisedButton(
          child: Text("Increment Callback"),
          onPressed: () => widget.incrementCallback(), //both buttons do same thing
        ),
        Padding(
          padding: const EdgeInsets.all(40.0),
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            onSubmitted: (String value) {
              int _value = int.parse(value);
              _value.round();
              //widget.changeNumber(_value);
              widget.onChanged(_value);
              //widget.onSet(_value);
              setState(() {
                _countChanged = widget.onGet();
              });
              _controller.text = "";
            },
          ),
        ),
        Text(
          _countChanged
        )
      ],
    );
  }
}