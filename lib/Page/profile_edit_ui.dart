import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_Uplan.dart';

class ProfileUI extends StatefulWidget{

  ProfileUI({Key? key}) : super(key: key);

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  CollectionReference data_user = FirebaseFirestore.instance.collection('data_user');
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  bool circular = false;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Color.fromRGBO(0, 230, 255, 1),
        centerTitle: true,
        title: Text(
          'Ubah Profil',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),),

        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ), onPressed: () {
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (builder) => const HomeUPlan()),
                  (route) => false);
        },
        ),
      ),
      body: Container(
        color: Colors.white70,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: Image(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height/4,
                      fit: BoxFit.cover,
                      image: AssetImage('images/profileBg.jpg'),
                    ),
                  ),

                  Positioned(
                    top: 50.0,
                    left: 160.0,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),),

                  Container(
                    height: 160.0,
                    alignment: Alignment.bottomCenter,
                    child: Text('Edit photo',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 17,
                        color: Colors.white,
                      ),),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    'Nama\n',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Gilroy'
                    ),
                  )),
                  InputForm(350, _namaController),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    'Email\n',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Gilroy'
                    ),
                  )),
              InputForm(350, _emailController),

              SizedBox(
                height: 20,
              ),

              SizedBox(
                  width: MediaQuery.of(context).size.width - 40,
                  child: Text(
                    'Tanggal Lahir\n',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontFamily: 'Gilroy'
                    ),
                  )),
                  InputForm(350, _tanggalLahirController),

              SizedBox(
                height: 10,
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width - 40,
                child: Text(
                'Yuk, diisi biar nanti dapat hadiah dari Nindy pas ultah',
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 12,
                    color: Color.fromRGBO(0, 230, 255, 1),
                  ),),
              ),

              SizedBox(
                height: 130,
              ),

              Tombol(),

              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget InputForm(double Lebar, TextEditingController controller) {
    return Container(
      width: Lebar,
      height: 30,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.black38,
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

  Widget Tombol(){
    return InkWell(
      onTap: () async{
        setState(() {
          circular = true;
        });
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('nama_key', _namaController.text);
        prefs.setString('email_key', _emailController.text);
        prefs.setString('tanggal_key', _tanggalLahirController.text);

        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeUPlan()));
      },
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Color.fromRGBO(0, 230, 255, 1),
        ),
        child: Center(
            child: circular?CircularProgressIndicator():
            Text(
              "Ubah Profile",
              style: TextStyle(
                fontFamily: 'Gilroy',
                  color: Colors.white,
                  fontSize: 18),
            )
        ),
      ),
    );
  }
}