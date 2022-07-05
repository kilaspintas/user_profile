import 'package:flutter/material.dart';
import 'package:user_profile/Page/profile_edit_ui.dart';
import 'package:user_profile/session.dart';

class NotifRoute extends StatefulWidget {
  const NotifRoute({Key? key}) : super(key: key);

  @override
  State<NotifRoute> createState() => _NotifRouteState();
}

class _NotifRouteState extends State<NotifRoute> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
          '/route-page': (_) => ProfileUI(),
      },
      home: const Navigasi(),
    );
  }
}
