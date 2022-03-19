import 'package:flutter/material.dart';

class ProfileUI extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: [
            Image(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
                fit: BoxFit.cover,
                image: AssetImage('images/bg.jpg')
            ),
            Positioned(
              bottom: -60.0,
                child: CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('images/HuTao.jpg'),
                )
            )
          ],
        ),
        SizedBox(
          height: 60,),
        ListTile(
          title: Center(child: Text('Irfan Rosyadi',
            style: TextStyle(fontFamily: 'Genshin', fontSize: 20, fontWeight: FontWeight.w500),)),
          subtitle: Center(child: Text('Director',
          style: TextStyle(fontFamily: 'Genshin'),)),
        ),
        FlatButton.icon(
          onPressed: (){},
          icon: Icon(Icons.add, color: Colors.white,),
          label: Text(
            'Invite',
            style: TextStyle(color: Colors.white, fontFamily: 'Genshin'),
          ), color: Colors.green,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)
          ),
        ),
        ListTile(
          title: Text('About Me',
            style: TextStyle(fontFamily: 'Genshin',
            fontSize: 18)
            ,),
          subtitle: Text('The 77th Director of the Wangsheng Funerlar Parlor, I took over the business at a rather young age.',
          style: TextStyle(fontFamily: 'Genshin',
          fontSize: 14),),
        )
      ],
    );
  }
}