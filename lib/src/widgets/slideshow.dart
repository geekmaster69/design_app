import 'package:flutter/material.dart';

//Borrar dependencia

import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBullet;
  final double secondaryBullet;

  const Slideshow(
      {super.key,
      required this.slides,
      this.dotsUp = false,
      this.primaryColor = Colors.indigo,
      this.secondaryColor = Colors.grey,
      this.primaryBullet = 12,
      this.secondaryBullet = 12});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _SlidershowModel(),
      child: SafeArea(
        child: Center(child: Builder(
          builder: (context) {
            Provider.of<_SlidershowModel>(context).primaryColor = primaryColor;
            Provider.of<_SlidershowModel>(context).secondaryColor =
                secondaryColor;

            Provider.of<_SlidershowModel>(context).primaryBullet =
                primaryBullet;
            Provider.of<_SlidershowModel>(context).secondaryBullet =
                secondaryBullet;
            return Column(
              children: [
                if (dotsUp) _Dots(slides.length),
                Expanded(child: _Slides(slides)),
                if (!dotsUp) _Dots(slides.length),
              ],
            );
          },
        )),
      ),
    );
  }
}

class _Dots extends StatelessWidget {
  final int totalSlides;

  const _Dots(this.totalSlides);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalSlides, (index) => _Dot(index))),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  const _Dot(this.index);

  @override
  Widget build(BuildContext context) {
    final slideModel = Provider.of<_SlidershowModel>(context);

    double size;
    Color color;

    if (slideModel.currentPage >= index - 0.5 &&
        slideModel.currentPage < index + 0.5) {
      size = slideModel.primaryBullet;
      color = slideModel.primaryColor;
    } else {
      size = slideModel.secondaryBullet;
      color = slideModel.secondaryColor;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: size,
      height: size,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}

//  SvgPicture.asset('assets/svgs/slide-1.svg')

class _Slides extends StatefulWidget {
  final List<Widget> slides;
  const _Slides(this.slides);

  @override
  State<_Slides> createState() => _SlidesState();
}

class _SlidesState extends State<_Slides> {
  final pageViewController = PageController();

  @override
  void initState() {
    pageViewController.addListener(() {
      if (pageViewController.page == null) return;

      Provider.of<_SlidershowModel>(context, listen: false).currentPage =
          pageViewController.page!;
    });

    super.initState();
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
          controller: pageViewController,
          children: widget.slides.map((slide) => _Slide(slide)).toList()),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;
  const _Slide(this.slide);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        height: double.infinity,
        child: slide);
  }
}

class _SlidershowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.indigo;
  Color _secondaryColor = Colors.grey;
  double _primaryBullet = 12;
  double _secondaryBullet = 12;

  double get currentPage => _currentPage;

  set currentPage(double value) {
    _currentPage = value;
    notifyListeners();
  }

  Color get primaryColor => _primaryColor;
  set primaryColor(Color color) {
    _primaryColor = color;
  }

  Color get secondaryColor => _secondaryColor;
  set secondaryColor(Color color) {
    _secondaryColor = color;
  }

  double get primaryBullet => _primaryBullet;
  set primaryBullet(double value) {
    _primaryBullet = value;
  }

  double get secondaryBullet => _secondaryBullet;
  set secondaryBullet(double value) {
    _secondaryBullet = value;
  }
}
