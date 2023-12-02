import 'package:arman_amin/config/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class SideMenu extends StatelessWidget {
  final int? activeIndex;
  final void Function(int index)? onPressedItem;
  const SideMenu({
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
    ThemeData theme = Theme.of(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
/*       constraints: BoxConstraints(
        minWidth: width * 0.06,
        maxWidth: width * 0.18,
      ), */
      width: 264,
      decoration: BoxDecoration(
        color: const Color(0xff1B1B1F),
        border: Border.symmetric(
          vertical: BorderSide(
            width: 1,
            color: theme.colorScheme.onBackground.withOpacity(0.3),
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(200),
                    child: Image.asset(
                      AppImages.logo,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: List.generate(listOfStrings.length, (index) {
              return GestureDetector(
                onTap: () => onPressedItem!(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: index == activeIndex
                        ? const Color(0xff45464F)
                        : Colors.transparent,
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 12
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Icon(
                          listOfIcons[index],
                          color: index == activeIndex
                              ? Colors.white
                              : const Color(0xff757680),
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        flex:5,
                        child: Text(
                          listOfStrings[index],
                          style:GoogleFonts.poppins().apply(
                            color:  index == activeIndex
                              ? Colors.white
                              : const Color(0xff757680),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
          const Spacer(),
          Center(
            child: Padding(
              padding:const EdgeInsets.all(36.0),
              child: Text(
                "version 1.0.0",
                style: GoogleFonts.poppins().apply(
                  color: const Color(0xff757680),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
