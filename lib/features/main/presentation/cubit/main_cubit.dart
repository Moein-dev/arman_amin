import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:arman_amin/core/router/app_router.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit()
      : super(const MainState(
          activeIndex: 0,
          lastPageRoute: RouterKey.home,
        ));

  void changeActiveIndex(int index) {
    if (index == 0) {
      changeLastPageRoute(RouterKey.home);
    } else {
      changeLastPageRoute(RouterKey.result);
    }
    emit(
      state.copyWith(
        newActiveIndex: index,
      ),
    );
  }

  void changeLastPageRoute(String pageRoute) {
    emit(
      state.copyWith(
        newLastPageRoute: pageRoute,
      ),
    );
  }
}
