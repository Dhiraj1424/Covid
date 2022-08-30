import 'dart:convert';

import 'package:covid_app/services/utils/app_url.dart';
import 'package:http/http.dart' as http;

import '../model/service_model.dart';

class StateService{

  Future<ServiceModel>fetchWordStatus()async{
final response=await http.get(Uri.parse(AppUrl.worldStateApi));

if (response.statusCode==200){
  var json=jsonDecode(response.body);
  return ServiceModel.fromJson(json);
}
else {
  throw 'error';
}

  }

 Future<List<dynamic>>fetchCountrieesList()async{
  var data;
final response=await http.get(Uri.parse(AppUrl.countriesList));

if (response.statusCode==200){
  var data=jsonDecode(response.body);
  return data;
}
else {
  throw 'error';
}

  }

}