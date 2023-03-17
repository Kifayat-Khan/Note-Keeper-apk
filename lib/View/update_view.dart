import 'package:lec_14_15/Control/db_helper.dart';
import 'package:lec_14_15/View/home_screen.dart';
import 'package:lec_14_15/linker.dart';
  TextEditingController titleCntrl=TextEditingController();
  TextEditingController noteCntrl=TextEditingController();
updateView(int id,String title, String message)
{

  titleCntrl.text=title;
  noteCntrl.text=message;
  return Container(
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    height: 200,
    decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black),borderRadius: BorderRadius.circular(6)),
    
    child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //myText("ADD YOUR NOTE HERE", 20, Colors.black, FontWeight.w600),
            custmTextField("Enter Title", Colors.black, 15, titleCntrl),
            custmTextField("Enter Note here", Colors.black, 14, noteCntrl),
           
          ],
        )
  );

}