import 'package:booklyapp/core/helper/contexts.dart';
import 'package:booklyapp/features/details/ui/widgets/webview_details.dart';
import 'package:flutter/material.dart';

class AppbarInDetails extends StatelessWidget {
  final int? index;

  const AppbarInDetails({
    super.key,
    this.index,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).textTheme.bodyLarge?.color;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildIconButton(
          icon: Icons.close,
          onPressed: () {
            context.pop();
          },
          iconColor: iconColor,
        ),
        Row(
          children: [
            _buildIconButton(
              icon: Icons.shopping_cart,
              onPressed: () {
                // إجراء لعربة التسوق
              },
              iconColor: iconColor,
            ),
            _buildIconButton(
              icon: Icons.share_outlined,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WebviewDetails(index: index),
                  ),
                );
              },
              iconColor: iconColor,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color? iconColor,
  }) {
    return IconButton(
      icon: Icon(icon, color: iconColor),
      onPressed: onPressed,
    );
  }
}
