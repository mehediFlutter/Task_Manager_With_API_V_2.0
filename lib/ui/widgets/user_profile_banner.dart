import 'package:flutter/material.dart';
import 'package:task_manager/data/model/auth_utility.dart';
import 'package:task_manager/ui/screens/update_profile_screen.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserProfileScreen()));
      },
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      tileColor: Colors.green,
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
            "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
      ),
      title: Text(
       '${AuthUtility.userInfo.data?.firstName ?? '' } ${AuthUtility.userInfo.data?.lastName?? ''}',
        style: TextStyle(fontSize: 14, color: Colors.white),
      ),
      subtitle:  Text(AuthUtility.userInfo.data?.email?? '',
          style: const TextStyle(fontSize: 14, color: Colors.white)),
    );
  }
}
