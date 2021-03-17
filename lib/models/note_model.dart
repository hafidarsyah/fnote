class NoteModel {
  String id;
  String title;
  String description;
  String date;

  noteMap() {
    Map mapping = Map<String, dynamic>();

    mapping['id'] = id;
    mapping['title'] = title;
    mapping['description'] = description;
    mapping['date'] = date;

    return mapping;
  }
}
