import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  /// Color of the text [default = Colors.black]
  final Color textColor;

  /// Display a custom right icon
  final SvgPicture? rightIcon;

  /// Action to trigger when right button is pressed
  final Function()? rightButtonFn;

  /// Display a custom left icon
  final Icon? leftIcon;

  /// Action to trigger when left button is pressed
  final Function()? leftButtonFn;

  /// Callback when an item is pressed
  final KeyboardTapCallback onKeyboardTap;

  /// Main axis alignment [default = MainAxisAlignment.spaceEvenly]
  final MainAxisAlignment mainAxisAlignment;

  NumericKeyboard(
      {Key? key,
        required this.onKeyboardTap,
        this.textColor = Colors.black,
        this.rightButtonFn,
        this.rightIcon,
        this.leftButtonFn,
        this.leftIcon,
        this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height/10;

    return Container(
      padding: const EdgeInsets.only( top: 20,left: 20,right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('1',height),
              _calcButton('2',height),
              _calcButton('3',height),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('4',height),
              _calcButton('5',height),
              _calcButton('6',height),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              _calcButton('7',height),
              _calcButton('8',height),
              _calcButton('9',height),
            ],
          ),
          ButtonBar(
            alignment: widget.mainAxisAlignment,
            children: <Widget>[
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.leftButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: widget.leftIcon)),
              _calcButton('0',height),
              InkWell(
                  borderRadius: BorderRadius.circular(45),
                  onTap: widget.rightButtonFn,
                  child: Container(
                      alignment: Alignment.center,
                      width: 50,
                      height: 50,
                      child: widget.rightIcon))
            ],
          ),
        ],
      ),
    );
  }

  Widget _calcButton(String value,height) {
    return InkWell(
        borderRadius: BorderRadius.circular(45),
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          alignment: Alignment.center,
          width: 70,
          height: height,
          child: Text(
            value,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: widget.textColor),
          ),
        ));
  }
}