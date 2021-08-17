import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groopy_app/constants/UIColors.dart';
import 'package:groopy_app/constants/UITexts.dart';
import 'package:groopy_app/widgets/dialogs/verify_code_dialog.dart';

import '../numeric_keyboard.dart';

class UpdatesDialog extends StatefulWidget {
  const UpdatesDialog({Key? key}) : super(key: key);

  @override
  _UpdatesDialogState createState() => _UpdatesDialogState();
}

class _UpdatesDialogState extends State<UpdatesDialog> {
  String text='';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.fromLTRB(20, 200, 20, 200),
      color: Colors.transparent,
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
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
            Text(UITexts.UPDATE_TITLE, style: TextStyle(
                color: Color(0xFF22215B),
                fontSize: 18,
                fontWeight: FontWeight.bold)),


            SizedBox(height: 50,),
            Expanded(
            child: Scrollbar(
              child: ListView(
                children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:30.0),
                   child: Text(
                              UITexts.UPDATE_TEXT,
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                   ),
                 )
                ],
              ),
            ),
          ),
            SizedBox(height: 50,),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pop(context);
                      // show the dialog to enter verification code
                      showDialog(context: context, builder: (BuildContext context) {
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
                      ),
                    ),
                    child: Text(UITexts.UPDATE_BUTTON_TEXT,style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.pop(context);

                    },
                    height: 62,
                    minWidth: double.infinity,
                    color: UIColors.NextButtonColor,
                    elevation: 0,
                    textColor:Colors.black,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.only(
                          bottomRight: Radius.circular(16)
                      ),
                    ),
                    child: Text(UITexts.UPDATE_LATER_TEXT,style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
