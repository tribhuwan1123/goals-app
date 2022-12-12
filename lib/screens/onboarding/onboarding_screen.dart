import 'package:fitness/home/home_screen.dart';
import 'package:fitness/model/merchant/merchant_info.dart';
import 'package:fitness/services/MerchantService.dart';
import 'package:flutter/material.dart';
import '../../model/OnboardingData.dart';
import '../onboarding/onboarding.dart';
import '../login/LoginScreen.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late Future _merchantInfo;
  late MerchantInfo merchantInfo;

  @override
  void initState() {
    _merchantInfo = fetchMerchantInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _merchantInfo,
        builder: (context, state) {
          if (state.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (!state.hasError) {
              return Consumer<MerchantService>(
                builder: (_, service, __) =>
                service.merchantInfo != null
                    ? IntroScreen(
                    [
                      OnbordingData(
                        imagePath: service.merchantInfo.data?.mobileAppInfo?.bannerImage1!,
                        title: "Train",
                        desc: "The more you sweat in training, the less you bleed in combat",
                      ),
                      OnbordingData(
                        imagePath: service.merchantInfo.data?.mobileAppInfo?.bannerImage2!,
                        title: "Everything",
                        desc: "Everything is hard before it is easy.",
                      ),
                      OnbordingData(
                        imagePath: service.merchantInfo.data?.mobileAppInfo?.bannerImage3!,
                        title: "Want Something",
                        desc:
                        "If you want something you’ve never had, you must be willing to do something you’ve never done.",
                      ),
                    ],
                    MaterialPageRoute(
                        builder: (context) => HomeScreen(merchantInfo)))
                    : Container(
                  child: Center(
                      child:
                      Text("Could not fetch merchant info. . .")),
                ),
              );
            }
            return Center(child: Text("Could not fetch merchant info."));
          }
        },
      ),
    );
  }

  Future fetchMerchantInfo() async {
    await Provider.of<MerchantService>(context, listen: false)
        .fetchMerchantInfo("1");
    merchantInfo =
        Provider
            .of<MerchantService>(context, listen: false)
            .merchantInfo;
  }
}
