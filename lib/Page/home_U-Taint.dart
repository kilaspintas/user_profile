import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_profile/Firebase/googleSetup.dart';
import 'package:user_profile/session.dart';
import 'home_Uplan.dart';
import 'listUpdate.dart';

class HomeUTainment extends StatefulWidget {
  const HomeUTainment({Key? key}) : super(key: key);

  @override
  State<HomeUTainment> createState() => _HomeUTainmentState();
}

class _HomeUTainmentState extends State<HomeUTainment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          Positioned(
              child: Container(
                color: Colors.lightBlueAccent,
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
                    InkWell(
                      child: Text(
                        'U-Plan', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                      ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => HomeUPlan()));
                      },
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
                        'U-Taintment', style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Gilroy',
                        fontSize: 16,
                      ),
                      ),
                    ),
                  ],
                ),
              )
          ),

          Positioned(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
                child: Center(
                    child: GestureDetector(
                      onTap: (){
                        final provider =
                        Provider.of<GoogleSignInProvider>(context, listen: false);
                        provider.logout();
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => const Navigasi()));
                      },
                      child: Text(
                          "Logout", style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      ),
                    )),
              )),
        ],
      ),
    );
  }
}
