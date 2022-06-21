import 'package:flutter/material.dart';
import '../../model/user.dart';
class ProfileInformation extends StatelessWidget{
 final UserLocal user;
  const ProfileInformation({ required this.user,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final imageProfile = Container(
      height: 80.0,
      width: 80.0,
      margin: const EdgeInsets.only(
          top: 100.0,
          left: 20.0,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(user.photoURL),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50.0))
      ),
    );
    final perfilTitle = Container(
      margin: const EdgeInsets.only(
          top: 120.0,
          left: 10.0
      ),
      child: Text(
        user.userName,
        textAlign: TextAlign.left,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20.0
        ),
      ),
    );

    final perfilEmail = Container(
      margin: const EdgeInsets.only(
          top: 5.0,
          left: 10.0
      ),
      child: Text(
        user.userEmail,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.grey,
            fontSize: 13.0
        ),
      ),
    );
    final perfilNameEmail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        perfilTitle,
        perfilEmail
      ],
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        imageProfile,
        perfilNameEmail
      ],
    );
  }

}