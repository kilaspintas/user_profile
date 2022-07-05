import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_profile/Page/PageFunction/addEditInfo.dart';
import 'package:user_profile/Page/PageFunction/listModel.dart';


class AddEditWidget extends StatelessWidget {
  final String title;
  final String? id;
  final UpdateModel? username;
  final UpdateModel? email;
  const AddEditWidget({
    Key? key,
    required this.title,
    this.id,
    this.username,
    this.email

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _username = TextEditingController();
    TextEditingController _email = TextEditingController();
    if(username != null && email !=null){
      _username.text = username!.username;
      _email.text = email!.email;
    }

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: _username,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelText: "Username",
                  hintText: "Masukkan Username"
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _email,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  labelText: "Email",
                  hintText: "Masukkan Email"
              ),
            )
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: (){
            Navigator.pop(context);
          },
          child: const Text("Batal"),
        ),
        TextButton(
          onPressed: () {
            if(_username.text.isEmpty){
              showDialog(
                context: context,
                builder: (context){
                  return const InfoWarning(
                    title: "Error!",
                    content: "Username tidak boleh kosong",
                  );
                },
              );
            } else if(_email.text.isEmpty){
              showDialog(
                context: context,
                builder: (context){
                  return const InfoWarning(
                    title: "Error!",
                    content: "Email tidak boleh kosong",
                  );
                },
              );
            }else {
              //edit
              if(id != null){
                String inputUsername = _username.text;
                String inputEmail = _email.text;
                String? idnya = id;
                String url = 'http://10.0.2.2:8000/api/berita/update/$idnya?username=$inputUsername&email=$inputEmail';
                Future _fetchDataUsers() async{
                  var hasil = await http.post(Uri.parse(url));
                  return json.decode(hasil.body)['message'];
                }
                _fetchDataUsers();
                // AlertDialog(
                //   backgroundColor: Colors.grey,
                //   content: FutureBuilder(
                //     future: _fetchDataUsers(),
                //     builder: (BuildContext context, AsyncSnapshot snapshot){
                //       return Text(snapshot.data['message'],);
                //     },
                //   ),
                // );
              }else {
                //add data
                String inputUsername = _username.text;
                String inputEmail = _email.text;
                String url = 'http://10.0.2.2:8000/api/berita/store?username=$inputUsername&email=$inputEmail';
                Future _fetchDataUsers() async{
                  var hasil = await http.post(Uri.parse(url));
                  return json.decode(hasil.body)['message'];
                }
                _fetchDataUsers();
                // AlertDialog(
                //   backgroundColor: Colors.grey,
                //   content: FutureBuilder(
                //     future: _fetchDataUsers(),
                //     builder: (BuildContext context, AsyncSnapshot snapshot){
                //       return Text(snapshot.data['message'],);
                //     },
                //   ),
                // );
              }
              Navigator.pop(context);
            }
          },
          child: const Text("Simpan"),
        ),
      ],
    );
  }
}

