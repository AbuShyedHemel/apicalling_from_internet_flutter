class PostList {
  late final List<Post> posts;
  PostList(this.posts);

  factory PostList.fromJson(List<dynamic> parsedJson) {
    List<Post> posts = <Post>[];
    posts = parsedJson.map((data) => Post.fromJson(data)).toList();
    return PostList(posts);
  }
}
class Post{
  final int userId;
  final int id;
  final String title;

  Post({required this.userId, required this.id, required this.title});

  factory Post.fromJson(final json) {
    return Post(
      userId: json['userId'],
      id: json["id"],
      title: json["title"],
    );
  }
}
