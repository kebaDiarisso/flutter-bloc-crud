import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testblocapp/model/album_model.dart';

import '../api/service_api.dart';


/**************************deleted */

/********************************* */

class Albumsrepository{

  Future<List<Albums>>getAlbumsList(){

    return AlbumService().getAlbums();
  }
}

//void main() => runApp(MyApp());

class MyAppApiTest extends StatefulWidget {
  const MyAppApiTest({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyAppApiTest> {
  late Future<List<Albums>> _futureData;
  final Albumsrepository _albumsrepository = Albumsrepository();

  @override
  void initState() {
    super.initState();
    _futureData = _albumsrepository.getAlbumsList();
  }

  @override
  Widget build(BuildContext context) {
    
    return  Center(
          child: FutureBuilder<List<Albums>>(
            future: _futureData,
            builder: (context, snapshot) {
              //    print(snapshot.data);
              if (snapshot.hasData) {
                List<Albums>? data = snapshot.data;
               
                return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (BuildContext context, int index) {
                    
                      return Container(
                        height: 75,
                        color: Colors.white,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                  elevation: 8,
                                  shadowColor: Colors.green,
                                  //   margin: EdgeInsets.all(),
                                  clipBehavior: Clip.antiAlias,
                                  child: Row(
                                    children: [
                                     // Text(data[index].userId.toString()),
                                      SizedBox(width: 5,),
                                      Text(data[index].id.toString()+':'),
                                       SizedBox(width: 5,),
                                      Text(data[index].title),
                                  
                                      // Text('${data[index].title ?? 'Deleted'}'),
                                      
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        );
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   // isExtended: true,
        //   child: const Icon(Icons.add),
        //   backgroundColor: Colors.blue,
        //   onPressed: () {
        //     setState(() {
        //       //  i++;
        //     });
        //   },
        // ),
   
}
}