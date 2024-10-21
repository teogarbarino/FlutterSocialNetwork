import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social667/controllers/persistance_handler.dart';
import 'package:social667/controllers/provider/user_provider.dart';
import 'package:social667/controllers/service/https_service.dart';
import 'package:social667/models/post.dart';

import '../global/route.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late UserProvider pUser;
  late var img;
  late List<Post> posts;
  bool dataready = false;
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

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      (dataready)
          ? Expanded(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 100,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: posts
                        .map((post) => _buildPostItem(context, post))
                        .toList(),
                  ),
                ),
              ),
            )
          : const LinearProgressIndicator()
    ]);
  }

  Image base64String(String data) {
    return Image.memory(base64Decode(data));
  }

  Widget _buildPostItem(BuildContext context, Post post) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(8.0), // Add padding for better spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Align content to left
          children: [
            if (post.image !=
                "") // Check for empty image before network request
              Image.network(post.image),
            const SizedBox(height: 8.0),
            Text(
              post.description,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 8.0),
            Text(
              (post.createdAt).toString(),
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    const Icon(Icons.message, size: 24),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          post.messages.length.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
      // onDoubleTap: ,
    );
  }

  void getData() async {
    
    var response = await HttpService().makeGetRequestWithToken(uGetPost);
    Iterable decodedResponse = jsonDecode(response.body); 

    posts = decodedResponse.map((model) => Post.fromJson(model)).toList(); 

    posts = [
      Post(
        id: 'post1',
        authorId: 'user1',
        title: 'First Post',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: '',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
      Post(
        id: 'post1',
        authorId: 'user1',
        title: 'First Post',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: '',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
      Post(
        id: 'post1',
        authorId: 'user1',
        title: '669',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: '',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
      Post(
        id: 'post1',
        authorId: 'user1',
        title: 'First Post',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: 'https://example.com/post1.jpg',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
      Post(
        id: 'post1',
        authorId: 'user1',
        title: '667',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: '',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
      Post(
        id: 'post1',
        authorId: 'user1',
        title: '669',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: '',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
      Post(
        id: 'post1',
        authorId: 'user1',
        title: 'First Post',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: 'https://example.com/post1.jpg',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
      Post(
        id: 'post1',
        authorId: 'user1',
        title: '667',
        description: 'This is the first post.',
        createdAt: DateTime.now(),
        image: '',
        messages: [
          Message(
            author: "10",
            content: 'Nice post!',
            sentAt: null,
          ),
        ],
      ),
    ];

    setState(() {
      dataready = true;
      posts;
    });
  }
}
