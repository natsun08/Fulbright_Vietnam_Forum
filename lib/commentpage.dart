/// Main coder: Khue
import 'package:flutter/material.dart';
// import 'package:Fulbright_Vietnam_Forum/NaviBar.dart';
import 'package:like_button/like_button.dart';
import 'theme.dart';

/// Change to Theme.of(context).colorScheme.primary
const fulbrightBlue = Color(0xFF00196E);

/// Change to Theme.of(context).colorScheme.secondary
const fulbrightGlod = Color(0xFFFFAD1D);

/// Change to Theme.of(context).textTheme.titleLarge
const titleLarge = TextStyle(
    fontSize: 48.0,
    fontFamily: 'Garamond Premier Pro',
    color: Color(0xFF00196E));

/// Change to Theme.of(context).textTheme.displaySmall
const displaySmall = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    fontFamily: 'Halyard Display',
    color: Color(0xFF212121));

/// Change to Theme.of(context).textTheme.displayMedium
const displayMedium = TextStyle(
    fontSize: 24.0, fontFamily: 'Halyard Display', color: Color(0xFF212121));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage());
  }
}

List<String> contentData = [
  "Hi everyone,\n\nI'm curious to know what are some of the best studying methods that you use to prepare for exams. Studying methods are ways to help you remember important concepts and information. Some studying methods that I have heard of are:\n-  Spaced repetition: This involves separating your study sessions into spaced intervals, such as reviewing the material every few days until you memorize it.\n-  Active recall: This involves testing yourself on the material without looking at the answers, such as using flashcards or practice questions.\n-  Feynman technique: This involves explaining the material in your own words as if you were teaching it to someone else, such as a friend or a child.\n-  SQ3R: This stands for survey, question, read, recite, and review. It is a reading comprehension technique that helps you identify important facts and retain information from your textbook.\n\nWhat do you think of these methods? Do you use any of them? Do you have any other methods that work well for you? Please share your thoughts and experiences in the comments below. I look forward to hearing from you!",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Cursus metus aliquam eleifend mi. In metus vulputate eu scelerisque felis imperdiet. Amet consectetur adipiscing elit ut aliquam purus. Curabitur vitae nunc sed velit dignissim sodales ut. Quam adipiscing vitae proin sagittis nisl rhoncus mattis rhoncus. Orci sagittis eu volutpat odio facilisis. Egestas integer eget aliquet nibh. Sit amet commodo nulla facilisi nullam vehicula ipsum a. Est ultricies integer quis auctor elit sed vulputate mi sit. Feugiat pretium nibh ipsum consequat nisl vel. Mus mauris vitae ultricies leo integer malesuada nunc vel. Dolor sed viverra ipsum nunc. Lacus vestibulum sed arcu non odio euismod lacinia. Iaculis nunc sed augue lacus. Lacinia quis vel eros donec ac odio tempor. Scelerisque varius morbi enim nunc faucibus a."
]; //hard coded

List<String> captionData = [
  "How do you study effectively for exams?",
  "Caption 2",
  "Caption 3"
]; //hard coded

List<String> commentData = ["Comment 1", "Comment 2", "Comment 3"];

List<String> commentCaptionData = [
  "Caption comment 1",
  "Caption comment 2",
  "Caption comment 3",
];

int index = 1; //hardcode the post content

String text = '';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
            builder: (context) => Scaffold(
                    // appBar: const Bar(),
                    body: Center(
                  child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IntrinsicHeight(
                              child: Row(children: [
                                // Add contents
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 300,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            width: 1, color: fulbrightBlue)),
                                    child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Column(children: [
                                          InputField(
                                              label: "Title", numLines: 1),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0)),
                                          InputField(
                                              label: "Content", numLines: 20)
                                        ]))),
                                const Spacer(),

                                // Attach and publish buttons
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Publish Button //
                                      OutlinedButton(
                                        style: TextButton.styleFrom(
                                            fixedSize: const Size(180, 44),
                                            foregroundColor: fulbrightBlue,
                                            backgroundColor: fulbrightGold,
                                            side: const BorderSide(
                                                color: fulbrightBlue),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.zero))),
                                        onPressed: () {
                                          debugPrint('Received click 3');
                                        },
                                        child: const Text('Publish Comment',
                                            style: displaySmall),
                                      )
                                    ])
                              ]),
                            )
                          ])),
                )))
      ],
    );
  }
}

