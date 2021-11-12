import 'package:feyportfolio/model/footer_items.dart';
import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/screen_helper.dart';
import 'package:feyportfolio/utils/url_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

final List<FooterItem> footerItems = [
  FooterItem(
    iconPath: "assets/icons/earth.png",
    title: "ADDRESS",
    text: "Hatay / TURKEY",
  ),
  FooterItem(
    iconPath: "assets/icons/githubcolor.png",
    title: "GITHUB",
    text: "https://github.com/feyzademirhan",
  ),
  FooterItem(
    iconPath: "assets/icons/linkedincolor.png",
    title: "LINKEDIN",
    text: "https://www.linkedin.com/in/feyzademirhan/",
  ),
  FooterItem(
    iconPath: "assets/icons/mailcolor.png",
    title: "EMAIL",
    text: "feyzadhan@gmail.com",
  ),
];

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return Center(
    child: ResponsiveWrapper(
      maxWidth: width,
      minWidth: width,
      defaultScale: false,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  child: Wrap(
                    spacing: 20.0,
                    runSpacing: 20.0,
                    children: footerItems
                        .map(
                          (footerItem) => Container(
                            height: 120.0,
                            width: ScreenHelper.isMobile(context)
                                ? constraints.maxWidth / 2.0 - 20.0
                                : constraints.maxWidth / 4.0 - 20.0,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        footerItem.iconPath,
                                        width: 25.0,
                                      ),
                                      const SizedBox(
                                        width: 15.0,
                                      ),
                                      Text(
                                        footerItem.title,
                                        style: GoogleFonts.oswald(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: kCaptionColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                                  RichText(
                                    textAlign: TextAlign.center,
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: "${footerItem.text}\n",
                                          style: TextStyle(
                                            color: kCaptionColor,
                                            height: 1.8,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "GET IN TOUCH",
                        style: GoogleFonts.oswald(
                          color: kCaptionColor,
                          fontWeight: FontWeight.w900,
                          height: 1.8,
                          fontSize: 25.0,
                        ),
                      ),
                      Container(
                        color: kDangerColor,
                        width: 200,
                        height: 1,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "I am very excited to realize the ideas in your mind. \nTell me about your ideas.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                          color: kCaptionColor,
                          fontSize: 16.0,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 20),
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
                            onPressed: () {UrlHelper.launchUrl(
                              "mailto:feyzadhan@gmail.com?subject=Hello%20Feyza",
                            );},
                            child: Container(
                              width: 100,
                              child: Center(
                                child: Text(
                                  "Say Hello",
                                  style: GoogleFonts.robotoMono(
                                    color: kCaptionColor,
                                    fontSize: 13.0,
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
                const SizedBox(
                  height: 50.0,
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Text(
                    "Designed & Built by Feyza Demirhan",
                    style: GoogleFonts.robotoMono(
                      color: kCaptionColor,
                    ),
                  ),
                ),
              ]);
        },
      ),
    ),
  );
}
