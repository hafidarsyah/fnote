import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/screens/home.dart';
import 'package:noteapp/utils/constants.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Home()));
            }),
        title: Text(
          "Add",
          style: whiteTextStyle,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: blueColor,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: blackColor),
                hintText: 'Write note title',
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueColor)),
              ),
              autofocus: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              cursorColor: blueColor,
              maxLines: 8,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: blackColor),
                hintText: 'Write note title',
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueColor)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Save",
                style: whiteTextStyle,
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(blueColor),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 28, vertical: 14))),
            ),
          )
        ],
      ),
    );
  }
}
