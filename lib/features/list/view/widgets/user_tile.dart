import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListTileCustomWidget extends StatelessWidget {
  const ListTileCustomWidget({super.key, required this.userName});
  final String userName;
  Widget build(BuildContext context) {
    var bodyTheme = Theme.of(context).textTheme;
    return ListTile(
      leading: SvgPicture.asset(
        "assets/goggles.svg",
        height: 35,
        width: 35,
      ),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.of(context).pushNamed(
            "/user",
            arguments: userName
        );
      },
      title: Text(
        userName,
        style: bodyTheme.bodyMedium,
      ),
      subtitle: Text(
        "200",
        style: bodyTheme.labelMedium,
      ),
    );
  }
}
