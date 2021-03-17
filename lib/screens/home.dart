import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noteapp/models/note_model.dart';
import 'package:noteapp/screens/add.dart';
import 'package:noteapp/screens/detail.dart';
import 'package:noteapp/services/note_service.dart';
import 'package:noteapp/utils/constants.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NoteService _noteService = NoteService();
  List<NoteModel> _noteList = <NoteModel>[];

  @override
  void initState() {
    super.initState();
    getAllNotes();
  }

  getAllNotes() async {
    dynamic notes = await _noteService.readNotes();

    notes.forEach((note) {
      setState(() {
        NoteModel noteModel = NoteModel();

        noteModel.id = note['id'].toString();
        noteModel.title = note['title'];
        noteModel.description = note['description'];
        noteModel.date = note['date'];

        _noteList.add(noteModel);
      });
    });
  }

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: _noteList.length,
          itemBuilder: (context, index) {
            return Material(
              borderRadius: BorderRadius.circular(10),
              color: lightBlueColor,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => Detail(id: _noteList[index].id)));
                },
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _noteList[index].title,
                            style: blueTextStyle.copyWith(fontSize: 16),
                          ),
                          Text(
                            _noteList[index].description,
                            style: blackTextStyle.copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                      Text(
                        _noteList[index].date,
                        style: blackTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
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
