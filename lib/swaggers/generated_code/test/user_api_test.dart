import 'package:test/test.dart';
import 'package:openapi/openapi.dart';


/// tests for UserApi
void main() {
  final instance = Openapi().getUserApi();

  group(UserApi, () {
    // Retrieve a user by ID
    //
    // Retrieve a user by their user ID.
    //
    //Future<User> usersIdGet(String id) async
    test('test usersIdGet', () async {
      // TODO
    });

    // Update user status
    //
    // Update the status of a user by their user ID.
    //
    //Future usersIdPut(String id, UsersIdPutRequest usersIdPutRequest) async
    test('test usersIdPut', () async {
      // TODO
    });

    // Create a new user
    //
    // Create a new user with the provided information.
    //
    //Future<UsersPost201Response> usersPost(UsersPostRequest usersPostRequest) async
    test('test usersPost', () async {
      // TODO
    });

  });
}
