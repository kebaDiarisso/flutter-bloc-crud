import 'package:flutter/material.dart';
import '/bloc/theme/themek_bloc.dart';
import '/themes/app_theme.dart';
import '../bloc/album/albums_bloc.dart';
import '/model/album_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'album.dart';

class AlbumClass extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AlbumClassState();
  }
}

class AlbumClassState extends State<AlbumClass> {
  final AlbumsBloc _newsBloc = AlbumsBloc();

  bool isdark = true;
  @override
  void initState() {
    _newsBloc.add(GetAlbumEvents());

    super.initState();
    // loadAlbums();
  }

  // loadAlbums() async {
  //   context.read<AlbumsBloc>().add(AlbumEvents.fetchAlbums);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Bloc"),
          actions: const [
            // Switch(
            //   value: isdark,
            //   onChanged: (val) async {
            //     _setTheme(val);
            //     isdark = !isdark;
            //   },
            // )
          ],
        ),
        body: BlocProvider(
          create: (_) => _newsBloc,
          child: BlocListener<AlbumsBloc, AlbumsState>(
            listener: (context, state) {
              if (state is AlbumListErrorstate) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Test2(),
                  ),
                );
              }
            },
            child: BlocBuilder<AlbumsBloc, AlbumsState>(
              builder: (context, state) {
                if (state is AlbumLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (state is AlbumListErrorstate) {
                  // final error = state.error;
                  // String message = '${error.message}\nTap to Retry.';
                  return Test2();
                }
                if (state is AlbumLoadedState) {
                  List<Albums> albums = state.albums;
                  // print(albums);
                  return const MyAppApiTest();
                }

                return Container();
              },
            ),
          ),
        )

        // BlocBuilder<AlbumsBloc, AlbumsState>(
        //     builder: (BuildContext contex, AlbumsState state) {
        //   if (state is AlbumLoadingState) {
        //     return const Center(
        //       child: CircularProgressIndicator(),
        //     );
        //   }

        //   if (state is AlbumListErrorstate) {
        //     final error = state.error;
        //     String message = '${error.message}\nTap to Retry.';
        //     return Text(
        //       message,
        //     );
        //   }
        //   if (state is AlbumLoadedState) {
        //     List<Albums> albums = state.albums;
        //     print(albums);
        //     return _list(albums);
        //   }

        //   return Center(
        //     child: Text('hello'),
        //   );
        // }),
        );
  }

  // Widget _list(List<Albums> albums) {
  //   return ListView.builder(
  //     itemCount: albums.length,
  //     itemBuilder: (_, index) {
  //       Albums album = albums[index];
  //       print(album);

  //       return Container(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Container(
  //               child: Text(
  //                 album.title,
  //                 style: TextStyle(
  //                   fontSize: 20,
  //                   color: Theme.of(context).textTheme.bodyText1!.color,
  //                 ),
  //               ),
  //             ),
  //             Divider(
  //               color: Theme.of(context).textTheme.bodyText1!.color,
  //             ),
  //           ],
  //         ),
  //       );
  //       ;
  //     },
  //   );
  // }

  // _setTheme(bool darkTheme) async {
  //   AppTheme selectedTheme =
  //       darkTheme ? AppTheme.lightTheme : AppTheme.darkTheme;
  //   print(darkTheme);
  //   context.read<ThemekBloc>().add(ThemekEvent(appTheme: selectedTheme));
  //   //Preferences.saveTheme(selectedTheme);
  // }
}

Widget Test() {
  return Container(
    color: Colors.green,
    child: (const Center(
      child: Text('LOADED'),
    )),
  );
}

Widget Test2() {
  return Container(
    color: Colors.grey,
    child: (const Center(
      child: Text('ERROR '),
    )),
  );
}

Widget Test3() {
  return (const Center(
    child: const Text(' LOADING'),
  ));
}

Widget Test4() {
  return const MyAppApiTest();
}
