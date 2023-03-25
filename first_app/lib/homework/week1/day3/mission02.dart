import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    Widget circle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );

    Widget redCircle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );

    Widget orangeCircle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );

    Widget yellowCircle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );

    Widget greenCircle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );

    Widget blueCircle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );

    Widget indigoCircle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );

    Widget purpleCircle = Container(
                    width: 20,
                    height: 20,
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  );                            

    List<Widget> circleList = [circle, circle, circle, circle, circle, circle, circle];
    List<Widget> rainbowCircleList = [redCircle, orangeCircle, yellowCircle, greenCircle, blueCircle, indigoCircle, purpleCircle];
    var circleRow = Row(
      children: circleList,
    );
    var rainbowCircleRow = Row(
      children: rainbowCircleList,
    );
    List<Widget> circleColumn = [rainbowCircleRow, rainbowCircleRow, rainbowCircleRow, rainbowCircleRow, rainbowCircleRow, rainbowCircleRow, rainbowCircleRow];

    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: circleColumn
            ),
          ),
        ),
      )
    );
  }
}
