/// Main coder: Quan
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import "NaviBar.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

// Query data //
var db = FirebaseFirestore.instance;
final topicData = db.collection('topic').where("Category", isEqualTo: "Student Life").get().then((querySnapshot) {
  return [for (var docSnapshot in querySnapshot.docs) docSnapshot.data()];
});

// Topic page //
class MyTopicPage extends StatefulWidget {
  const MyTopicPage({super.key});

  @override
  State<MyTopicPage> createState() => _MyTopicPageState();
}

class _MyTopicPageState extends State<MyTopicPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: topicData,
        builder: (context, snapshot) {
          List<Map<String, dynamic>>? topics;
          if (snapshot.hasData) {
            topics = snapshot.data;
          } else {
            // ignore: avoid_print
            print("Cannot query data");
            topics = [];
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
  const TopicCard({super.key, required this.topic, required this.imgPath});
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
        onTap: () => {GoRouter.of(context).go("/${widget.topic}")},
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
