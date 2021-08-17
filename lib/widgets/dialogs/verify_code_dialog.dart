import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groopy_app/constants/UIColors.dart';
import 'package:groopy_app/constants/UITexts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../numeric_keyboard.dart';

class VerifyCodeDialog extends StatefulWidget {
  const VerifyCodeDialog({Key? key}) : super(key: key);

  @override
  _VerifyCodeDialogState createState() => _VerifyCodeDialogState();
}

class _VerifyCodeDialogState extends State<VerifyCodeDialog> {
  String text='';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal:15,vertical: 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 15,),
            Container(
              height: 5,
              width: 135,
              decoration: BoxDecoration(
                  color: Color(0xFF2E313C),
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            SizedBox(height: 15,),
            Text(UITexts.ENTER_VERIFICATION_CODE, style: TextStyle(
                color: Color(0xFF22215B),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
            Text(UITexts.SMS_ARRIVES, style: TextStyle(
                color: Color(0xFFB8B8B8),
                fontSize: 14,
                fontWeight: FontWeight.normal),),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Container(
                    child: Expanded(
                      child: PinCodeTextField(
                        controller: textEditingController,
                        appContext:context,
                        length: 6,
                        obscureText: false,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.underline,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: 50,
                          fieldWidth: 40,
                          activeFillColor: Colors.black,
                          activeColor: Colors.black,
                          selectedColor: Colors.black,
                          inactiveColor: Colors.black
                        ),
                        cursorColor: Colors.black,
                        animationType: AnimationType.fade,
                        animationDuration: Duration(milliseconds: 300),
                        onChanged: (value) {
                          setState(() {
                            text = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            NumericKeyboard(
                onKeyboardTap: (value){
                  if(value.length<6){
                  setState(() {
                    text = text+value;
                    textEditingController.text=text;
                    textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));
                  });
                  }
                },
                textColor: Colors.black,
                rightButtonFn: () {
                setState(() {
                  text = text.substring(0, text.length - 1);
                  textEditingController.text = text;
                  textEditingController.selection = TextSelection.fromPosition(
                      TextPosition(offset: textEditingController.text.length));
                });
                },
                rightIcon: SvgPicture.asset('assets/svg/keyboard_back_button.svg', color: Colors.black,),
                leftButtonFn: () {
                  print('left button clicked');
                },
                mainAxisAlignment: MainAxisAlignment.spaceBetween
            ),
            Spacer(),
            MaterialButton(
              onPressed: (){
                print('verify code dialog clicked');
              },
              height: 62,
              minWidth: double.infinity,
              color: UIColors.NextButtonColor,
              elevation: 0,
              textColor:Colors.black,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)
                ),
              ),
              child: Text(UITexts.NEXT,style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),),
            ),
          ],
        ),
      ),
    );
  }
}
