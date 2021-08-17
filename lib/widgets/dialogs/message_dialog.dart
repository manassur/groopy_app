import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:groopy_app/constants/UIColors.dart';
import 'package:groopy_app/constants/UITexts.dart';
import 'package:groopy_app/widgets/dialogs/updates_dialog.dart';
import 'package:groopy_app/widgets/dialogs/verify_code_dialog.dart';

import '../numeric_keyboard.dart';

class MessageDialog extends StatefulWidget {
  const MessageDialog({Key? key}) : super(key: key);

  @override
  _MessageDialogState createState() => _MessageDialogState();
}

class _MessageDialogState extends State<MessageDialog> {
  String text='';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(UITexts.MESSAGE_TITLE, style: TextStyle(
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
                              UITexts.MESSAGE_TEXT,
                              style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),
                   ),
                 )
                ],
              ),
            ),
          ),
            SizedBox(height: 50,),
            Spacer(),
            MaterialButton(
              onPressed: (){
                Navigator.pop(context);
                // show the dialog to enter verification code
                showModalBottomSheet(
                    isScrollControlled: true,
                    isDismissible: true,
                    backgroundColor:Colors.transparent,
                    context: context,
                    builder: (BuildContext context)
                    {
                      return UpdatesDialog();
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
              child: Text(UITexts.GOT_IT,style: TextStyle(
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
