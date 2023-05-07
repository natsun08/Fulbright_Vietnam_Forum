/// Main coder: Quan
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'theme.dart';
import "NaviBar.dart";

// Query data //
const topics = [{'name': 'Baking', 'img': '../assets/images/topicpage/baking.png'},
              {'name': 'Cooking', 'img': '../assets/images/topicpage/cooking.png'},
              {'name': 'Clubs', 'img': '../assets/images/topicpage/clubs.png'},
              {'name': 'Entertainment', 'img': '../assets/images/topicpage/entertainment.png'},
              {'name': 'Financial Management', 'img': '../assets/images/topicpage/financialmanagement.png'},
              {'name': 'Inclusivity', 'img': '../assets/images/topicpage/inclusivity.png'},
              {'name': 'Night Life', 'img': '../assets/images/topicpage/nightlife.png'},
              {'name': 'Residential Life', 'img': '../assets/images/topicpage/residentiallife.png'},
              {'name': 'Sports', 'img': '../assets/images/topicpage/sports.png'},
              {'name': 'Others', 'img': '../assets/images/topicpage/others.png'}];


// Topic page //
class MyTopicPage extends StatefulWidget {
  const MyTopicPage({super.key});

  @override
  State<MyTopicPage> createState() => _MyTopicPageState();
}

class _MyTopicPageState extends State<MyTopicPage> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: Bar(),
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
                  for ( var topic in topics) TopicCard(
                    topic: topic['name'].toString(),
                    imgPath: topic['img'].toString(),
                  ),],
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
        onTap: () => {GoRouter.of(context).pushNamed(widget.topic)},
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
