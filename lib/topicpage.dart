/// Main coder: Quan
///
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import "NaviBar.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

// Query data //
Future<dynamic> _getdatafromfb(String category) async {
  var db = FirebaseFirestore.instance;
  final topicData = db
      .collection('topic')
      .where("Category", isEqualTo: category)
      .get()
      .then((querySnapshot) {
    return [for (var docSnapshot in querySnapshot.docs) docSnapshot.data()];
  });
  return topicData;
}

// Topic page //
class MyTopicPage extends StatefulWidget {
  final String category;
  const MyTopicPage({super.key, required this.category});

  @override
  State<MyTopicPage> createState() => _MyTopicPageState();
}

class _MyTopicPageState extends State<MyTopicPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getdatafromfb('${widget.category}'),
        builder: (context, snapshot) {
          List<Map<String, dynamic>>? topics;
          if (snapshot.hasData) {
            topics = snapshot.data;
          } else {
            return Center(child: Text("Loading"));
          }
          if (topics!.isEmpty) {
            return Scaffold(
                appBar: const Bar(),
                body: Center(
                    child:
                        Text("There're currently no topic in this category")));
          }
          return Scaffold(
            appBar: const Bar(),
            body: Center(
                child: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(80, 20, 80, 60),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    crossAxisCount: 4,
                    childAspectRatio: 1.3,
                    children: <Widget>[
                      for (var topic in topics!)
                        TopicCard(
                          category: '${widget.category}',
                          topic: topic['Name'].toString(),
                          imgPath: topic['ImgPath'].toString(),
                        ),
                    ],
                  ),
                ),
              ],
            )),
          );
        });
  }
}

// Topic Card //
class TopicCard extends StatefulWidget {
  const TopicCard(
      {super.key,
      required this.category,
      required this.topic,
      required this.imgPath});
  final String category;
  final String topic;
  final String imgPath;

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () =>
            {GoRouter.of(context).go("/${widget.category}/${widget.topic}")},
        onHover: (hovering) {
          setState(() => isHover = hovering);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: (isHover)
                ? Theme.of(context).colorScheme.onBackground
                : Theme.of(context).colorScheme.background,
            border: Border.all(
                color: Theme.of(context).colorScheme.outline, width: 1.0),
          ),
          child: Column(
            children: [
              Image.asset(widget.imgPath),
              const SizedBox(
                height: 5,
              ),
              Text(widget.topic,
                  style: Theme.of(context).textTheme.displaySmall),
            ],
          ),
        ));
  }
}
