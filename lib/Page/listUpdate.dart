import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_profile/Page/PageFunction/addEdit.dart';
import 'package:user_profile/Page/home_U-Taint.dart';
import 'package:user_profile/Page/profile_edit_ui.dart';
import 'home_Uplan.dart';

class HomeUpdate extends StatefulWidget {
  const HomeUpdate({Key? key}) : super(key: key);

  @override
  State<HomeUpdate> createState() => _HomeUpdateState();
}

class _HomeUpdateState extends State<HomeUpdate> {
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    const String apiUrl = 'http://10.0.2.2:8000/api/berita';

    Future<List<dynamic>> _fetchDataUsers() async{
      var hasil = await http.get(Uri.parse(apiUrl));
      return json.decode(hasil.body)['data'];
    }


    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
                color: Colors.lightBlue,
              )
          ),
          Positioned(
              top: 40,
              child: SizedBox(
                width: MediaQuery.of(context).size.width-30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => ProfileUI()));
                      },
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(user.photoURL!),
                      ),
                    ),
                    Column(
                      children: [
                        Text(user.displayName!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gilroy',
                            fontSize: 18,
                          ),),
                        Text(user.email!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Gilroy',
                            fontSize: 16,
                          ),),
                      ],
                    ),
                    IconButton(
                      onPressed: (){},
                      icon : const FaIcon(FontAwesomeIcons.bell,
                        color: Colors.white,
                      ),)
                  ],
                ),
              )
          ),
          Positioned(
              top: 80,
              child: SizedBox(
                width: MediaQuery.of(context).size.width -60,
                height: 110,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      child: const Text(
                        'U-Plan', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                      ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const HomeUPlan()));
                      },
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 1.5,
                            )
                        ),
                      ),
                      child: const Text(
                        'Updates', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                      ),
                      ),
                    ),
                    InkWell(
                      child: const Text(
                        'U-Tainment', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                      ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const HomeUTainment()));
                      },
                    ),
                  ],
                ),
              )
          ),

          Positioned(
              top: 180,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width -50,
                    height: 100,
                    child: Card(
                      color: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                    ),
                  ),
                ],
              )
          ),

          const Positioned(
              top: 290,
              left: 40,
              bottom: 0,
              right: 0,
              child: Text('Yang Terbaru Dari by.U',
                style: TextStyle(
                  fontFamily: 'GilroyBold',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),

              )
          ),


          Positioned(

            top: 320,
            left: 25,
            right: 25,
            bottom: 0,

            child: Scaffold(
              backgroundColor: Colors.transparent,
              body : FutureBuilder<List<dynamic>>(
                future: _fetchDataUsers(),
                builder: (BuildContext context, AsyncSnapshot snapshot){
                  if (snapshot.hasData){
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext contect, int index){
                          return Dismissible(
                            key: Key(snapshot.data[index]['id'].toString()),
                            background: Container(
                              color: Colors.grey,
                              child: const Center(
                                child: Text(
                                  "Hapus Data",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            child: Card(
                              child: ListTile(
                                title: Text(snapshot.data[index]['username'],
                                style: const TextStyle(
                                  fontFamily: 'Gilroy',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                ),),
                                subtitle: Text(snapshot.data[index]['email'],
                                  style: const TextStyle(
                                      fontFamily: 'Gilroy',
                                      fontSize: 18,
                                  ),
                                ),
                                onTap: (){
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AddEditWidget(
                                          title: "Edit Data",
                                          // username: 'tahu',
                                          // email: snapshot.data[index]['email'],
                                          id : snapshot.data[index]['id'].toString(),
                                        );
                                      });
                                },
                              ),
                            ),
                            onDismissed: (direction){
                              String idnya = snapshot.data[index]['id'].toString();
                              String url = 'http://10.0.2.2:8000/api/berita/delete/$idnya';
                              Future _fetchDataUsers() async{
                                var hasil = await http.get(Uri.parse(url));
                                return json.decode(hasil.body)['message'];
                              }
                              _fetchDataUsers();

                            },
                          );
                        },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context){
                        return const AddEditWidget(title: "Add Data");
                      });
                },
                child: const Icon(Icons.add),
              ),
            )
          ),
        ],
      ),
    );
  }
}
