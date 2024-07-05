import 'package:flutter/cupertino.dart';

import 'note_model.dart';

class CounterProvider extends ChangeNotifier{

  List<Note> _notes=[];
  List<Note> get notes => _notes;

  bool  _isNoteAddAvailable =false;
  bool get isNoteAddAvailable => _isNoteAddAvailable;
  void addNote({
    required String title,
    required String content,
  }){
    if(_notes.length<5){
      _notes.add(Note(
        title: title,
        content: content,
      ));
      notifyListeners();
    }else{
      _isNoteAddAvailable = true;
      notifyListeners();
    }
  }


  void deleteNote({required Note note,}){
    _notes.remove(note);
    notifyListeners();
  }

  // int _counter = 0;
  // int get counter => _counter;
  //
  // void increment(){
  //   _counter++;
  //   notifyListeners();
  // }
  //
  // void decrement(){
  //   _counter--;
  //   notifyListeners();
  // }
  //
  // void reset(){
  //   _counter = 0;
  //   notifyListeners();
  // }

}