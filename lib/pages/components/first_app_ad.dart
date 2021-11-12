import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/screen_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'first_app_details.dart';


class FirstAppAd extends StatelessWidget {
  const FirstAppAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth),
        tablet: _buildUi(kTabletMaxWidth),
        mobile: _buildUi(getMobileMaxWidth(context)),
      ),
    );
  }

  Widget _buildUi(double width) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return ResponsiveWrapper(
            maxWidth: width,
            minWidth: width,
            defaultScale: false,
            child: Container(
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 2 : 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Image.asset(
                        "assets/images/app.jpeg",
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 5 : 0,
                    child: Container(
                      padding: EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "ANDROID APP",
                            style: GoogleFonts.robotoMono(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w900,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            "UNIVERSAL\nSMART APP",
                            style: GoogleFonts.oswald(
                              color: kCaptionColor,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                              fontSize: 35.0,
                            ),
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            "This project was created as an example. I do not have a paid project yet, this section will be updated as soon as possible. Love ya!",
                            style: GoogleFonts.robotoMono(
                              color: kCaptionColor,
                              height: 1.5,
                              fontSize: 15.0,
                            ),
                          ),
                          const SizedBox(
                            height: 25.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              height: 48.0,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 28.0,
                              ),
                              child: TextButton(
                                onPressed: () {Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const FirstAppDetails()));},
                                child: Container(
                                  width: 110,
                                  child: Center(
                                    child: Text(
                                      "EXPLORE MORE",
                                      style: GoogleFonts.robotoMono(
                                        color: kCaptionColor,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}