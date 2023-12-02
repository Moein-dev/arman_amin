import 'package:arman_amin/core/models/user_model.dart';
import 'package:arman_amin/features/home/data/datasources/home_local_provider.dart';
import 'package:arman_amin/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeLocalProvider localProvider;

  HomeRepositoryImpl({required this.localProvider});
  @override
  Future<bool> saveUser({required UserModel user}) async {
    return await localProvider.saveUser(user: user);
  }
  
  @override
  Future<bool> deleteUser({required UserModel user}) async{
    return await localProvider.deleteUser(user: user);

  }
}
