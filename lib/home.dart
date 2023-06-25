import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  @override
  void initState() {
    // TODO: implement initState

    initBannerAd();
    super.initState();
  }


  late BannerAd bannerAd;
  bool isLoadedAd = true;
  
  initBannerAd(){
    bannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',//'ca-app-pub-3940256099942544/6300978111', //real : ca-app-pub-7717691325471730/9467186392
        listener: BannerAdListener(
          onAdLoaded: (ad){
            setState(() {
              isLoadedAd = false;
            });
          },
          onAdFailedToLoad: (ad,error){
            ad.dispose();
            print("Loading failed-----");
            print("error : "+error.toString());
          },

        ),
        request: const AdRequest()
    );
    bannerAd.load();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("Banner Ad Testing"),
      ),
      bottomNavigationBar: isLoadedAd ? SizedBox(
        height: 200,//bannerAd.size.height.toDouble(),
        width: 200,//bannerAd.size.width.toDouble(),
        child: AdWidget(ad: bannerAd),
      ):const SizedBox(child: Text("sdfsd",style:TextStyle(color:Colors.black),),),
    );
  }
}
