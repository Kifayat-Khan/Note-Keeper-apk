import 'package:lec_14_15/View/home_screen.dart';
import 'package:lec_14_15/linker.dart';


class LoginView extends StatelessWidget {
   LoginView({super.key});
TextEditingController nameCntrl=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
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
                myText("Login", 20, Colors.black, FontWeight.w600),
                custmTextField("Your Name", Colors.black, 15, nameCntrl),
               
                TextButton(onPressed: () async{
                 storeName();
                 Get.to(HomeScreen());
      
                }, child: myText("Login", 16, Color.fromARGB(255, 0, 0, 0), FontWeight.bold)
                )
      
              ],
            ),
          ),
        ),
      ),
    );
  }
  storeName()async
  {
   SharedPreferences pref=await SharedPreferences.getInstance();
   pref.setString('name', nameCntrl.text);
  }
}