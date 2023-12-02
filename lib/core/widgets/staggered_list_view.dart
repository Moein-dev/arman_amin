import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class StaggeredListView extends StatelessWidget {
  final EdgeInsets? padding;
  final ScrollPhysics physics;
  final int? itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool reverse;
  final bool shrinkWrap;
  const StaggeredListView(
      {super.key,
      this.padding,
      this.physics =
          const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      this.itemCount,
      required this.itemBuilder,
      this.reverse = false,
      this.shrinkWrap = false});

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: padding,
        physics: physics,
        itemCount: itemCount,
        reverse: reverse,
        shrinkWrap: shrinkWrap,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 300),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastLinearToSlowEaseIn,
              child: FadeInAnimation(
                curve: Curves.fastLinearToSlowEaseIn,
                duration: const Duration(milliseconds: 300),
                child: itemBuilder(context, index),
              ),
            ),
          );
        },
      ),
    );
  }
}
