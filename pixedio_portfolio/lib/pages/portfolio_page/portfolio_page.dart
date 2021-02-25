import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pixedio_works/components/bordered_text.dart';
import 'package:pixedio_works/components/container_designed.dart';
import 'package:pixedio_works/components/header_nav.dart';
import 'package:pixedio_works/helper_functions/helper_functions.dart';
import 'package:pixedio_works/pages/home_page/sections/footer.dart';

class PortfolioPage extends StatefulWidget {
  static const String id = "portfolio_page";
  const PortfolioPage({Key key}) : super(key: key);

  @override
  _PortfolioPageState createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  @override
  void initState() {
    super.initState();
  }

  _carouselLayout(size) {
    return Column(
      children: [
        BorderedText('Portfolio'),
        SizedBox(height: 25.0),
        Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 400.0, enlargeCenterPage: true),
              items: ['img1', 'img2', 'img3', 'img4', 'img5', 'img6'].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Stack(
                        children: [
                          Center(child: Image.asset('web/assets/images/$i.png'))
                        ],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            Positioned(
              right: size.width <= 450 ? 5 : 20,
              top: 200,
              child: Opacity(
                  opacity: 0.20, child: Icon(Icons.arrow_forward_ios_outlined)),
            ),
            Positioned(
              left: size.width <= 450 ? 5 : 20,
              top: 200,
              child: Opacity(
                  opacity: 0.2, child: Icon(Icons.arrow_back_ios_outlined)),
            ),
          ],
        )
      ],
    );
  }

  _desktopLayout(size) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BorderedText('PORTFOLIO'),
        SizedBox(height: 25.0),
        Container(
          width: size.width * .75,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'web/assets/images/img6.png',
                      fit: BoxFit.scaleDown,
                      height: size.height * .33,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Image.asset(
                      'web/assets/images/img5.png',
                      fit: BoxFit.scaleDown,
                      height: size.height * .33,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Image.asset(
                      'web/assets/images/img4.png',
                      fit: BoxFit.scaleDown,
                      height: size.height * .33,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: Image.asset(
                      'web/assets/images/img3.png',
                      fit: BoxFit.scaleDown,
                      height: size.height * .33,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Image.asset(
                      'web/assets/images/img2.png',
                      fit: BoxFit.scaleDown,
                      height: size.height * .33,
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: Image.asset(
                      'web/assets/images/img1.png',
                      fit: BoxFit.scaleDown,
                      height: size.height * .33,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = getContextSize(context);
    final changeLayout = size.width <= 1000;
    return Scaffold(
      body: ContainerDesigned(
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 15.0),
              Container(
                height: size.height <= 685 ? 720 : size.height,
                padding: EdgeInsets.only(top: 100),
                width: size.width,
                child:
                    changeLayout ? _carouselLayout(size) : _desktopLayout(size),
              ),
              Footer(),
            ]),
          ),
          HeaderNav()
        ]),
      ),
    );
  }
}
