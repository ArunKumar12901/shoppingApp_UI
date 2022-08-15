import 'package:flutter/material.dart';
import 'package:imageview360/imageview360.dart';
import 'package:ui_designing_practice1/data.dart';
import 'package:ui_designing_practice1/my_colors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<ImageProvider> imageList = [];
  bool autoRotate = false;
  int rotationCount = 22;
  int swipeSensitivity = 2;
  bool allowSwipeToRotate = true;

  @override
  void initState() {
    updateImageList(context);
    super.initState();
  }
  List<Widget> builColorWidget() {
    return Data.generateCategories().map((e) => Container(
      padding: EdgeInsets.only(left: 5, bottom: 10, top: 15),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: e.id == 1 ? MyColors.myOrange: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Image.asset(e.image, height: 30, width: 30,),

        ),
      ),
    )).toList();
  }

  void updateImageList(BuildContext context) {
    for (int i = 1; i <= 21; i++) {
      imageList.add(AssetImage("assets/s$i.png"));
    }
  }

//32
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ), //32
        centerTitle: true,
        title: Text(
          "Men's shoes",
          style: TextStyle(color: MyColors.myOrange),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [Image.asset("assets/ic_search.png")],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: size.width - 30,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 70),
                        child: Image.asset("assets/ring.png"),
                      ),
                    ),
                    ImageView360(
                        key: UniqueKey(),
                        autoRotate: autoRotate,
                        rotationCount: rotationCount,
                        swipeSensitivity: swipeSensitivity,
                        imageList: imageList
                    )
                  ],
                ),
              ),
              Container(
                width: size.width,
                decoration: const BoxDecoration(
                  color: MyColors.grayBackground,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)
                  )
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(textAlign: TextAlign.start,
                          text: const TextSpan(
                            text: ("Nike Air Max Pre-Day"),
                            style: TextStyle(color: Colors.black87,
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                       SizedBox(height: 10),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber,),
                          RichText(textAlign: TextAlign.start,
                              text: const TextSpan(
                                text: ("5.0"),
                                style: TextStyle(color: Colors.black87,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                          const SizedBox(width: 10),
                          RichText(textAlign: TextAlign.start,
                              text: const TextSpan(
                                text: ("1125 Review"),
                                style: TextStyle(color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              )
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      RichText(textAlign: TextAlign.start,
                          text: const TextSpan(
                            text: ("Men's sneakers are made with leather upper features for durability and support, while perforations provide airflow during every shoe wear."),
                            style: TextStyle(color: Colors.black45,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                      ),
                      const SizedBox(height: 10),
                      RichText(textAlign: TextAlign.start,
                        text: const TextSpan(
                          text: ("Select Color"),
                          style: TextStyle(color: Colors.black87,
                              fontSize: 20,
                          ),
                        ),
                      ),
                       SizedBox(height: 80,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: builColorWidget(),

                        ),
                      ),
                    ],
                  ),
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
