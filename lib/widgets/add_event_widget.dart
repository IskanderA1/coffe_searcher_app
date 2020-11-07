
import 'package:coffe_searcher_app/style/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void addEventWidget(BuildContext context) {

  Widget _buildUserAddFriendTextField() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 40.0,
            child: TextField(
              style: TextStyle(
                color: Style.standardTextColor,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 8.0),
                prefixIcon: Icon(
                  Icons.event_note_outlined,
                  color: Style.titleColor,
                ),
                hintText: 'Input event name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildAdFriendsAlertButton() {
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
              },
              child: Text(
                'Add',
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

  Widget _buildTimePicker(){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 40.0,
            child: TextField(
              onTap: (){

              },
              style: TextStyle(
                color: Style.standardTextColor,
                fontFamily: 'OpenSans',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 8.0),
                prefixIcon: Icon(
                  Icons.event_note_outlined,
                  color: Style.titleColor,
                ),
                hintText: 'Input event name',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }


  showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(titlePadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          title: Container(
            decoration: kAlertBoxDecorationStyle,
            //color: Style.titleColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Add Event",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Style.mainColor
                ),
              ),
            ),
          ),
          children: <Widget>[
            _buildUserAddFriendTextField(),
            _buildAdFriendsAlertButton(),
          ],
        );
      });
}
