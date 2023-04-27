import 'package:flutter/material.dart';
import 'package:project/NaviBar.dart';

bool _favState = false;
int _favCount = 8;

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Bar(),
      body: _postsListView(context),
    );
  }

  Widget _postAuthorRow(BuildContext context) {
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
          const Text(
            'Username',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          )
        ],
      ),
    );
  }

  Widget _postCaption() {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text('How do you study effectively for exams?',
          style: TextStyle(fontSize: 16)),
    );
  }

  Widget _postContent() {
    return const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        child: Text(
            "Hi everyone,\n\nI'm curious to know what are some of the best studying methods that you use to prepare for exams. Studying methods are ways to help you remember important concepts and information. Some studying methods that I have heard of are:\n-  Spaced repetition: This involves separating your study sessions into spaced intervals, such as reviewing the material every few days until you memorize it.\n-  Active recall: This involves testing yourself on the material without looking at the answers, such as using flashcards or practice questions.\n-  Feynman technique: This involves explaining the material in your own words as if you were teaching it to someone else, such as a friend or a child.\n-  SQ3R: This stands for survey, question, read, recite, and review. It is a reading comprehension technique that helps you identify important facts and retain information from your textbook.\n\nWhat do you think of these methods? Do you use any of them? Do you have any other methods that work well for you? Please share your thoughts and experiences in the comments below. I look forward to hearing from you!",
            style: TextStyle(fontSize: 12)));
  }

  Widget _postImage() {
    return Center(
        child: Container(
      width: 400,
      alignment: Alignment.center,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Image.asset(
          'images/topicpage/inclusivity.png',
          fit: BoxFit.cover,
        ),
      ),
    ));
  }

  Widget _likeCount(BuildContext context) {
    int count = 8;
    if (_favState) {
      count = _favCount + 1;
    }
    return Column(
      children: [Text('${count}')],
    );
  }

  Color _favColor = const Color.fromARGB(255, 98, 179, 255);
  // FavState _state = new FavState();

  Widget _favoriteButton(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      IconButton(
        icon: const Icon(
          Icons.favorite,
          size: 24.0,
        ),
        color: _favColor,
        onPressed: () {
          setState(() {
            // _state.switchState();
            _favState = !_favState;
            if (!_favState) {
              _favColor = const Color.fromARGB(255, 98, 179, 255);
            } else {
              _favColor = Colors.red;
            }
          });
        },
      )
    ]);
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
      _likeCount(context),
      _favoriteButton(context),
      _commentButton(context),
    ]);
  }

  Widget _postView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _postAuthorRow(context),
        _postImage(),
        _postCaption(),
        _postContent(),
        interactButtons(context),
      ],
    );
  }

  Widget _postsListView(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
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
            child: _postView(context),
          );
        });
  }
}
