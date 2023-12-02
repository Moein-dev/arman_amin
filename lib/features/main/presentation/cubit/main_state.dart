part of 'main_cubit.dart';

class MainState extends Equatable {
  final int activeIndex;
  final String lastPageRoute;
  const MainState({
    required this.activeIndex,
    required this.lastPageRoute,
  });

  MainState copyWith({
    int? newActiveIndex,
    String? newLastPageRoute,
  }) {
    return MainState(
      activeIndex: newActiveIndex ?? activeIndex,
      lastPageRoute: newLastPageRoute ?? lastPageRoute,
    );
  }

  @override
  List<Object> get props => [
        activeIndex,
        lastPageRoute,
      ];
}
