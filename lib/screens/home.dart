import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/screens/add.dart';
import 'package:noteapp/utils/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text(
          "Fnote",
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
      body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(100, (index) {
            return Center(
              child: InkWell(
                onTap: () {},
                child: Container(
                  width: 180,
                  height: 180,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: lightBlueColor),
                  child: Text("text"),
                ),
              ),
            );
          })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Add()));
        },
        child: Icon(Icons.add),
        backgroundColor: blueColor,
      ),
    );
  }
}
