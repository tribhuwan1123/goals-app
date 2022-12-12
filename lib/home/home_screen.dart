import 'package:blinking_text/blinking_text.dart';
import 'package:fitness/home/details.dart';
import 'package:fitness/home/home_slider.dart';
import 'package:fitness/model/merchant/merchant_info.dart';
import 'package:fitness/screens/login/LoginScreen.dart';
import 'package:flutter/material.dart';

import '../animation/Slide.dart';

class HomeScreen extends StatefulWidget {
  final MerchantInfo merchantInfo;

  HomeScreen(this.merchantInfo, {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    String? url = widget.merchantInfo.data?.mobileAppInfo?.logo!;

    List<String> images = [
      widget.merchantInfo.data?.mobileAppInfo?.bannerImage1! ?? "",
      widget.merchantInfo.data?.mobileAppInfo?.bannerImage2! ?? "",
      widget.merchantInfo.data?.mobileAppInfo?.bannerImage3! ?? ""
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(150.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Text(
                widget.merchantInfo.data?.commonDetails?.title ?? "",
                overflow: TextOverflow.visible,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 30,

                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(url!),
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
                    offset: const Offset(0, 0), // changes position of shadow
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
                  HomeSlider(images),
                  Details(
                      widget.merchantInfo.data?.mobileAppInfo?.about ?? "",
                      widget.merchantInfo.data?.mobileAppInfo?.services ?? "",
                      widget.merchantInfo.data?.mobileAppInfo?.pricePlan ?? ""),
                  const BlinkText('Offers',
                      style: TextStyle(
                          fontSize: 32.0,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold),
                      beginColor: Colors.black,
                      endColor: Colors.orange,
                      duration: Duration(seconds: 1)),
                  Container(
                    padding: EdgeInsets.all(16),
                    child: Image.network(
                      widget.merchantInfo.data?.mobileAppInfo?.offerImage ?? "",
                      fit: BoxFit.fill,
                      width: double.infinity,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onTap: () => {
                      Navigator.push(
                          context,
                          Slide(
                              builder: (context) => LoginScreen(),
                              settings: null))
                    },
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileUi()));
                    child: Hero(
                      tag: "submit-button",
                      child: Container(
                        height: 55,
                        margin: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              /* Color(0xFF3383CD),
                                        Color(0xFF11249F) */
                              Colors.black,
                              Colors.black
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 100,
                backgroundImage: NetworkImage(url!),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.merchantInfo.data?.commonDetails?.title ?? "",
                overflow: TextOverflow.visible,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.merchantInfo.data?.commonDetails?.address ?? "",
                overflow: TextOverflow.visible,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.merchantInfo.data?.commonDetails?.ownerInchargeName ??
                    "",
                overflow: TextOverflow.visible,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.merchantInfo.data?.commonDetails?.phone ?? "",
                overflow: TextOverflow.visible,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Divider(),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.merchantInfo.data?.commonDetails?.email ?? "",
                overflow: TextOverflow.visible,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
