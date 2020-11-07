
class EventModel{
  int id;
  String date;
  String description;
  String owner;
  String title;
  List<String> users;

  EventModel();
  EventModel.fromJson(var data):
        id = data["eventId.id"],
        date = data["eventId.date"],
        description = data["eventId.description"],
        owner = data["eventId.owner"],
        title = data["eventId.title"],
        users = (data["users"] as List).map((i) => i as String).toList();
}