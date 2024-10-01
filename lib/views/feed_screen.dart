import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social667/controllers/persistance_handler.dart';
import 'package:social667/controllers/provider/user_provider.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late UserProvider pUser;
  late var img;
  @override
  void initState() {
    super.initState();
    pUser = Provider.of<UserProvider>(context, listen: false);
    getData();
  }

  @override
  Widget build(BuildContext context) {
    double heightScreen = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text(pUser.getUser.name), Image.memory(base64Decode(img))]);
  }

  Image base64String(String data) {
    return Image.memory(base64Decode(data));
  }

  void getData() async {
    img = await PersistanceHandler().getPhotoToken();
    setState(() {
      img;
    });
  }
}
