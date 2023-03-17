import 'package:lec_14_15/linker.dart';



myTxtButton(String txt)
{
  return TextButton(onPressed: (){
     

    
   

  }, child: myText(txt, 15, Colors.black, FontWeight.w200),
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.red)
  ),
  );
}