
import 'package:coffe_searcher_app/bloc/events_bloc.dart';
import 'package:coffe_searcher_app/model/event_model.dart';
import 'package:coffe_searcher_app/model/place_model.dart';
import 'package:coffe_searcher_app/style/style.dart';
import 'package:coffe_searcher_app/widgets/add_friends_widget.dart';
import 'package:flutter/material.dart';

class EventItemScreen extends StatefulWidget {
  @override
  _EventItemScreenState createState() => _EventItemScreenState();
}

class _EventItemScreenState extends State<EventItemScreen> {
  List<PlaceModel> places = [
    PlaceModel(),
    PlaceModel(),
    PlaceModel(),
    PlaceModel(),
    PlaceModel(),
    PlaceModel(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          addFriendsWidget(context, EventModel());
        },
        backgroundColor: Style.titleColor,
        label: Text(
          "add friends",
          style: TextStyle(
            color: Style.mainColor,
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Style.mainColor,
        ),
      ),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Style.mainColor,
            ),
            onPressed: () {
              getEventsState.goHome();
            },
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
          ),
          floating: false,
          pinned: true,
          toolbarHeight: 80,
          expandedHeight: 240.0,
          backgroundColor: Style.titleColor,
          elevation: 0,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            //titlePadding: EdgeInsets.all(8),
            title: Text(
              "Bob's Birthday",
              style: TextStyle(
                  fontFamily: "HelveticaNeueBold.ttf",
                  color: Style.mainColor,
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),

          ),
        ),
        SliverList(
          delegate:
              // ignore: missing_return
              SliverChildBuilderDelegate((BuildContext context, int index) {
                if(index == 0){
                 return _buildHeaderPlaceList();
                }else{
                  return _buildPredictPlaceItem(places[index-1]);
                }

          }, childCount: places.length),
        )
      ]),
    );
  }

  Widget _buildHeaderPlaceList() {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Container(
        child: Text(
          "Choice place",
          style: TextStyle(
              fontFamily: "HelveticaNeueBold.ttf",
              color: Style.standardTextColor,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPredictPlaceItem(PlaceModel placeModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
      child: Dismissible(
        key: Key(placeModel.placeId.toString()),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Style.mainColor,
                  Style.titleColor,
                  Style.mainColor
                ],
                tileMode: TileMode.mirror
            )
          ),
          child: Align(
            child: Icon(Icons.check_circle,
              color: Style.mainColor,),
          ),
        ),
        secondaryBackground: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Style.mainColor,
                    Colors.red,
                    Style.mainColor,
                  ],
                  tileMode: TileMode.mirror
              )
          ),
          child: Icon(Icons.cancel,
          color: Style.mainColor,),
        ),
        child: Container(
          height: 110,
          decoration: kListItemBoxDecorationStyle,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  width: 110,
                  height: 110,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25)),
                    child: Image.network(
                      "https://www.archrevue.ru/images/tb/2/6/4/26496/14507023686857_w1500h1500.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
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
                          "Iskander Lacksheri Rest",
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
                      child: Container(
                        color: Style.mainColor,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "",
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
            ],
          ),
        ),
      ),
    );
  }
}
