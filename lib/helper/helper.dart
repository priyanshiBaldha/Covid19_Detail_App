import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Model/Model.dart';
class CoronaCaseAPI{

  CoronaCaseAPI._();

  static CoronaCaseAPI coronaCaseAPI = CoronaCaseAPI._();

  Future<List<CoronaCase>?> fetchCoronaCaseData() async{

    http.Response res = await http.get(Uri.parse("https://disease.sh/v3/covid-19/countries"));

    if(res.statusCode==200){

      List decodeCoronaData = jsonDecode(res.body);

      List<CoronaCase> countryCoronaCases = decodeCoronaData.map((e) => CoronaCase.fromMap(Data: e)).toList();

      return countryCoronaCases;

    }

  }

}