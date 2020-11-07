
import 'package:coffe_searcher_app/model/event_model.dart';
import 'package:coffe_searcher_app/model/place_model.dart';
import 'package:coffe_searcher_app/style/style.dart';
import 'package:coffe_searcher_app/widgets/add_friends_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class HomeSearchScreen extends StatefulWidget {
  @override
  _HomeSearchScreenState createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Style.mainColor,
        appBar: AppBar(
          toolbarHeight: 80,
          title: Text(
            "Ameaty",
            style: TextStyle(
                fontFamily: "HelveticaNeueBold.ttf",
                color: Style.standardTextColor,
                fontSize: 34,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              child: _buildSearchTextField(),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _buildAddFriends(),
                ],
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  child: _buildResultsList(),
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              controller: _searchController,
              style: TextStyle(
                color: Style.standardTextColor,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Style.titleColor,
                ),
                hintText: 'Search...',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddFriends() {
    return Padding(
      padding: const EdgeInsets.only(left: 15,right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0),
              ),
              color: Style.titleColor,
              onPressed: () {
                addFriendsWidget(context, EventModel());
              },
              child: Text(
                'With Friends',
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1.5,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultsList() {
    List<PlaceModel> places = [PlaceModel(), PlaceModel(), PlaceModel()];
    return ListView.builder(
        itemCount: places.length,
        itemBuilder: (context, index) {
          return _buildPlaceItem(places[index]);
        });
  }

  Widget _buildPlaceItem(PlaceModel placeModel) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
          ],
        ),
      ),
    );
  }
}
