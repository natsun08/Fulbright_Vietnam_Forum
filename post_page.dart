/// Main coder: Khue
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:Fulbright_Vietnam_Forum/NaviBar.dart';
import 'package:like_button/like_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Hard coding Category and Topic
const Category = "Student Life";
const Topic = "Baking";

// Query data //
var db = FirebaseFirestore.instance;
final data = db
    .collection('post')
    .where('Category', isEqualTo: 'Student Life')
    .where('Topic', isEqualTo: 'Baking')
    .get()
    .then((querySnapshot) {
  return [for (var docSnapshot in querySnapshot.docs) docSnapshot.data()];
});

// List<String> contentData = [
//   "Hi everyone,\n\nI'm curious to know what are some of the best studying methods that you use to prepare for exams. Studying methods are ways to help you remember important concepts and information. Some studying methods that I have heard of are:\n-  Spaced repetition: This involves separating your study sessions into spaced intervals, such as reviewing the material every few days until you memorize it.\n-  Active recall: This involves testing yourself on the material without looking at the answers, such as using flashcards or practice questions.\n-  Feynman technique: This involves explaining the material in your own words as if you were teaching it to someone else, such as a friend or a child.\n-  SQ3R: This stands for survey, question, read, recite, and review. It is a reading comprehension technique that helps you identify important facts and retain information from your textbook.\n\nWhat do you think of these methods? Do you use any of them? Do you have any other methods that work well for you? Please share your thoughts and experiences in the comments below. I look forward to hearing from you!",
//   "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
//   "Cursus metus aliquam eleifend mi. In metus vulputate eu scelerisque felis imperdiet. Amet consectetur adipiscing elit ut aliquam purus. Curabitur vitae nunc sed velit dignissim sodales ut. Quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Orci sagittis eu volutpat odio facilisis. Egestas integer eget aliquet nibh. Sit amet commodo nulla facilisi nullam vehicula ipsum a. Est ultricies integer quis auctor elit sed vulputate mi sit. Feugiat pretium nibh ipsum consequat nisl vel. Mus mauris vitae ultricies leo integer malesuada nunc vel. Dolor sed viverra ipsum nunc. Lacus vestibulum sed arcu non odio euismod lacinia. Iaculis nunc sed augue lacus. Lacinia quis vel eros donec ac odio tempor. Scelerisque varius morbi enim nunc faucibus a."
// ]; //hard coded

List<String> contentData = [];

List<String> captionData = [
  "How do you study effectively for exams?",
  "Caption 2",
  "Caption 3"
]; //hard coded

String text = '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

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

  Widget interactButtons(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      const LikeButton(
        size: 27,
        likeCount: 635,
        //onTap: onLikeButtonTapped, #send to the server
      ),
      _commentButton(context),
    ]);
  }

  Widget deleteButtion(BuildContext context, int index) {
    return IconButton(
        onPressed: () {
          setState(() {
            captionData.removeAt(index);
            contentData.removeAt(index);
          });
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
                            setState(() {
                              contentData[index] = text; //update the value
                            });
                            Navigator.pop(context);
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
            interactButtons(context),
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
        future: data,
        builder: (context, snapshot) {
          List<Map<String, dynamic>>? posts;
          if (snapshot.hasData) {
            posts = snapshot.data;
          } else {
            // ignore: avoid_print
            print("Cannot query data");
            posts = [];
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
