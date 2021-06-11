class Photo{
  final int id;
  final String url;
  final String photographerName;
  final String photoUrl;
  const Photo({this.id,this.url,this.photographerName,this.photoUrl});

  factory Photo.fromJson(Map<String,dynamic> parseJson){
    return Photo(
      id: parseJson['id'],
      url:parseJson['url'],
      photographerName: parseJson['photographer'],
      photoUrl: parseJson['photographer_url']
    );
  }
  static List<Photo> getPhotoList(json){
    var list=json['photos'] as List;
    List<Photo> listDummy=list.map((value)=>Photo.fromJson(value)).toList();
    return listDummy;
  }
}