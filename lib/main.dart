import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool themeSwitch = false;
  dynamic themeColors() {
    if (themeSwitch) {
      return Colors.grey[850];
    } else {
      return Colors.greenAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeColors(),
        elevation: 0,
        brightness: themeSwitch?Brightness.dark:Brightness.light,
        leading: IconButton(
          onPressed: () {
            setState(() {
              themeSwitch = !themeSwitch;
            });
          },
          icon: themeSwitch
              ? Icon(
                  Icons.brightness_3,
                  color: themeSwitch ? Colors.greenAccent : Colors.grey[850],
                )
              : Icon(
                  Icons.wb_sunny,
                  color: themeSwitch ? Colors.greenAccent : Colors.grey[850],
                ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            color: themeColors(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(30)),
                      color: themeColors()),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Unsplash',
                        style: TextStyle(color: themeSwitch?Colors.greenAccent:Colors.grey[850], fontSize: 26),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        'Photos for everyone',
                        style: TextStyle(color: themeSwitch?Colors.greenAccent:Colors.grey[850], fontSize: 40),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              ),
                              hintText: 'Search for photos',
                              hintStyle:
                                  TextStyle(color: themeSwitch?Colors.grey:Colors.grey, fontSize: 15)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text(
                              'Categories',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeSwitch?Colors.greenAccent:Colors.grey[850]),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 200,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  imageCard(1, 'Landscape'),
                                  imageCard(2, 'Architecture'),
                                  imageCard(3, 'Animal'),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/4.jpg'),
                                      fit: BoxFit.cover)),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Current Festival',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/3.jpg'),
                                      fit: BoxFit.cover)),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Cat Gallery',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: AssetImage('assets/images/1.jpg'),
                                      fit: BoxFit.cover)),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(8),
                                  child: Text(
                                    'Cat Gallery',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget imageCard(image, title) {
  return AspectRatio(
    aspectRatio: 2.5 / 3,
    child: Container(
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
              image: AssetImage('assets/images/$image.jpg'),
              fit: BoxFit.cover)),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            title,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  );
}
