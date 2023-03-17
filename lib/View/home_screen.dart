// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:lec_14_15/Control/db_helper.dart';
import 'package:lec_14_15/View/add_view.dart';
import 'package:lec_14_15/View/login%20_view.dart';
import 'package:lec_14_15/linker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DBHelper db = DBHelper.dbIstance;
  List notes = [];

 String UserName='';
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getUserName();
    getNote();

  }

  //________________GetuserName()
  getUserName()async
  {
    SharedPreferences pref=await SharedPreferences.getInstance();
    UserName= pref.getString('name').toString();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2E86DE),
          leading: Text(""),
          title: Text(UserName),
          actions: [
            InkWell(
                onTap: () {
                  Get.to(AddView());
                },
                child: Icon(Icons.add)),
            const SizedBox(
              width: 6,
            ),
            IconButton(onPressed: (){
                Get.defaultDialog(
                  title: "",
                  middleText: "",
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Are you soure to log out?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(onPressed: (){
                            logOut();
                            Get.to(LoginView());
                          }, child: const Text("Yess")),

                          TextButton(onPressed: (){
                              Get.back();
                          }, child: const Text("Cancel"))
                        ],
                      ),
                    ],
                  )
                );
            }, icon: const Icon(Icons.logout))
          ],
        ),
        body: ListView.builder(
            itemCount: notes.length,
            itemBuilder: ((context, index) {
              String str=notes[index]['title'];
              // List<String> titleFirstltr=str.split('');
              return Card(
              
                color: Color(0xff487EB0),
              
                child: Center(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 21,
                      backgroundColor: Colors.amber,
                      child: CircleAvatar(
                        backgroundColor: Color(0xff78E08F),
                        
                        child: myText(str[0], 20, Colors.red, FontWeight.w500),
                      ),
                    ),
                    title: myText(notes[index]['title'].toString(), 20,
                        Colors.white, FontWeight.w500),
                    subtitle: Column(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          myText(notes[index]['message'].toString(), 15,
                              Colors.white, FontWeight.normal),
                          myText(notes[index]['date'].toString(), 15,
                              Colors.white, FontWeight.normal)
                        ]),
                    trailing: Wrap(
                     
                      children: [
                        IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        Get.defaultDialog(
                            title: "",
                            middleText: "",
                            content: Column(
                              children: [
                                updateView(
                                    notes[index]['id'],
                                    notes[index]['title'].toString(),
                                    notes[index]['message'].toString()),
                                TextButton(
                                    onPressed: () {
                                      updateNote(notes[index]['id']);
                                    },
                                    child: const Text("update"))
                              ],
                            ));
                      },
                    ),
                    //____________________deleticon
                     IconButton(onPressed: (){
                Get.defaultDialog(
                  title: "",
                  middleText: "",
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Are you soure to delete?"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          
                          TextButton(onPressed: (){
                            deleteNote(notes[index]['id']);
                            getNote();
                            Get.back();
                            
                          }, child: const Text("Yess")),

                          TextButton(onPressed: (){
                              Get.back();
                          }, child: const Text("Cancel"))
                        ],
                      ),
                    ],
                  )
                );
            }, icon: const Icon(Icons.delete),color: Colors.white,
                        iconSize: 20,)

                      ],
                    )
                  ),
                ),
              );
            })),
      ),
    );
  }

  //________________get all notes
  getNote() async {
    notes = await db.read();
    setState(() {});
  }

  //_________________update note()
  updateNote(int id) async {
    DBHelper db = DBHelper.dbIstance;
    Note newNote = Note();
    newNote.title = titleCntrl.text;
    newNote.message = noteCntrl.text;
    newNote.date =
        "${TimeOfDay.now().hour} : ${TimeOfDay.now().minute} ${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    await db.update(newNote, id);

    getNote();
    Get.back();
  }

  //_______________logout()
  logOut() async
  {
    SharedPreferences pref=await SharedPreferences.getInstance();
    pref.clear();
  }
  //_________________delete()
  deleteNote(int id) async
  {
    DBHelper db = DBHelper.dbIstance;
    await db.delete(id);
  }
}
