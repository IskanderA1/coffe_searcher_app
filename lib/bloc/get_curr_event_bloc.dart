import 'package:coffe_searcher_app/model/event_response.dart';
import 'package:coffe_searcher_app/repo/app_repo.dart';
import 'package:rxdart/rxdart.dart';

class GetCurrentEventBloc{
  final BehaviorSubject<EventResponse> _subject = BehaviorSubject<EventResponse>();
  final AppRepository _repository = AppRepository();

  addEvent(String token,String nameEvent) async {
    EventResponse response = await _repository.addEvent(token, nameEvent);
    _subject.sink.add(response);
  }

  getCurrentEvent(String token, int idEvent) async{
    EventResponse response = await _repository.getCurrentEvent(token, idEvent);
    _subject.sink.add(response);
  }

  BehaviorSubject<EventResponse> get subject => _subject;
  dispose(){
    _subject.close();
  }

}
final getCurrentEventBloc = GetCurrentEventBloc();