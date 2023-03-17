import 'package:flutter/foundation.dart';
import 'package:lec_14_15/View/add_view.dart';
import 'package:lec_14_15/linker.dart';

TextEditingController nameController = TextEditingController();

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          myText("Note Keeper", 40, Color.fromARGB(255, 51, 58, 43),
              FontWeight.w700),
          SizedBox(
            height: MediaQuery.of(context).size.height * .20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .30,
            child: Column(children: [
              custmTextField(
                  "Enter Your Name", Colors.black, 15, nameController),
              SizedBox(
                height: 10,
              ),
              myTxtButton("Login")
            ]),
          )
        ]),
      ),
    );
  }
}
