import 'package:covid19_tracker/Models/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';

class CountryDetails extends StatelessWidget {
  final Country country;

  const CountryDetails({Key key, this.country}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = country.country;

    DateTime date = country.day;
    String day = DateFormat('dd MMMM, yyyy').format(date);

    String totalCases = country.totalCases == null ? '0' : country.totalCases;
    String newCases = country.newCases == null ? '0' : country.newCases;
    String recoveredCases =
        country.recoveredCases == null ? '0' : country.recoveredCases;
    String criticalCases =
        country.criticalCases == null ? '0' : country.criticalCases;
    String totalDeaths =
        country.totalDeaths == null ? '0' : country.totalDeaths;
    String newDeaths = country.newDeaths == null ? '0' : country.newDeaths;
    String activeCases =
        country.activeCases == null ? '0' : country.activeCases;

    String totalConfirmedCases = 'Total Confirmed Cases';
    String recoveredCasesTitle = 'Total Recovered Cases';
    String activeCasesTitle = 'Active Cases';
    String criticalCasesTitle = 'Critical Cases';
    String deathsTitle = 'Total Deaths';

    return Scaffold(
      appBar: AppBar(
          title: Text(
            '$name',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color(0XFF8B1535)),
      backgroundColor: Color(0XFFECF1F2),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  'Covid stats as of $day',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              //Text('$day'),
              _myContainer(context, totalConfirmedCases, newCases, totalCases),
              _myContainer(context, recoveredCasesTitle, '', recoveredCases),
              _myContainer(context, activeCasesTitle, '', activeCases),
              _myContainer(context, criticalCasesTitle, '', criticalCases),
              _myContainer(context, deathsTitle, newDeaths, totalDeaths),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Align(
              //        // alignment: Alignment.topLeft,
              //         child: _recoveredCases(context)),
              //     //SizedBox(width: 10),
              //     _activeCases(context)
              //   ],
              // ),

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: <Widget>[
              //     Align(
              //         //alignment: Alignment.topLeft,
              //         child: _criticalCases(context)),
              //    // SizedBox(width: 10),
              //     _deathCases(context),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _myContainer(
      BuildContext context, String title, String newCases, String totalCases) {
    if (newCases == '') {
      newCases = '0';
    }

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color(0XFF3A3F48),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text('$title',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    )),
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.center,
                child: Text('New: $newCases',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('Total: $totalCases',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Widget _recoveredCases(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Container(
        width: 160,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
            )
          ],
          color: Color(0XFF3A3F48),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total recovered Cases',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('$recoveredCases',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent[700],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _criticalCases(BuildContext context) {
    

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      child: Container(
        width: 160,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
            )
          ],
          color: Color(0XFF3A3F48),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Critical Cases',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('$criticalCases',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _deathCases(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 160,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
            )
          ],
          color: Color(0XFF3A3F48),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Total deaths',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('$totalDeaths',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    )),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(0.0),
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: Text('New: $newDeaths',
            //         style: TextStyle(
            //           fontSize: 25,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.red[700],
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  Widget _activeCases(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 160,
        height: 150,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
            )
          ],
          color: Color(0XFF3A3F48),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Active Cases',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text('$activeCases',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange[400],
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }*/
}
