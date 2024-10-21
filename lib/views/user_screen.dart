import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:social667/controllers/provider/user_provider.dart';
import 'package:social667/models/user.dart';

class userpage extends StatefulWidget {
  @override
  userpageState createState() => userpageState();
}

class userpageState extends State<userpage> {
  late UserProvider pUser;
  late User user;
  bool dataready = false;
  late var img;

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pUser = Provider.of<UserProvider>(context, listen: false);
    getData();
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        img = File(image.path);
      });
    }
  }

  Future<String?> _encodeImageToBase64(File? image) async {
    if (image == null) return null;
    final bytes = await image.readAsBytes();
    return base64Encode(bytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
      ),
      body: (dataready)
          ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            child: Image.memory(base64Decode(img)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Container(
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: TextFormField(
                        controller: nameController,
                        decoration:
                            const InputDecoration(labelText: 'Pseudonyme'),
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            )
          : const Center(
              child:
                  CircularProgressIndicator()), // Show loading indicator while fetching data
    );
  }

  void getData() async {
    user = pUser.getUser;

    nameController.text = user.name;

    img = user.photo!;
    print(img);
    setState(() {
      dataready = true;
    });
  }
}
