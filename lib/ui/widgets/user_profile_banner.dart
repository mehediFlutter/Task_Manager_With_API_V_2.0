import 'package:flutter/material.dart';

class UserProfileBanner extends StatelessWidget {
  const UserProfileBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ListTile(
      contentPadding:EdgeInsets.symmetric(vertical: 0, horizontal: 16) ,
      tileColor: Colors.green,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://t4.ftcdn.net/jpg/02/14/74/61/360_F_214746128_31JkeaP6rU0NzzzdFC4khGkmqc8noe6h.jpg"),
          ),
          title: Text("User name",style: TextStyle(fontSize: 14,color: Colors.white),),
          subtitle: Text("User email",style: TextStyle(fontSize: 14,color: Colors.white)),
        );
  }
}
