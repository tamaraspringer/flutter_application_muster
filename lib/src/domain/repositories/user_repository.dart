import 'package:flutter_application_muster/src/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUsers();
  Future<List<UserEntity>> postUser();
  Future<List<UserEntity>> deleteUser();
}
