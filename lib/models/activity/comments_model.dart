class CommentsModel {
List<CommentsItemModel> content;

CommentsModel({this.content = const []});

factory CommentsModel.fromJson(List<dynamic> json) {
return CommentsModel(
content: json == null ? [] : (json).map((e) => CommentsItemModel.fromJson(e)).toList());
}
}

class CommentsItemModel {
  final num postID;
  final num id;
  final String name;
  final String email;
  final String body;


  CommentsItemModel({
    this.postID = 0,
    this.id = 0,
    this.name = '',
    this.email = '',
    this.body = '',

  });

  factory CommentsItemModel.fromJson(Map<String, dynamic> json) {
    return CommentsItemModel(
        postID: json['postId'] ?? -1,
        id: json['id'] ?? -1,
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        body: json['body'] ?? ''
    );
  }
}
