import 'package:covid19_tracker/Models/covid_model.dart';




class Country{
  final Response covid;

  Country(this.covid);

  String get country{
    return this.covid.country;
  }

  String get newCases{
    return this.covid.cases.casesNew;
  }

  String get activeCases{
    return this.covid.cases.active.toString();
  }

  String get criticalCases{
    return this.covid.cases.critical.toString();
  }

  String get recoveredCases{
    return this.covid.cases.recovered.toString();
  }

  String get totalCases{
    return this.covid.cases.total.toString();
  }

  String get totalDeaths{
    return this.covid.deaths.total.toString();
  }

  String get newDeaths{
    return this.covid.deaths.deathsNew;
  }

  DateTime get day{
    return this.covid.day;
  }

}