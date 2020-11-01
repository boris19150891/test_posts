class PostsModel {
  List<PostsItemModel> content;

  PostsModel({this.content = const []});

  factory PostsModel.fromJson(List<dynamic> json) {
    return PostsModel(
        content: json == null ? [] : (json).map((e) => PostsItemModel.fromJson(e)).toList());
  }
}

class PostsItemModel {
  final num id;
  final num userId;
  final String title;
  final String body;


  PostsItemModel({
    this.id = 0,
    this.userId = 0,
    this.title = '',
    this.body = '',

  });

  factory PostsItemModel.fromJson(Map<String, dynamic> json) {
    return PostsItemModel(
        id: json['id'] ?? -1,
        userId: json['userId'] ?? -1,
        title: json['title'] ?? '',
        body: json['body'] ?? ''
    );
  }
}
