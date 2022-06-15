part of 'albums_bloc.dart';

// abstract class AlbumsState extends Equatable{
//   @override
//   // TODO: implement props
//   List<Object?> get props => [];
// }

// class AlbumLoadingState extends AlbumsState{ 
//   @override
//   List<Object> get props => [];
// }
// class AlbumInitialState extends AlbumsState{ 
//   @override
//   List<Object> get props => [];
// }

// class AlbumLoadedState extends AlbumsState{
// final List<Albums> albums;
// AlbumLoadedState({required this.albums});
// }
// class AlbumListErrorstate extends AlbumsState{

// final error;
// AlbumListErrorstate(String s, {this.error});
// }

abstract class AlbumsState extends Equatable {
  const AlbumsState();

  @override
  List<Object?> get props => [];
}

class AlbumInitialState extends AlbumsState {}

class AlbumLoadingState extends AlbumsState {}

class AlbumLoadedState extends AlbumsState {
final List<Albums> albums;
AlbumLoadedState({required this.albums});
}

class AlbumListErrorstate extends AlbumsState {
  final String? message;
  const AlbumListErrorstate(this.message);
}