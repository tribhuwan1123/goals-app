import 'package:blinking_text/blinking_text.dart';
import 'package:fitness/home/details.dart';
import 'package:fitness/home/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: const [
              Text(
                "Fitness",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/logo.png"),
              )
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.8),
                    spreadRadius: 5,
                    blurRadius: 5,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
                image: DecorationImage(
                  image: const AssetImage("assets/images/two.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2),
                    BlendMode.dstATop,
                  ),
                )),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  HomeSlider(),
                  Details(),
                  const BlinkText(
                    'Offers',
                    style: TextStyle(fontSize: 32.0,color: Colors.redAccent,fontWeight: FontWeight.bold),
                      beginColor: Colors.black,
                      endColor: Colors.orange,
                      duration: Duration(seconds: 1)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
