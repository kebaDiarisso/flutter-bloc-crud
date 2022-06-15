import '/api/service_api.dart';
import '/model/album_model.dart';
class Albumsrepository{

  Future<List<Albums>>getAlbumsList(){

    return AlbumService().getAlbums();
  }
}

class NetworkError extends Error {}