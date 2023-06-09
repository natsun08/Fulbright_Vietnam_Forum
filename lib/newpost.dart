/// Main coder: Quan
/// Create a new post in Fulbright Forum
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import "NaviBar.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// Query data //
var db = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final userID = auth.currentUser!.uid;
final topicData =
    db.collection('topic').orderBy("Category").get().then((querySnapshot) {
  return [for (var docSnapshot in querySnapshot.docs) docSnapshot.data()];
});

final addNewPost = db.collection("post").doc();
var newPost = {
  "Category": "",
  "Topic": "",
  "Title": "",
  "Content": "",
  "user": "",
  "like_count": 0
};

Future user_info =
    db.collection('users').doc(userID).get().then((querySnapshot) {
  final data = querySnapshot.data();
  newPost["user"] = data!["username"];
  print(newPost);
});

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

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key, required this.category, required this.topic});
  final String category;
  final String topic;
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
                appBar: const Bar(),
                body: Center(
                  child: Container(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Add Title
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: const [
                                  Text("Create New Post", style: titleLarge),
                                  Spacer(),
                                  Text("Draft", style: displaySmall)
                                ]),

                            // Choose topic
                            const Divider(color: fulbrightBlue, thickness: 1),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0)),
                            DropdownButtonField(
                              initalTop: widget.topic,
                              initialCat: widget.category,
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),

                            IntrinsicHeight(
                              child: Row(children: [
                                // Add contents
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width - 300,
                                    height: MediaQuery.of(context).size.height -
                                        300,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        border: Border.all(
                                            width: 1, color: fulbrightBlue)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children: const [
                                          InputField(
                                              label: "Title", numLines: 1),
                                          Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 12.0)),
                                          InputField(
                                              label: "Content", numLines: 7)
                                        ]))),
                                const Spacer(),

                                // Attach and publish buttons
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("Attachments",
                                          style: displayMedium),
                                      const SizedBox(height: 10),

                                      // Attachments //
                                      OutlinedButton(
                                        style: TextButton.styleFrom(
                                            fixedSize: const Size(180, 90),
                                            foregroundColor: fulbrightBlue,
                                            shadowColor: fulbrightBlue,
                                            side: const BorderSide(
                                                color: fulbrightBlue),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.zero))),
                                        onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Under Construction'),
                                            content: const Text(
                                                'This feature is still under development and will be available soon. We apologize for any inconvenience caused. Thank you for your patience and understanding.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            Icon(Icons.upload_file),
                                            SizedBox(height: 5),
                                            Text("Add files",
                                                style: displaySmall),
                                          ],
                                        ),
                                      ),
                                      const Spacer(),

                                      // Draft Button //
                                      OutlinedButton(
                                        style: TextButton.styleFrom(
                                            fixedSize: const Size(180, 44),
                                            foregroundColor: fulbrightBlue,
                                            shadowColor: fulbrightBlue,
                                            side: const BorderSide(
                                                color: fulbrightBlue),
                                            shape: const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.zero))),
                                        onPressed: () => showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text(
                                                'Under Construction'),
                                            content: const Text(
                                                'This feature is still under development and will be available soon. We apologize for any inconvenience caused. Thank you for your patience and understanding.'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    context, 'OK'),
                                                child: const Text('OK'),
                                              ),
                                            ],
                                          ),
                                        ),
                                        child: const Text('Save as Draft',
                                            style: displaySmall),
                                      ),

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
                                          user_info.whenComplete(() {
                                            addNewPost
                                                .set(newPost)
                                                .then((value) {
                                              showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                            title: const Text(
                                                                'Success'),
                                                            content: const Text(
                                                                'You\'ve submit successfuly.'),
                                                            actions: <Widget>[
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        context,
                                                                        'OK'),
                                                                child:
                                                                    const Text(
                                                                        'OK'),
                                                              ),
                                                            ],
                                                          ));
                                            });
                                          });
                                        },
                                        child: const Text('Publish',
                                            style: displaySmall),
                                      ),
                                    ])
                              ]),
                            )
                          ])),
                )))
      ],
    );
  }
}

// Dropdown Button //
class DropdownButtonField extends StatefulWidget {
  const DropdownButtonField(
      {super.key, required this.initalTop, required this.initialCat});
  final String initalTop;
  final String initialCat;

  @override
  State<DropdownButtonField> createState() => _DropdownButtonFieldState();
}

class _DropdownButtonFieldState extends State<DropdownButtonField> {
  var dropdownTop;
  var dropdowmCat;
  @override
  initState() {
    super.initState();
    dropdownTop = widget.initalTop;
    dropdowmCat = widget.initialCat;
    newPost["Topic"] = dropdownTop;
    newPost["Category"] = dropdowmCat;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: topicData,
        builder: (context, snapshot) {
          List<Map<String, dynamic>>? topics;
          if (snapshot.hasData) {
            topics = snapshot.data;
          } else {
            topics = [];
          }
          return Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(width: 1, color: fulbrightBlue)),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: DropdownButton<String>(
                      value: ("${dropdowmCat}/${dropdownTop}"),
                      icon: const Icon(Icons.expand_more),
                      underline: Container(color: Colors.transparent),
                      onChanged: (newValue) {
                        setState(() {
                          List top_cat = newValue!.split("/");
                          dropdownTop = top_cat[1];
                          dropdowmCat = top_cat[0];
                          newPost["Topic"] = top_cat[1];
                          newPost["Category"] = top_cat[0];
                        });
                      },
                      items: topics!.map((Map<String, dynamic> topic) {
                        return DropdownMenuItem<String>(
                          value: ("${topic['Category']}/${topic['Name']}"),
                          child: Text("${topic['Category']}/${topic['Name']}"),
                        );
                      }).toList())));
        });
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
            newPost[widget.label] = value;
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
