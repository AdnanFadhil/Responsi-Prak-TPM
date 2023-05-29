import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:responsi/news_nasional.dart';
import 'package:responsi/news_teknologi.dart';
import 'package:responsi/news_terbaru.dart';

class Menu extends StatelessWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 150, 20, 10),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/2/21/CNN_Indonesia.png"),
                        fit: BoxFit.cover)),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsTeknologi()));
              },
              child: Text("Teknologi"),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsTerbaru()));
              },
              child: Text("Terbaru"),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsTerbaru()));
              },
              child: Text("Olahraga"),
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsNasional()));
              },
              child: Text("Nasional"),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}
