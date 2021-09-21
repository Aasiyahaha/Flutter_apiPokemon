import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ApiScreen(),
  ));
}

class ApiScreen extends StatefulWidget {
  @override
  _ApiScreenState createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List pokemons = [];
  fetchData() async {
    Dio dio = new Dio();
    var pokemondata = await dio.get("https://pokeapi.co/api/v2/pokemon/");
    setState(() {
      pokemons = pokemondata.data['results'];
    });
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    //fetch the pokemon data from api
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: ListView.builder(
      itemCount: pokemons.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListTile(
            //arrow function
            //index is nothing but i we use in for loop to access the contents
            title: Text(pokemons[index]['name']),
            subtitle: Text(pokemons[index]['url']),
            tileColor: Colors.blue),
      ),
    )));
  }
}
