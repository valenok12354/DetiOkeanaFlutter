import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListTileCustom extends StatelessWidget {
  const ListTileCustom({super.key});

  Widget build(BuildContext context) {
    var bodyTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: SvgPicture.asset(
        "assets/goggles.svg",
        height: 35,
        width: 35,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      title: Text(
        "User",
        style: bodyTheme.bodyMedium,
      ),
      subtitle: Text(
        "200",
        style: bodyTheme.labelMedium,
      ),
    );
  }
}
