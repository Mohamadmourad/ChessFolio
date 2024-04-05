import 'package:shared_preferences/shared_preferences.dart';

void saveLocal(List<int> count) async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> stringList = [];
  for(int i = 0;i<count.length;i++){
    stringList.add(count[i].toString());
  }
  prefs.setStringList('counts', stringList);
}

Future<List<int>?> loadFromStorage()async{
   SharedPreferences prefs = await SharedPreferences.getInstance();
   List<String>? list = prefs.getStringList('counts');
   List<int> count = [];
   if(list != null){
     for(int i = 0;i<list.length;i++){
    count.add(int.parse(list[i]));
    }
    return count;
   }
   else{
    return null;
   }
   
}

void removeLocal() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('counts');
}
