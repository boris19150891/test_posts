class AlbumsModel {
  List<AlbumsItemModel> content;

  AlbumsModel({this.content = const []});

  factory AlbumsModel.fromJson(List<dynamic> json) {
    return AlbumsModel(
        content: json == null ? [] : (json).map((e) => AlbumsItemModel.fromJson(e)).toList());
  }
}

class AlbumsItemModel {
  final num userId;
  final num id;
  final String title;

  AlbumsItemModel({
    this.userId = 0,
    this.id = 0,
    this.title = '',
  });

  factory AlbumsItemModel.fromJson(Map<String, dynamic> json) {
    return AlbumsItemModel(
        userId: json['userId'] ?? -1,
        id: json['id'] ?? -1,
        title: json['title'] ?? '',
    );
  }
}
