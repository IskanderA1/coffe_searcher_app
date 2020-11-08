

class PlaceModel{
  int placeId;
  String name;
  String price;
  String dressCode;
  String smokingArea;
  PlaceModel();


  PlaceModel.fromJson(var data):
        placeId = data['placeID'],
        name = data['name'],
        price = data['price'],
        dressCode = data['dress_code'],
        smokingArea = data['smoking_area'];
}