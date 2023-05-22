/// Main coder: Khue
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Fulbright_Vietnam_Forum/NaviBar.dart';
import 'package:like_button/like_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<dynamic> _getpost(String category, String topic) async {
  var db = FirebaseFirestore.instance;
  final data = db
      .collection('post')
      .where('Category', isEqualTo: category)
      .where('Topic', isEqualTo: topic)
      .get()
      .then((querySnapshot) {
    return [for (var docSnapshot in querySnapshot.docs) docSnapshot.data()];
  });
  return data;
}

String text = '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.category, required this.topic});
  final category;
  final topic;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Bar(),
      body: _postsListView(context),
    );
  }

  Widget _postAuthorRow(BuildContext context, String user) {
    const double avatarDiameter = 30;
    return GestureDetector(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: avatarDiameter,
              height: avatarDiameter,
              decoration: const BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(avatarDiameter / 2),
                child: Image.asset(
                  'images/pfp/profilepic.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            user,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }

  Widget _postCaption(String content) {
    String caption = content;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(caption, style: const TextStyle(fontSize: 16)),
    );
  }

  Widget _postContent(String content) {
    String subText;
    if (content.length < 250) {
      subText = content;
    } else {
      subText = content.substring(0, 250) + "...";
    }
    ;
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        //text should be imported from database and not hardcode
        child: Text(subText, style: const TextStyle(fontSize: 12)));
  }

  Widget _postImage(String image) {
    return Center(
        child: Container(
      width: 400,
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    ));
  }

  Widget _commentButton(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Icon(
        Icons.add_comment_rounded,
        color: Color.fromARGB(255, 19, 57, 101),
        size: 24.0,
      ),
    );
  }

  Widget interactButtons(BuildContext context, int likeCount) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      LikeButton(
        size: 27,
        likeCount: likeCount,
        //onTap: onLikeButtonTapped, #send to the server
      ),
      _commentButton(context),
    ]);
  }

  Widget deleteButtion(BuildContext context, int index) {
    return IconButton(
        onPressed: () {
          //   setState(() {
          //     captionData.removeAt(index);
          //     contentData.removeAt(index);
          //   });
        },
        icon: const Icon(Icons.delete));
  }

  Widget editButtion(BuildContext context, int index) {
    return IconButton(
        onPressed: () {
          //alert: all of these are kinda stupid
          //just prompt the posting page again and update
          showDialog(
              context: context,
              builder: (context) => SimpleDialog(
                    children: [
                      TextField(
                        onChanged: (value) {
                          setState(() {
                            text = value; //take the input value
                          });
                        },
                      ),
                      ElevatedButton(
                          onPressed: () {
                            // setState(() {
                            //   contentData[index] = text; //update the value
                            // });
                            // Navigator.pop(context);
                          },
                          child: const Text('edit'))
                    ],
                  ));
        },
        icon: const Icon(Icons.edit));
  }

  Widget _postView(BuildContext context, Map<String, dynamic> post, int index) {
    return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _postAuthorRow(context, post['user'].toString()),
            _postImage(post['Image'].toString()),
            _postCaption(post['Title'].toString()),
            _postContent(post['Content'].toString()),
            interactButtons(context, post['like_count']),
          ],
        ),
        trailing: Container(
            width: 80,
            child: Row(
              children: [
                deleteButtion(context, index),
                editButtion(context, index),
              ],
            )));
  }

  Widget _postsListView(BuildContext context) {
    return FutureBuilder(
        future: _getpost('${widget.category}', '${widget.topic}'),
        builder: (context, snapshot) {
          List<Map<String, dynamic>>? posts;
          if (snapshot.hasData) {
            posts = snapshot.data;
          } else {
            return Center(child: Text("Loading"));
          }
          if (posts!.isEmpty) {
            return Scaffold(
                body: Center(
                    child: Text("There're currently no post in this topic")));
          }
          return ListView.builder(
              itemCount: posts!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(15.5),
                  padding: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                  ),
                  //text imported from database
                  child: _postView(context, posts![index], index),
                );
              });
        });
  }
}
