import 'package:flutter_application_muster/src/domain/entities/user_entity.dart';
import 'package:flutter_application_muster/src/domain/repositories/user_repository.dart';

class Getusers {
  final UserRepository userRepository;

  Getusers(this.userRepository);

  Future<List<UserEntity>> call() async {
    return userRepository.getUsers();
  }
}
