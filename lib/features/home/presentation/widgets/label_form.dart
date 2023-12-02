import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LabelForm extends StatelessWidget {
  final String label;
  final bool isRequired;
  const LabelForm({
    super.key,
    required this.label,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: GoogleFonts.poppins().copyWith(
                color: const Color(0xff161B2C),
              ),
            ),
            isRequired
                ? Text(
                    "*",
                    style: GoogleFonts.poppins().copyWith(
                      color: const Color(0xffF43F5E),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
