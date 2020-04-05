
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:covid19_tracker/Models/covid_model.dart';

class CovidClient{
  final apiKey = 'a5iA8cQkhomshtCrWz32wErhlsWgp1oXi4YjsnqOR1SzGmhfzq';
  final apiHost = 'covid-193.p.rapidapi.com';
  final url = 'https://covid-193.p.rapidapi.com/statistics';

  Future<List<Response>> fetchCovidInfo() async{
    final response = await http.get(
        Uri.encodeFull(url),
        headers: {"x-rapidapi-host": apiHost,
                  "x-rapidapi-key": apiKey}
    );

    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      final covidInfo = CovidModel.fromJson(json);
      return covidInfo.response;
    }
    else{
      throw Exception('Failed to fetch information');
    }
  }
}