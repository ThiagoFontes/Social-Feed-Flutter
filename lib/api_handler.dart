import 'package:http/http.dart' as http;
import 'package:social_feed/post_model.dart';
import 'package:social_feed/user_model.dart';

Future<User> getUser() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/users/1');
  if (response.statusCode == 200) {
    //Returning User object
    return userFromJson(response.body);
  } else {
    //Something went wrong ops
    throw Exception('Failed to load user');
  }
}

Future<List<User>> getListOfUsers() async {
  final response = await http.get('https://jsonplaceholder.typicode.com/users');
  if (response.statusCode == 200) {
    //Returning User object
    return usersFromJson(response.body);
  } else {
    //Something went wrong ops
    throw Exception('Failed to load users');
  }
}

Future<List<Post>> getListOfPosts(int userId) async {
  final response = await http.get('https://jsonplaceholder.typicode.com/posts?userId=${userId}');
  if (response.statusCode == 200) {
    //Returning User object
    return postsFromJson(response.body);
  } else {
    //Something went wrong ops
    throw Exception('Failed to load posts');
  }
}