import 'package:arman_amin/config/images.dart';
import 'package:flutter/material.dart';

class OnlineUserCard extends StatelessWidget {
  final String name;
  final String? phone;
  final String? avatar;
  const OnlineUserCard({
    super.key,
    required this.name,
    this.phone,
    this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: theme.colorScheme.surface,
      elevation: 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: FadeInImage(
                  placeholder: AssetImage(AppImages.loading),
                  image: NetworkImage(avatar!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.labelLarge,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    phone ?? "",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
