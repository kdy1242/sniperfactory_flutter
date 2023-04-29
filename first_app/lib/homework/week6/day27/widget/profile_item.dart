
import 'package:flutter/material.dart';

import '../model/profile.dart';
import '../page/profile_page.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key, required this.profile}) : super(key: key);

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    String imgUrl = 'https://xsgames.co/randomusers/assets/avatars/male/${profile.id}.jpg';

    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image.network(imgUrl),
      ),
      title: Text(profile.name),
      subtitle: Text(profile.email),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfilePage(profile: profile, imgUrl: imgUrl))
        );
      },
    );
  }
}

