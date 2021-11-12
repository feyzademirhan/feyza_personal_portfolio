import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/globals.dart';
import 'package:feyportfolio/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import '../home.dart';

class FirstAppDetails extends StatelessWidget {
  const FirstAppDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, context),
      tablet: _buildUi(kTabletMaxWidth, context),
      mobile: _buildUi(getMobileMaxWidth(context), context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
       automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Home()));
                  },
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "F",
                          style: GoogleFonts.oswald(
                            color: kCaptionColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ".",
                          style: GoogleFonts.oswald(
                            color: kPrimaryColor,
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: SingleChildScrollView(
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
            return ResponsiveWrapper(
              maxWidth: width,
              minWidth: width,
              defaultScale: false,
              child: Flex(
                direction: constraints.maxWidth > 720
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: Image.asset(
                        "assets/images/image1.png",
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: Image.asset(
                        "assets/images/image2.png",
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 1 : 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 40),
                      child: Image.asset(
                        "assets/images/image3.png",
                        width: constraints.maxWidth > 720.0 ? null : 350.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: constraints.maxWidth > 720.0 ? 2 : 0,
                    child: Container(
                      padding: const EdgeInsets.only(left: 40),
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
                        ],
                      ),
                    ),
                  ),
                  //buildText(constraints, context)
                ],
              ),
            );
    },
  ),
          ),
        ),
      ),
    );
  }
