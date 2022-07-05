import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_profile/Firebase/auth.dart';
import 'package:user_profile/Firebase/googleSetup.dart';
import 'login.dart';

class Masuk extends StatefulWidget {
  const Masuk({Key? key}) : super(key: key);

  @override
  State<Masuk> createState() => _MasukState();
}

class _MasukState extends State<Masuk> {

  AuthService otentikasi = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(188, 216, 247, 1),
        centerTitle: true,
        title: Text(
          'Buat Akun',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height+225,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(188, 216, 247, 1),
          child: Column(
            children: [
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20,),
                  Text(
                    'Masuk',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  SizedBox(width: 20),
                  Text(
                    'Login untuk lihat akun kamu yuk',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 0.0),
                child: Container(
                  height: 250,
                  child: Row(
                    children: [
                      Image(
                        image: AssetImage('images/byuban.png'),
                        width: MediaQuery.of(context).size.width -10,
                        height: MediaQuery.of(context).size.height -40,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login dengan',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.lightBlue,
                      backgroundImage: AssetImage('images/byu.png'),
                    ),
                  ),
                  SizedBox(width: 20,),
                  GestureDetector(
                    onTap: () async {
                      final provider =
                      Provider.of<GoogleSignInProvider>(context, listen: false);
                      provider.googleLogin();
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('images/google.png'),
                    ),
                  ),
                  SizedBox(width: 20,),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color.fromRGBO(45, 45, 156, 1),
                    backgroundImage: AssetImage('images/fb.png'),
                  ),
                  SizedBox(width: 20,),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('images/phone.png'),
                  )
                ],
              ),
              SizedBox(height: 100,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tidak punya akun ?',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Daftar',
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 16,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

