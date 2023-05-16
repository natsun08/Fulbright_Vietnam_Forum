/// Main coder: Quan
/// Create a new post in Fulbright Forum
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import "NaviBar.dart";

void main() => runApp(const MyApp()); // Remove this

// Query data //
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
const topics = [
  {'name': 'Course', 'parent': 'Academic'},
  {'name': 'Event', 'parent': 'Academic'},
  {'name': 'Library', 'parent': 'Academic'},
  {'name': 'Opportunities', 'parent': 'Academic'},
  {'name': 'Baking', 'parent': 'Student Life'},
  {'name': 'Cooking', 'parent': 'Student Life'},
  {'name': 'Clubs', 'parent': 'Student Life'},
  {'name': 'Financial Management', 'parent': 'Student Life'},
  {'name': 'Inclusivity', 'parent': 'Student Life'},
  {'name': 'Night Life', 'parent': 'Student Life'},
  {'name': 'Residential Life', 'parent': 'Student Life'},
  {'name': 'Sports', 'parent': 'Student Life'},
  {'name': 'Others', 'parent': 'Student Life'},
  {'name': 'Internship', 'parent': 'Career'},
  {'name': 'Job Listing', 'parent': 'Career'},
  {'name': 'Work study', 'parent': 'Career'},
  {'name': 'Confession', 'parent': 'Wellness'},
  {'name': 'Event', 'parent': 'Wellness'}
];

// Create new post page //
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NewPostPage());
  }
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
                                  Text("My Draft (3)", style: displaySmall)
                                ]),

                            // Choose topic
                            const Divider(color: fulbrightBlue, thickness: 1),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.0)),
                            const DropdownButtonField(initalValue: "Clubs"),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0)),

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
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children: const [
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
                                        onPressed: () {
                                          debugPrint('Received click 1');
                                        },
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
                                        onPressed: () {
                                          debugPrint('Received click 2');
                                        },
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
                                          debugPrint('Received click 3');
                                        },
                                        child: const Text('Publish Post',
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

// Dropdown Button //
class DropdownButtonField extends StatefulWidget {
  const DropdownButtonField({super.key, required this.initalValue});
  final String initalValue;

  @override
  State<DropdownButtonField> createState() => _DropdownButtonFieldState();
}

class _DropdownButtonFieldState extends State<DropdownButtonField> {
  var dropdownValue = "Course";

  @override
  initState() {
    super.initState();
    dropdownValue = widget.initalValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            border: Border.all(width: 1, color: fulbrightBlue)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.expand_more),
                underline: Container(color: Colors.transparent),
                onChanged: (newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: topics.map((Map<String, String> topic) {
                  return DropdownMenuItem<String>(
                    value: topic['name'],
                    child: Text("${topic['parent']}/${topic['name']}"),
                  );
                }).toList())));
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