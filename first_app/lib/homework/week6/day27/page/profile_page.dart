
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../model/profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key, required this.profile, required this.imgUrl}) : super(key: key);

  final Profile profile;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(profile.name),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black54, BlendMode.darken
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeInRight(
                      delay: Duration(milliseconds: 500),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 45, bottom: 20),
                        child: Text(profile.name, style: TextStyle(fontSize: 30)),
                      ),
                    ),
                    Divider(),
                    FadeInRight(
                      delay: Duration(milliseconds: 1500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Information', style: TextStyle(fontSize: 24)),
                          ),
                          Row(
                            children: [
                              Icon(Icons.mail),
                              SizedBox(width: 8),
                              Text(profile.email),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.call),
                              SizedBox(width: 8),
                              Text(profile.phone),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              SizedBox(width: 8),
                              Text('${profile.address}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                    FadeInRight(
                      delay: Duration(milliseconds: 2500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text('Company', style: TextStyle(fontSize: 24)),
                          ),
                          Text(profile.company.name),
                          Text(profile.company.catchPhrase),
                          Text(profile.company.bs),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 200,
            left: 16,
            child: Container(
              width: 100,
              height: 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(imgUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

