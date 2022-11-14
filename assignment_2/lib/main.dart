import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //titleSection Code
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      //Main Row
      child: Row(
        children: [
          Expanded(
            //Col 1
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Col 1 Row 1
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                //Col 1 Row 2
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          //Col 2
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          //Col 3
          const Text('41'),
        ],
      ),
    );

    Color color = Theme.of(context).primaryColor;

    //buttonSection Code
    //Main Row
    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Col 1
        _buildButtonColumn(color, Icons.call, 'CALL'),
        //Col 2
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        //Col 3
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    //textSection Code
    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      //Main Row Col 1
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/lake.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  _makePhoneCall() async {
    var url = Uri(scheme: 'tel', path: "9776765434");
    launchUrl(url);
    // if (await canLaunchUrl(url)) {
    //   await launchUrl(url);
    // } else {
    //   throw 'Could not launch $url';
  }

  _launchMapsUrl() async {
    var url = Uri.parse('https://goo.gl/maps/RRC93Ae912Ehoiqa7');
    launchUrl(url);
    // if (await canLaunch(url)) {
    //   await launch(url);
    // } else {
    //   throw 'Could not launch $url';
    // }
  }

  _shareUrl() async {
    await Share.share(
        'Check out Lake Oeschinen Campground https://goo.gl/maps/RRC93Ae912Ehoiqa7',
        subject: 'Checkout this cool place!');
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              if (label == "CALL") {
                _makePhoneCall();
              } else if (label == "ROUTE") {
                _launchMapsUrl();
              } else if (label == "SHARE") {
                _shareUrl();
              } else {
                print("Action Failed");
              }
            },
            child: Column(
              children: [
                Icon(icon, color: color),
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: color,
                    ),
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
