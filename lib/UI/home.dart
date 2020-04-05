import 'package:covid19_tracker/BLOC/covid_listVM.dart';
import 'package:covid19_tracker/BLOC/country.dart';
import 'package:covid19_tracker/Services/custom_loader.dart';
import 'package:covid19_tracker/UI/country_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Country> covidDataList = List();
  List<Country> filteredCovidDataList = List();
  TextEditingController controller = TextEditingController();
  CustomLoader loader = CustomLoader();
  final _customLoader = CustomLoader();

  @override
  void initState() {
    super.initState();
    Provider.of<CovidListVM>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final covidVM = Provider.of<CovidListVM>(context);
    covidDataList = covidVM.listCovidInfo;

    return Scaffold(
      appBar: AppBar(
        title: Text('Covid 19 Tracker'),
        backgroundColor: Color(0XFF8B1535),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              onChanged: (query) {
                filteredCovidDataList = covidDataList
                    .where((covid) => (covid.country
                            .toLowerCase()
                            .contains(query.toLowerCase()) ||
                        covid.country.contains(query)))
                    .toList();
                String name = filteredCovidDataList[0].country;
                print('$name');
                setState(() {
                  covidDataList = filteredCovidDataList;
                });
              },
              controller: controller,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Enter the country name'),
            ),
          ),
          Expanded(child: _covidInfoList(covidVM))
        ],
      ),
    );
  }

  Widget _covidInfoList(CovidListVM covidVM) {
    if (covidDataList == null) {
      return Align(
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0XFF8B1535))));
      //return Align(child: CustomLoader(loadingText: 'Fetching covid data...'));
    } else if (covidDataList.isEmpty) {
      return Align(child: Text("Cannot fetch movies."));
    } else {
      return filteredCovidDataList.length != 0 || controller.text.isNotEmpty
          ? _covidSearchedCountryList(context)
          : _covidCountryList(context);
    }
  }

  Widget _covidCountryList(BuildContext context) {
    //Navigator.pop(context);
    
    return SafeArea(
      child: ListView.builder(
          itemCount: covidDataList.length,
          itemBuilder: (BuildContext context, int index) {
            final country = covidDataList[index];

            String countryName = covidDataList[index].country;
            String totalCases = covidDataList[index].totalCases;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ListTile(
                  title: Text(countryName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  subtitle: Text(
                    'Total Cases: $totalCases',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CountryDetails(country: country)));
                  },
                ),
                Divider(),
              ],
            );
          }),
    );
  }

  Widget _covidSearchedCountryList(BuildContext context) {
    //Navigator.pop(context);
    
    return SafeArea(
      child: ListView.builder(
          itemCount: filteredCovidDataList.length,
          itemBuilder: (BuildContext context, int index) {
            final country = filteredCovidDataList[index];
            String countryName = filteredCovidDataList[index].country;
            String totalCases = filteredCovidDataList[index].totalCases;

            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(countryName,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0)),
                  subtitle: Text(
                    'Total Cases: $totalCases',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CountryDetails(country: country)));
                  },
                ),
                Divider(),
              ],
            );
          }),
    );
  }
}
