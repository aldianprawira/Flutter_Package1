import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var faker = Faker();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    List showWidget = [
      ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index) => ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.grey[300],
            backgroundImage:
                NetworkImage("https://picsum.photos/id/${870 + index}/200/300"),
          ),
          title: Text(faker.person.name()),
          subtitle: Text(DateFormat.yMMMd().add_Hms().format(DateTime.now())),
        ),
      ),
      const Center(
        child: Text("Discovery"),
      ),
      const Center(
        child: Text("Message"),
      ),
      const Center(
        child: Text("People"),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Package Flutter"),
        centerTitle: true,
      ),
      body: showWidget[index],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: const [
          Icons.home,
          Icons.map,
          Icons.message,
          Icons.people,
        ],
        activeIndex: index,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        onTap: (p0) {
          setState(() {
            index = p0;
          });
        },
      ),
    );
  }
}
