import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/features/result/domain/repositories/result_repository.dart';

class GetUsersUsecase {
  final ResultRepository repository;

  GetUsersUsecase({required this.repository});

  Future<List<UserModel>> call() async {
    return await repository.getUsers();
  }
}
