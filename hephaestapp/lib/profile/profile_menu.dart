import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key key,
    @required this.text,
    @required this.press,
    @required this.icon,
  }) : super(key: key);

final String text;
final VoidCallback press;
final Widget icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(20),
          shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: const Color(0xFFBB80FF),
        ),
        onPressed: press, 
        child: Row(
          children: [
            SizedBox(width: 20),
            Expanded(child: Text(
              text, 
              style: TextStyle(fontFamily: 'HelveticaBold', fontSize: 18, color: Colors.black87),
              ),
              ),
            SizedBox(child: icon),

          ],
          )
       ),
    );
  }
}

