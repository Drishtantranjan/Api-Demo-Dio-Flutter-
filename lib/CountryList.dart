import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CountryList extends StatefulWidget {
  CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  List<dynamic> Countries = [];

  @override
  void initState() {
    super.initState();
    getCountry(); // Fetch country data when the widget is initialized
  }

  Future<void> getCountry() async {
    try {
      var response = await Dio().get('https://restcountries.com/v3.1/all');
      setState(() {
        Countries = response.data;
      });
    } catch (error) {
      print("Error fetching data: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Country List')),
      body: ListView.builder(
          itemCount: Countries.length,
          itemBuilder: (BuildContext context, int index) {
            final countryData = Countries[index];

            // Extract the country name from the data
            final countryName = countryData['name']['common'];

            return ListTile(
              title: Text(countryName), // Display the country name
              leading: const Icon(Icons.list),
            );
          }),
    );
  }
}
