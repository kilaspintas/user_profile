import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_profile/dummy_data.dart';
import 'home_Uplan.dart';
import 'masuk.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  TextEditingController _userController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(188, 216, 247, 1),
        centerTitle: true,
        title: Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Masuk()));
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(188, 216, 247, 1),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                child: Container(
                  height: 200,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/loginbyu.png'),
                        width: MediaQuery.of(context).size.width -10,
                        height: MediaQuery.of(context).size.height -40,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: 40,),
                 Text('Username\n',
                   style: TextStyle(
                     fontFamily: 'Gilroy',
                     fontSize: 18,
                   ),
                 ),
                ],
              ),
              InputForm(context, _userController, 'username'),
              SizedBox(height: 20,),

              Row(
                children: [
                  SizedBox(width: 40,),
                  Text('Password\n',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              InputForm(context, _passController, 'password'),
              SizedBox(height: 70,),
              Tombol(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget InputForm(BuildContext context, TextEditingController controller, String hint){
    return Container(
      width: MediaQuery.of(context).size.width-50,
      height: 30,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.white,
                width: 1,
              ),
            ),

            focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(
                  color: Colors.blue,
                )
            )
        ),
      ),
    );
  }

  Widget Tombol(BuildContext context){
    return InkWell(
      onTap: () async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final List<dynamic> mentah = json.decode(jsonEncode(DummyData.data));
        for (dynamic mentah in mentah) {
          prefs.setStringList(mentah["id"].toString(), <String>[mentah["username"], mentah["password"], mentah["nama"]]);
        }
        for(int i = 1; i<16; i ++){
          final List<String>? data = prefs.getStringList(i.toString());
          if(_userController.text == data![0] && _passController.text == data[1]){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeUPlan()));
            await prefs.setString("id_login", data[2]);
            const warning = SnackBar(content: Text('Berhasil Login'));
            ScaffoldMessenger.of(context).showSnackBar(warning);
          } else {
            print(null);
          }
        }
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white60,
        ),
        child: Center(
            child: Text(
              "Login",
              style: TextStyle(
                  fontFamily: 'Gilroy',
                  color: Colors.blueAccent,
                  fontSize: 18),
            )
        ),
      ),
    );
  }
}
