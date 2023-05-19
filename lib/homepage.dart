/// Main coder: Quan

import 'package:flutter/material.dart';
import 'NaviBar.dart';
import 'package:go_router/go_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Query data //
var db = FirebaseFirestore.instance; 
final cateData = db.collection('category').get().then(
  (querySnapshot) {
    return [for (var docSnapshot in querySnapshot.docs) docSnapshot.data()];
  }
);

// Home page screen //
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: cateData,
      builder: (context, snapshot) {
        List<Map<String, dynamic>>? categories;
        if (snapshot.hasData) {
          categories = snapshot.data;
        } else {
          // ignore: avoid_print
          print("Cannot query data");
          categories = [];
        }
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
                  children: <Widget>[
                    for (var cate in categories!)
                      CategoryCard(
                        topic: cate['Name'].toString(),
                        imgPath: cate['ImgPath'].toString(),
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
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
                height: 10,
              ),
              Text(widget.topic,
                  style: Theme.of(context).textTheme.displayMedium),
            ],
          ),
        ));
  }
}
