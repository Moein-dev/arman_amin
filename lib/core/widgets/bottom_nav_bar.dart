import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class AppBottomNavBar extends StatelessWidget {
  final int? activeIndex;
  final void Function(int index)? onPressedItem;

  const AppBottomNavBar({
    super.key,
    this.onPressedItem,
    this.activeIndex,
  });

  static List<IconData> listOfIcons = [
    Iconsax.home_2,
    Iconsax.task_square,
    Iconsax.user,
  ];

  static List<String> listOfStrings = [
    'Home',
    'Result',
    'Online Users'
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: width,
          color: const Color(0xff1b1b1f),
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: SafeArea(
            top: false,
            child: Row(
              children: List.generate(listOfStrings.length, (index) {
                return Expanded(
                  child: InkWell(
                    onTap: () {
                      if (onPressedItem != null) {
                        onPressedItem!(index);
                      }
                    },
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 6,
                              horizontal: 21,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: index == activeIndex
                                  ? const Color(0xff45464f)
                                  : Colors.transparent,
                            ),
                            child: Icon(
                              listOfIcons[index],
                              color: index == activeIndex
                                  ? Colors.white
                                  : const Color(0xff757680),
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            listOfStrings[index],
                            style: GoogleFonts.poppins().apply(
                              color: index == activeIndex
                                  ? Colors.white
                                  : const Color(0xff757680),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }
}
