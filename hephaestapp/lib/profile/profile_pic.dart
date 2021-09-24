import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
      CircleAvatar(backgroundImage: AssetImage('images/profile_image.png'),
      ),
      Positioned(
        right: -12,
        bottom: 0,          
        child: SizedBox(
          height: 46,
          width: 46,
          child: TextButton(

            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.white)
              ),
              primary: Colors.white,
              backgroundColor: Colors.amber,
              textStyle: TextStyle(fontSize: 24, fontStyle: FontStyle.italic)),
            onPressed: () {},
            child: SvgPicture.asset('images/camera.png'),
            
          )
        ),
      )
        ],
      ),
    );
  }
}