import 'package:coffe_searcher_app/bloc/events_bloc.dart';
import 'package:coffe_searcher_app/model/event_model.dart';
import 'package:coffe_searcher_app/style/style.dart';
import 'package:flutter/material.dart';

class EventsListScreen extends StatefulWidget {
  @override
  _EventsListScreenState createState() => _EventsListScreenState();
}

class _EventsListScreenState extends State<EventsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.mainColor,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Text(
          "Events",
          style: TextStyle(
              fontFamily: "HelveticaNeueBold.ttf",
              color: Style.standardTextColor,
              fontSize: 34,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Style.titleColor,
        label: Text(
          "add event",
          style: TextStyle(
            color: Style.mainColor,
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Style.mainColor,
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _buildEventsList()),
        ],
      ),
    );
  }

  Widget _buildEventsList() {
    List<EventModel> events = [EventModel(), EventModel(), EventModel()];
    return ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, index) {
          return _buildEventItem(events[index]);
        });
  }

  Widget _buildEventItem(EventModel eventModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        height: 110,
        decoration: kListItemBoxDecorationStyle,
        child: Row(
          children: [
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "12:30",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Style.standardTextColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    "08:11:2020",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Style.titleColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 9,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bob's Happy Birthday",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Style.standardTextColor,
                        ),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "pole1",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Style.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: GestureDetector(
                      onTap: (){
                        getEventsState.pickItem(1);
                      },
                      child: Container(
                        color: Style.titleColor,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Go",
                            style:
                                TextStyle(color: Style.mainColor, fontSize: 17),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
