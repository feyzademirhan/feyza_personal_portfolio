import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'carouselitems.dart';

class Carousel extends StatelessWidget {
  Carousel({Key? key}) : super(key: key);
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    double carouselContainerHeight = MediaQuery.of(context).size.height *
        (ScreenHelper.isMobile(context) ? .7 : .85);
    return SizedBox(
      height: carouselContainerHeight,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            child: CarouselSlider(
              carouselController: carouselController,
              options: CarouselOptions(
                viewportFraction: 1,
                scrollPhysics: const NeverScrollableScrollPhysics(),
                height: carouselContainerHeight,
              ),
              items: List.generate(
                carouselItems.length,
                    (index) => Builder(
                  builder: (BuildContext context) {
                    return Container(
                        constraints: BoxConstraints(
                          minHeight: carouselContainerHeight,
                        ),
                        child: ScreenHelper(
                          desktop: _buildDesktop(
                              context,
                              carouselItems[index].text,
                              carouselItems[index].image,
                              carouselItems[index].space,
                          ),
                          tablet: _buildTablet(
                              context,
                              carouselItems[index].text,
                              carouselItems[index].image,),
                          mobile: _buildMobile(
                              context,
                              carouselItems[index].text,
                              carouselItems[index].image,),
                        ));
                  },
                ),
              ).toList(),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildDesktop(BuildContext context, Widget text, Widget image, Widget space) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kDesktopMaxWidth,
      minWidth: kDesktopMaxWidth,
      defaultScale: false,
      child:
          Container(alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    flex: 1,
                    child: space),
                Expanded(
                  flex: 5,
                  child: image,
                ),
                Expanded(
                  flex: 3,
                  child: text,
                ),
              ],
            ),
          ),
      ),
  );
}

// Mid screens
Widget _buildTablet(BuildContext context, Widget text, Widget image,) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: kTabletMaxWidth,
      minWidth: kTabletMaxWidth,
      defaultScale: false,
      child:
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: image,
              ),
              Expanded(
                child: text,
              ),

            ],
          ),
      ),
  );
}

Widget _buildMobile(BuildContext context, Widget text, Widget image,) {
  return Container(
    constraints: BoxConstraints(
      maxWidth: getMobileMaxWidth(context),
    ),
    width: double.infinity,
    child: Column(
      children: [
        Expanded(
          child: text,
        ),
      ],
    )


  );
}

