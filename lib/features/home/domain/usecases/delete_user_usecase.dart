import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/features/home/domain/repositories/home_repository.dart';

class DeleteUserUsecase {
  final HomeRepository repository;

  DeleteUserUsecase({required this.repository});

  Future<bool> call({required UserModel user}) async {
    return repository.deleteUser(user: user);
  }
}
