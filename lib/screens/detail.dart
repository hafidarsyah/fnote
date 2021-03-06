import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/screens/home.dart';
import 'package:noteapp/services/note_service.dart';
import 'package:noteapp/utils/constants.dart';

class Detail extends StatefulWidget {
  final String id;

  Detail({this.id});

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _descriptionTextEditingController =
      TextEditingController();
  DateTime _dateTime = DateTime.now();

  NoteService _noteService = NoteService();
  NoteModel _noteModel = NoteModel();

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    getNote();
  }

  getNote() async {
    dynamic note = await _noteService.readNoteById(this.widget.id);

    _titleTextEditingController.text = note[0]['title'];
    _descriptionTextEditingController.text = note[0]['description'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueColor,
        title: Text("Detail"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () async {
            if (_formKey.currentState.validate()) {
              _noteModel.id = this.widget.id;
              _noteModel.title = _titleTextEditingController.text;
              _noteModel.description = _descriptionTextEditingController.text;
              _noteModel.date =
                  DateFormat('yyyy-MM-dd').format(_dateTime).toString();

              dynamic result = await _noteService.updateNote(_noteModel);

              if (result > 0) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home()));
              }
            }
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.delete,
            ),
            onPressed: () async {
              dynamic result = await _noteService.deleteNote(this.widget.id);

              if (result > 0) {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => Home()));
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: _titleTextEditingController,
                    cursorColor: blueColor,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Required';
                      }
                      return null;
                    },
                    autofocus: true,
                    decoration: InputDecoration(
                      labelText: 'Title',
                      labelStyle: TextStyle(color: blackColor),
                      hintText: 'Write note title',
                      hintStyle: greyTextStyle,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: blueColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueColor)),
                    )),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                    controller: _descriptionTextEditingController,
                    cursorColor: blueColor,
                    maxLines: 8,
                    decoration: InputDecoration(
                      labelText: 'Description',
                      labelStyle: TextStyle(color: blackColor),
                      hintText: 'Write note description',
                      hintStyle: greyTextStyle,
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: blueColor)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: blueColor)),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
