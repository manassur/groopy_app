import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groopy_app/constants/UIColors.dart';
import 'package:groopy_app/constants/UITexts.dart';
import 'package:groopy_app/widgets/dialogs/select_country_dialog.dart';
import 'package:groopy_app/widgets/dialogs/verify_code_dialog.dart';

import '../numeric_keyboard.dart';

class EnterMobileNumberDialog extends StatefulWidget {
  const EnterMobileNumberDialog({Key? key}) : super(key: key);

  @override
  _EnterMobileNumberDialogState createState() => _EnterMobileNumberDialogState();
}

class _EnterMobileNumberDialogState extends State<EnterMobileNumberDialog> {
  String text='';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal:15,vertical: 70),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Container(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: 5,
              width: 135,
              decoration: BoxDecoration(
                  color: Color(0xFF2E313C),
                  borderRadius: BorderRadius.circular(5)
              ),
            ),
            SizedBox(height: 20,),
            Text(UITexts.ENTER_YOUR_MOBILE_NUMBER, style: TextStyle(
                color: Color(0xFF22215B),
                fontSize: 18,
                fontWeight: FontWeight.bold)),
            Text(UITexts.WE_WILL_SEND_YOU_A_VERIFICATION, style: TextStyle(
                color: Color(0xFFB8B8B8),
                fontSize: 14,
                fontWeight: FontWeight.normal),),
            SizedBox(height: 20,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //clicking on this shows the country picker dialog
                  GestureDetector(
                    onTap:(){
                      print('select country clicked');
                      showModalBottomSheet(
                          isScrollControlled: true,
                          isDismissible: true,
                          backgroundColor:Colors.transparent,
                          context: context,
                          builder: (BuildContext context)
                          {
                            return SelectCountryDialog();
                          });
                    },
                    child: Text('+33', style: TextStyle(
                        color: Color(0xFFB8B8B8),
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                  ),

                  // input field for phone number
                  Expanded(
                    child: TextFormField(
                      controller: textEditingController,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.phone,
                      showCursor: true,
                      readOnly: true,
                      style:  TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      cursorHeight: 30,
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding:
                          EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                          hintText: ""),
                    ),
                  ),
                ],
              ),
            ),
            NumericKeyboard(
                onKeyboardTap: (value){
                  setState(() {
                    text = text+value;
                    textEditingController.text=text;
                    textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));

                  });
                },
                textColor: Colors.black,
                rightButtonFn: () {
                  setState(() {
                    text = text.substring(0, text.length - 1);
                    textEditingController.text=text;
                    textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: textEditingController.text.length));

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
                Navigator.pop(context);
                print('verify code button clicked');
                // show the dialog to enter verification code
                showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    backgroundColor:Colors.transparent,
                    context: context,
                    builder: (BuildContext context)
                    {
                      return VerifyCodeDialog();
                    });
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
