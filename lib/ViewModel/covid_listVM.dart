
import 'package:covid19_tracker/Models/country.dart';
import 'package:covid19_tracker/Services/covid_client.dart';
import 'package:flutter/material.dart';

class CovidListVM with ChangeNotifier{

  List<Country> listCovidInfo;

  Future<void> fetchData() async{
    final covidData = await CovidClient().fetchCovidInfo();
    this.listCovidInfo = covidData.map((covid) => Country(covid)).toList();
    notifyListeners();
  }  
}


