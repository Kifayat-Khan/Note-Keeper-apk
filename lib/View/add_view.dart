import 'package:lec_14_15/View/home_screen.dart';
import 'package:lec_14_15/View/login_view.dart';
import 'package:lec_14_15/linker.dart';

import '../Control/db_helper.dart';

class AddView extends StatelessWidget {
   AddView({super.key});
  TextEditingController titleCntrl=TextEditingController();
  TextEditingController noteCntrl=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        //width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Container(
          margin: const EdgeInsets.only(left: 25,right: 25),
          height: MediaQuery.of(context).size.height * 0.70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              myText("ADD YOUR NOTE HERE", 20, Colors.black, FontWeight.w600),
              custmTextField("Enter Title", Colors.black, 15, titleCntrl),
              custmTextField("Enter Description here", Colors.black, 14, noteCntrl),
              TextButton(onPressed: () async{
               await addNote();
    
              }, child: myText("Add", 16, Color.fromARGB(255, 0, 0, 0), FontWeight.bold)
              )
    
            ],
          ),
        ),
      ),
    );
  }

  addNote() async
  {
      DBHelper db=DBHelper.dbIstance;
      Note newNote=Note();
      newNote.title=titleCntrl.text;
      newNote.message=noteCntrl.text;
      newNote.date="${TimeOfDay.now().hour} : ${TimeOfDay.now().minute} ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
     await db.create(newNote);
     Get.to(HomeScreen());
  }
}