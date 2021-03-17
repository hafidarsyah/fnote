import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/screens/home.dart';
import 'package:noteapp/services/note_service.dart';
import 'package:noteapp/utils/constants.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  DateTime _dateTime = DateTime.now();

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
              controller: _titleTextEditingController,
              cursorColor: blueColor,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: blueColor),
                hintText: 'Write note title',
                hintStyle: TextStyle(color: greyColor),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blackColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blackColor)),
              ),
              autofocus: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
                controller: _descriptionTextEditingController,
                cursorColor: blueColor,
                maxLines: 8,
                decoration: InputDecoration(
                    labelText: 'Description',
                    labelStyle: TextStyle(color: blueColor),
                    hintStyle: TextStyle(color: greyColor),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blackColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: blackColor)))),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () async {
                NoteModel noteModel = NoteModel();

                noteModel.title = _titleTextEditingController.text;
                noteModel.description = _descriptionTextEditingController.text;
                noteModel.date =
                    DateFormat('yyyy-MM-dd').format(_dateTime).toString();

                NoteService _noteService = NoteService();
                dynamic result = await _noteService.saveNote(noteModel);

                print(DateFormat('yyyy-MM-dd').format(_dateTime).toString());

                if (result > 0) {
                  print('success');
                }
              },
              child: Text(
                "Save",
                style: whiteTextStyle,
              ),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  backgroundColor: MaterialStateProperty.all(blueColor),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(horizontal: 28, vertical: 12))),
            ),
          )
        ],
      ),
    );
  }
}
