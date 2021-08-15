import 'package:flutter/material.dart';
import 'package:flutter_medical/screen/profile/profile.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //drawer:new Drawer(),
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /*Icon(
              Icons.arrow_back_ios,
            ),*/
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              tooltip: 'Back',
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            /* Icon(
              Icons.menu,
              color: mSecondBackgroundColor,
              size: 36,
            )*/
            IconButton(
              icon: Icon(
                Icons.person_rounded,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MyProfile();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