// Input Field //
class InputField extends StatefulWidget {
  const InputField({super.key, required this.label, required this.numLines});
  final String label;
  final int numLines;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  String _inputText = "";
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextFormField(
        maxLength: widget.numLines * 100,
        maxLines: widget.numLines,
        textAlignVertical: TextAlignVertical.top,
        onChanged: (value) {
          setState(() {
            _inputText = value;
          });
        },
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: fulbrightBlue, width: 1.0)),
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.zero,
              borderSide: BorderSide(color: fulbrightBlue, width: 1.0)),
          labelText: widget.label,
          alignLabelWithHint: true,
          counterText:
              '${_inputText.length.toString()}/${widget.numLines * 100}',
        ),
      )
    ]);
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: Bar(),
      body: _postsListView(context),
    );
  }

  //Author username
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

  //Post caption
  Widget _postCaption(int index) {
    String caption = captionData[index];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(caption, style: const TextStyle(fontSize: 16)),
    );
  }

  //Post content
  Widget _postContent(int index) {
    String subText = contentData[index];
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        //text should be imported from database and not hardcode
        child: Text("$subText.", style: const TextStyle(fontSize: 12)));
  }

  //post image
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

  //comment icon
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

  //like button and comment button
  Widget interactButtons(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      // _likeCount(context),
      // _favoriteButton(context),
      // FavoriteButton(
      //   valueChanged: (_) {},
      // ),
      const LikeButton(
        size: 27,
        likeCount: 635,
        //onTap: onLikeButtonTapped, #send to the server
      ),
      _commentButton(context),
    ]);
  }

  //delete button
  Widget deleteButton(BuildContext context, int index) {
    return IconButton(
        onPressed: () {
          setState(() {
            captionData[index] = "This content has been removed";
            contentData[index] = "This content has been removed";
          });
        },
        icon: const Icon(Icons.delete));
  }

  //editbutton
  Widget editButton(BuildContext context, int index) {
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

  //show the post in full
  Widget _postView(BuildContext context, int index) {
    return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _postAuthorRow(context),
            _postImage(),
            _postCaption(index),
            _postContent(index),
            interactButtons(context),
          ],
        ),
        trailing: Container(
            width: 80,
            child: Row(
              children: [
                deleteButton(context, index),
                editButton(context, index),
              ],
            )));
  }

  Widget _commentAuthorRow(BuildContext context) {
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

  //Post caption
  Widget _commentCaption(int index) {
    String caption = commentCaptionData[index];
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Text(caption, style: const TextStyle(fontSize: 16)),
    );
  }

  //Post content
  Widget _commentContent(int index) {
    String subText = commentData[index];
    return Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 4,
        ),
        //text should be imported from database and not hardcode
        child: Text("$subText.", style: const TextStyle(fontSize: 12)));
  }

  Widget deleteCommentButton(BuildContext context, int index) {
    return IconButton(
        onPressed: () {
          setState(() {
            commentCaptionData.removeAt(index);
            commentData.removeAt(index);
          });
        },
        icon: const Icon(Icons.delete));
  }

  //editbutton
  Widget editCommentButton(BuildContext context, int index) {
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
                              commentData[index] = text; //update the value
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('edit'))
                    ],
                  ));
        },
        icon: const Icon(Icons.edit));
  }

  //show a comment corespond to the post
  Widget _commentView(BuildContext context, int index) {
    return ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _commentAuthorRow(context),
            _commentCaption(index),
            _commentContent(index),
            const Row(children: [
              LikeButton(
                size: 27,
                likeCount: 635,
                //onTap: onLikeButtonTapped, #send to the server
              ),
            ])
          ],
        ),
        trailing: Container(
            width: 80,
            child: Row(
              children: [
                deleteCommentButton(context, index),
                editCommentButton(context, index),
              ],
            )));
  }

  //show the everything
  Widget _postsListView(BuildContext context) {
    return ListView(children: [
      Container(
        margin: const EdgeInsets.all(5.5),
        padding: const EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
        ),
        //text imported from database
        child: _postView(context, index), //show the post
      ),
      const SizedBox(
          height: 750, child: NewPostPage()), //show the box for commenting
      Expanded(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: commentData.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.all(5.5),
                  padding: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  child: _commentView(context, index));
            }),
      )
    ]);
  }
}
