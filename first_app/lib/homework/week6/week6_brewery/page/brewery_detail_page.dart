
import 'package:url_launcher/url_launcher_string.dart';

import '../model/brewery.dart';
import 'package:flutter/material.dart';

class BreweryDetailPage extends StatelessWidget {
  const BreweryDetailPage({Key? key, required this.brewery}) : super(key: key);

  final Brewery brewery;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Container(
          width: 200,
          child: Text(brewery.name, overflow: TextOverflow.ellipsis)
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(brewery.imgUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black54, BlendMode.darken
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: Row(
                  children: [
                    brewery.websiteUrl != null
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                          ),
                          onPressed: (){
                            launchUrlString(brewery.websiteUrl!);
                          },
                          child: Text('website'),
                        )
                      : Container(),
                    SizedBox(width: 8),
                    brewery.phone != null
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          ),
                          onPressed: (){
                            launchUrlString('sms:${brewery.phone!}');
                          },
                          child: Icon(Icons.call, color: Colors.white),
                        )
                      : Container(),
                    SizedBox(width: 8),
                  ],
                ),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(brewery.name, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18.0),
                          border: Border.all(color: Colors.white),
                          color: Colors.transparent,
                        ),
                        child: Text(brewery.breweryType, style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      SizedBox(width: 16),
                      brewery.phone != null
                        ? Text('phone: ${brewery.phone}', style: TextStyle(fontSize: 16))
                        : Container()
                    ],
                  ),
                  SizedBox(height: 20),
                  brewery.street != null
                    ? Text(brewery.street!, style: TextStyle(fontSize: 16))
                    : Container(),
                  SizedBox(height: 8),
                  Text('${brewery.city}, ${brewery.state} ${brewery.postalCode}', style: TextStyle(fontSize: 16))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

