import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/features/home/domain/repositories/home_repository.dart';

class SaveUserUsecase {
  final HomeRepository repository;

  SaveUserUsecase({required this.repository});

  Future<bool> call({required UserModel user}) async {
    return repository.saveUser(user: user);
  }
}
