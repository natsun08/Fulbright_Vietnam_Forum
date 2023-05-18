/// Main coder: Quan

import 'package:flutter/material.dart';
import 'NaviBar.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_database/firebase_database.dart';


// const categories = [{'name': 'Academic', 'img': '../assets/images/homepage/academic.png'},
//                       {'name': 'Career', 'img': '../assets/images/homepage/career.png'},
//                       {'name': 'Student Life', 'img': '../assets/images/homepage/studentlife.png'},
//                       {'name': 'Wellness', 'img': '../assets/images/homepage/wellness.png'}];

// Home page screen //
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Map<String, String>>> queryData() async {
    final ref = await FirebaseDatabase.instance.ref().child('category').get();
    final categories = ref.value;
    return [categories];
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> categories = queryData() as List<Map<String, String>>;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: const Bar(),
        body: Center(
            child: CustomScrollView(
          primary: false,
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(100, 20, 100, 60),
              sliver: SliverGrid.count(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                childAspectRatio: 1.7,
                children: const <Widget>[
                  CategoryCard(
                      topic: "Academic",
                      imgPath: "../assets/images/homepage/academic.png"),
                  CategoryCard(
                      topic: "Career",
                      imgPath: "../assets/images/homepage/career.png"),
                  CategoryCard(
                      topic: "Student Life",
                      imgPath: "../assets/images/homepage/studentlife.png"),
                  CategoryCard(
                      topic: "Wellness",
                      imgPath: "../assets/images/homepage/wellness.png"),
                ],
              ),
            ),
          ],
        )),
      );
    });
  }
}

class CategoryCard extends StatefulWidget {
  const CategoryCard({super.key, required this.topic, required this.imgPath});
  final String topic;
  final String imgPath;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {GoRouter.of(context).go("/" + widget.topic)},
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
                height: 10,
              ),
              Text(widget.topic,
                  style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
        ));
  }
}
