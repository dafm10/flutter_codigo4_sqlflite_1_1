
import 'package:flutter/material.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {

  String nameFuture = "";

  @override
  initState() {
    super.initState();

    getNameFuture().then((value) {
      nameFuture = value;
    });

    getAgePerson().then((value) {
      print(value);
    });

    getData();
  }

  Future<void> getData() async {
    String namex = await getNameFuture();
    print(namex);
  }

  String getName() {
    return "David";
  }

  Future<String> getNameFuture() async {
    return Future.delayed(const Duration(seconds: 2), () {
      return "David Fernández";
    });
  }

  Future<List<String>> getListNames() async {
    return Future.delayed(Duration(seconds: 2), () {
        return [
          "Juan",
          "Luis",
          "Lilian",
          "Francisco",
        ];
      });
  }

  Future<int> getAgePerson() async {
    return 33;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*body: Center(
        *//*child: Text(
            nameFuture
        ),*//*
        child: FutureBuilder(
          future: getNameFuture(),
          builder: (BuildContext context, AsyncSnapshot snap) {
            print(snap.connectionState);
            print(snap
                .hasData); // ayuda a saber si el dato que esta a la espera, ya está listo
            print(snap.data);

            if (snap.hasData) {
              return Text(snap.data);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),*/
      body: SafeArea(
        child: FutureBuilder(
          future: getListNames(),
          builder: (BuildContext context, AsyncSnapshot snap){
            if (snap.hasData) {
              List<String> myList = snap.data;
              return ListView.builder(
                itemCount: myList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(myList[index]);
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
