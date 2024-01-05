import 'package:flutter/material.dart';
import 'package:flutter_design/src/widgets/slideshow.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlideshowPage extends StatelessWidget {
  const SlideshowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child: MySlideshow()),
        Expanded(child: MySlideshow()),
        
      ],)
    );
  }
}

class MySlideshow extends StatelessWidget {
  const MySlideshow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      primaryColor: Colors.yellow,
      secondaryColor: Colors.orange,
      primaryBullet: 20,
      slides: [
      SvgPicture.asset('assets/svgs/slide-1.svg'),
      SvgPicture.asset('assets/svgs/slide-2.svg'),
      SvgPicture.asset('assets/svgs/slide-3.svg'),
      SvgPicture.asset('assets/svgs/slide-4.svg'),
      SvgPicture.asset('assets/svgs/slide-5.svg'),
    
    ],);
  }
}