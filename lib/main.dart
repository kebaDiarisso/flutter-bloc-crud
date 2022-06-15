import 'package:flutter/material.dart';
import '/bloc/theme/themek_bloc.dart';
import 'bloc/album/albums_bloc.dart';
import '/repositories/Albumsrepository.dart';
import '/screens/albams.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
      BlockExample()
    );
}

class BlockExample extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BlockExampleState();
  }

}

class BlockExampleState extends State<BlockExample>{
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>ThemekBloc(),
      child: BlocBuilder<ThemekBloc,ThemekState>(
        builder: (BuildContext context,ThemekState themestate){
          //print("Called 2334");
          return   MaterialApp(
            theme: themestate.themeData,
            home: AlbumClass(),
          );
        },
      ),);
  }

}


