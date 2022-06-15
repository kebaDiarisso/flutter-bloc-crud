part of 'albums_bloc.dart';

// enum AlbumEvents{
//   fetchAlbums
// }

abstract class AlbumEvents extends Equatable {
  const AlbumEvents();

  @override
  List<Object> get props => [];
}


class GetAlbumEvents extends AlbumEvents {}