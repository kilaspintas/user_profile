import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:user_profile/Page/home_U-Taint.dart';
import 'package:user_profile/Page/profile_edit_ui.dart';
import 'listUpdate.dart';

class HomeUPlan extends StatefulWidget {
  const HomeUPlan({Key? key}) : super(key: key);

  @override
  State<HomeUPlan> createState() => _HomeUPlanState();
}

class _HomeUPlanState extends State<HomeUPlan> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
     body: Container(
       color: Colors.black12,
       child: Stack(
         clipBehavior: Clip.none,
         alignment: Alignment.center,
         children: [
           Positioned(
               child: Container(
                 color: Colors.lightBlueAccent,
               )
           ),
           Positioned(
               top: 40,
               child: Container(
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
                           style: TextStyle(
                             color: Colors.white,
                             fontFamily: 'Gilroy',
                             fontSize: 18,
                           ),),
                         Text(user.email!,
                           style: TextStyle(
                             color: Colors.white,
                             fontFamily: 'Gilroy',
                             fontSize: 16,
                           ),),
                       ],
                     ),
                     IconButton(
                         onPressed: (){},
                       icon : FaIcon(FontAwesomeIcons.bell,
                       color: Colors.white,
                     ),)
                   ],
                 ),
               )
           ),
           Positioned(
             top: 80,
               child: Container(
                 width: MediaQuery.of(context).size.width -60,
                 height: 110,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       decoration: BoxDecoration(
                         border: Border(
                             bottom: BorderSide(
                               color: Colors.white,
                               width: 1.5,
                             )
                         ),
                       ),
                       child: Text(
                         'U-Plan', style: TextStyle(
                         color: Colors.white,
                         fontFamily: 'Gilroy',
                         fontSize: 16,
                       ),
                       ),
                     ),
                     InkWell(
                       child: Text(
                         'Updates', style: TextStyle(
                         color: Colors.white,
                         fontFamily: 'Gilroy',
                         fontSize: 16,
                       ),
                       ),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeUpdate()));
                       },
                     ),
                     InkWell(
                       child: Text(
                         'U-Tainment', style: TextStyle(
                         color: Colors.white,
                         fontFamily: 'Gilroy',
                         fontSize: 16,
                       ),
                       ),
                       onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeUTainment()));
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
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                             children: [
                               Text('Pulsa Kamu', style: TextStyle(
                                 fontFamily: 'GilroyBold',
                                 fontWeight: FontWeight.bold,
                                 fontSize: 12,
                               ),),
                               Text('Rp 100.000',
                                 textAlign: TextAlign.left,
                                 style: TextStyle(
                                   fontFamily: 'GalroyBold',
                                   fontWeight: FontWeight.bold,
                                   fontSize: 12,
                                 ),),
                                 ],
                               ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Column(
                                 children: [
                                   IconButton(
                                       onPressed: (){},
                                       icon: FaIcon(FontAwesomeIcons.globe)
                                   ),
                                   Text("Beli Data")
                                 ],
                               ),
                               Column(
                                 children: [
                                   IconButton(
                                       onPressed: (){},
                                       icon: Icon(Icons.add_box_outlined)
                                   ),
                                   Text("Beli Topping")
                                 ],
                               ),
                               Column(
                                 children: [
                                   IconButton(
                                       onPressed: (){},
                                       icon: FaIcon(FontAwesomeIcons.moneyBillTransfer)
                                   ),
                                   Text("Beli Pulsa")
                                 ],
                               ),
                             ],
                           ),

                         ],
                       ),
                     ),
                   ),
                 ],
               )
           ),

           Positioned(
               top: 300,
               child: Row(
                 children: [
                   SizedBox(
                     width: MediaQuery.of(context).size.width -50,
                     height: 300,
                     child: Card(
                       color: Colors.white,
                       elevation: 5,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(15)
                       ),
                       child: Column(
                         children: [
                           SizedBox(height: 10,),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               SizedBox(width: 15,),
                               Text('Rincian Pemakaian', style: TextStyle(
                                 fontFamily: 'GilroyBold',
                                 fontSize: 16,
                               ),),
                               // GestureDetector(
                               //   onTap: (){Text("ai");},
                               //   child: Text('Lihat Detail', style: TextStyle(
                               //     fontFamily: 'Gilroy',
                               //     fontSize: 12,
                               //   ),),
                               // ),
                             ],
                           ),
                           SizedBox(height: 50,),
                           Row(
                             children: [
                               SizedBox(width: 15,),
                               FaIcon(FontAwesomeIcons.globe),
                               SizedBox(width: 17,),
                               Column(
                                 children: [
                                   Row(
                                     children: [
                                       Text('Sisa Data', style: TextStyle(
                                         fontFamily: 'Gilroy',
                                         fontSize: 15,
                                       ),),
                                       SizedBox(
                                         width: MediaQuery.of(context).size.width - 250.toDouble(),
                                       ),
                                       Text('70 GB', style: TextStyle(
                                         fontFamily: 'GilroyBold',
                                         fontWeight: FontWeight.bold,
                                         fontSize: 12,
                                       ),),
                                     ],
                                   ),
                                   Container(
                                     height: 15,
                                     width: MediaQuery.of(context).size.width - 150,
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       child: LinearProgressIndicator(
                                         backgroundColor: Colors.black12,
                                         valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                                         value: 0.7,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                           SizedBox(height: 30,),
                           Row(
                             children: [
                               SizedBox(width: 13,),
                               Icon(Icons.add_box_outlined),
                               SizedBox(width: 17,),
                               Column(
                                 children: [
                                   Row(
                                     children: [
                                       Text('Sisa Topping', style: TextStyle(
                                         fontFamily: 'Gilroy',
                                         fontSize: 15,
                                       ),),
                                       SizedBox(
                                         width: MediaQuery.of(context).size.width - 250.toDouble(),
                                       ),
                                       Text('5 GB', style: TextStyle(
                                         fontFamily: 'GilroyBold',
                                         fontWeight: FontWeight.bold,
                                         fontSize: 12,
                                       ),),
                                     ],
                                   ),
                                   Container(
                                     height: 15,
                                     width: MediaQuery.of(context).size.width - 150,
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       child: LinearProgressIndicator(
                                         backgroundColor: Colors.black12,
                                         valueColor: AlwaysStoppedAnimation(Colors.lightGreen),
                                         value: 0.5,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                           SizedBox(height: 30,),
                           Row(
                             children: [
                               SizedBox(width: 15,),
                               FaIcon(FontAwesomeIcons.phone),
                               SizedBox(width: 18,),
                               Column(
                                 children: [
                                   Row(
                                     children: [
                                       Text('Sisa Telfon', style: TextStyle(
                                         fontFamily: 'Gilroy',
                                         fontSize: 15,
                                       ),),
                                       SizedBox(
                                         width: MediaQuery.of(context).size.width - 250.toDouble(),
                                       ),
                                       Text('1 Menit', style: TextStyle(
                                         fontFamily: 'GilroyBold',
                                         fontWeight: FontWeight.bold,
                                         fontSize: 12,
                                       ),),
                                     ],
                                   ),
                                   Container(
                                     height: 15,
                                     width: MediaQuery.of(context).size.width - 150,
                                     child: ClipRRect(
                                       borderRadius: BorderRadius.all(Radius.circular(10)),
                                       child: LinearProgressIndicator(
                                         backgroundColor: Colors.black12,
                                         valueColor: AlwaysStoppedAnimation(Colors.black38),
                                         value: 0.1,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ],
                       ),
                     ),
                   ),
                 ],
               )
           ),
         ],
       ),
     ),
    );
  }
}
