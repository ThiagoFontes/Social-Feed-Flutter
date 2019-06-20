import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:social_feed/user_model.dart';

Future<User> getUser() async{
  final response = await http.get('https://jsonplaceholder.typicode.com/users/1');
  if (response.statusCode == 200) {
    //Returning User object
    return userFromJson(response.body);
  } else {
    //Something went wrong ops
    throw Exception('Failed to load post');
  }
}