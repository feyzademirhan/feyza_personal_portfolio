import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:feyportfolio/model/carousel_item_model.dart';
import 'package:feyportfolio/model/social_media_bar.dart';
import 'package:feyportfolio/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

List<CarouselItemModel> carouselItems = List.generate(
  5,
  (index) => CarouselItemModel(
    space: SizedBox(height: 40),
    text: Row(
      children: [
        SocialMediaBar(),
        Container(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "FLUTTER DEVELOPER",
                style: GoogleFonts.robotoMono(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(
                height: 18.0,
              ),
              SizedBox(
                child: DefaultTextStyle(
                  style: GoogleFonts.roboto(
                    color: kCaptionColor,
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    height: 1.3,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('FEYZA\nDEMİRHAN'),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Newbie but passionate \nabout coding, \nbased in Turkey",
                style: GoogleFonts.robotoMono(
                  color: kCaptionColor,
                  fontSize: 15.0,
                  height: 1.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ],
    ),
    image: Container(
      height: 250.0,
      decoration: const BoxDecoration(
        color: Color(0xFF3B3F59),
        borderRadius: BorderRadius.all(Radius.circular(20)),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/coder.gif",
          ),
        ),
      ),
    ),
  ),
);
