import 'package:flutter/material.dart';

AppBar appBarAccount(widthScreen, context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: IconButton(
        icon: const Icon(
          Icons.account_circle_rounded,
          color: Colors.black,
        ),
        onPressed: () async {
          /*
          User user = await PersistanceHandler().getUserInformation();
          if (user.id == 0) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginPage(shouldGoMP: false)));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfilePage()));
          } */
        },
      ),
    ),
    title: const Padding(
      padding: EdgeInsets.only(top: 5),
      /*
      child: Image(
        height: 50,
        width: 100,
        image: AssetImage('assets/Logos/logo.png'),
      ),*/
    ),
    bottom: PreferredSize(
      preferredSize: Size(widthScreen, 15),
      child: Row(
        children: [
          Container(
            height: 2,
            width: widthScreen,
            color: Colors.orange,
          ),
        ],
      ),
    ),
  );
}

AppBar appBarSignUp(widthScreen, context) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: const Padding(
      padding: EdgeInsets.only(top: 5),
      child: Image(
        height: 50,
        width: 100,
        image: AssetImage('assets/Logos/logo.png'),
      ),
    ),
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () async {
        Navigator.pop(context);
      },
    ),
    bottom: PreferredSize(
      preferredSize: Size(widthScreen, 15),
      child: Row(
        children: [
          Container(
            height: 2,
            width: widthScreen,
            color: Colors.orange,
          ),
        ],
      ),
    ),
  );
}
