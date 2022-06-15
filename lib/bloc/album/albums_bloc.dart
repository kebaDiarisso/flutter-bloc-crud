
import 'dart:io';
import '/model/album_model.dart';
import '/repositories/Albumsrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'albums_events.dart';
part 'albums_state.dart';


class AlbumsBloc extends Bloc<AlbumEvents, AlbumsState> {
  late List<Albums> listAlbums;
  AlbumsBloc() : super(AlbumInitialState()) {
    final Albumsrepository _albumsrepository = Albumsrepository();

    on<GetAlbumEvents>((event, emit) async {
     
      try {
        emit(AlbumLoadingState());
        final mList = await _albumsrepository.getAlbumsList();
        print(mList);
        emit(AlbumLoadedState( albums: []));
      //  if (mList.error != null) {
      //    emit(AlbumListErrorstate(mList.error));
      //  }
      } on HttpException {
        emit(AlbumListErrorstate("Failed to fetch data. is your device online?"));
      }
    });
  }
}


// import 'dart:io';
// import '/bloc/album/albums_events.dart';
// import '/model/album_model.dart';
// import '/repositories/Albumsrepository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'albums_state.dart';

// class AlbumsBloc extends Bloc<AlbumEvents,AlbumsState>
// {

//   final Albumsrepository albumsrepository;
//    late List<Albums> listAlbums;
//   AlbumsBloc({required this.albumsrepository}) : super(AlbumInitialState());

//   @override
//   Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {

//     switch(event)
//     {
//       case AlbumEvents.fetchAlbums:

//         yield  AlbumLoadingState();

//         try {
//           listAlbums = await albumsrepository.getAlbumsList();

//           yield AlbumLoadedState(albums: listAlbums);

//         }on SocketException {
//           yield AlbumListErrorstate(
//             error: ('No Internet'),
//           );
//         } on HttpException {
//           yield AlbumListErrorstate(
//             error: ('No Service'),
//           );
//         } on FormatException {
//           yield AlbumListErrorstate(
//             error: ('No Format Exception'),
//           );
//         } catch (e) {
//           print(e.toString());
//           yield AlbumListErrorstate(
//             error: ('Un Known Error ${e.toString()}'),
//           );
//         }
//         break;
//     }

//   }

// }

// import '/bloc/album/albums_events.dart';
// import '/model/album_model.dart';
// import '/repositories/Albumsrepository.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import 'albums_state.dart';

// class AlbumsBloc extends Bloc<AlbumEvents,AlbumsState>
// {

//   final Albumsrepository albumsrepository;
//    late List<Albums> listAlbums;
//   AlbumsBloc({required this.albumsrepository}) : super(AlbumInitialState());

//   Stream<AlbumsState> mapEventToState(AlbumEvents event) async* {

//       if(event is AlbumEvents){
//         yield AlbumLoadingState();
//         try {
//           listAlbums = await albumsrepository.getAlbumsList();

//            yield AlbumLoadedState(albums: listAlbums);
//         } catch (e) {
//           yield AlbumListErrorstate(
//             error: ('Error'),
//            );
//         }
//       }

//   }

// }
 