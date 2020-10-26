import 'dart:convert';

import 'package:http/http.dart';
import 'package:orax/Models/posts.dart';
import 'package:orax/Models/profile.dart';
class HttpService{

  final String postsUrl = "https://jsonplaceholder.typicode.com/posts";

  final String profileUrl = "https://reqres.in/api/users/2";

  Future<List<Post>> getPosts() async {
    Response res = await get(postsUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts = body
          .map(
            (dynamic item) => Post.fromJson(item),
          )
          .toList();

      return posts;
    } else {
      throw "Can't get posts.";
    }
  }

  Future<Profile> getProfile() async {

    Response res = await get(profileUrl);

    if(res.statusCode == 200){
      dynamic body = jsonDecode(res.body);

      Profile profile = Profile.fromJson(
        body,
      );

      return profile;
    } else {
      throw "Error getting Profile";
    }
  }
}