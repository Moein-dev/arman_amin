import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/features/result/data/datasources/result_local_provider.dart';
import 'package:arman_amin/features/result/domain/repositories/result_repository.dart';

class ResultRepositoryImpl extends ResultRepository {
  final ResultLocalProvider localProvider;

  ResultRepositoryImpl({required this.localProvider});

  @override
  Future<List<UserModel>> getUsers() async {
    return await localProvider.getUsers();
  }
}
