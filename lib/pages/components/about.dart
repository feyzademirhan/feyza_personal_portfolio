import 'package:feyportfolio/model/skills.dart';
import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class About extends StatelessWidget {
  About({Key? key}) : super(key: key);

  List<Skill> skills = [
    Skill(
      skill: "Dart",
      percentage: 80,
    ),
    Skill(
      skill: "Photoshop",
      percentage: 60,
    ),
    Skill(
      skill: "Illustrator",
      percentage: 75,
    ),
    Skill(
      skill: "Flutter",
      percentage: 80,
    ),
    Skill(
      skill: "Git",
      percentage: 40,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: ScreenHelper(
            desktop: _buildUi(context, kDesktopMaxWidth),
            tablet: _buildUi(context, kTabletMaxWidth),
            mobile: _buildUi(
              context,
              getMobileMaxWidth(context),
            )));
  }

  Widget _buildUi(BuildContext context, double width) {
    return Center(child: LayoutBuilder(builder: (context, constraints) {
      return ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: Flex(
              direction:
                  constraints.maxWidth > 720 ? Axis.horizontal : Axis.vertical,
              children: [
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: const SizedBox(height: 0,),
                ),
                Expanded(
                    flex: constraints.maxWidth > 720.0 ? 7 : 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "1. ABOUT ME",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.oswald(
                              color: kCaptionColor,
                              fontWeight: FontWeight.w900,
                              height: 1.8,
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            width: 200,
                            color: kDangerColor,
                            height: 1,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Hello! My name is Feyza and I enjoy creating things that live on the internet. After graduating from Industrial Engineering department, I realized my interest in development and started a new journey. I'm improving myself about Flutter and Dart. I'm always open to face new challenges and to learn new things.",
                          style: GoogleFonts.robotoMono(
                            color: kCaptionColor,
                            fontSize: 15.0,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Here are some of my skills;",
                          style: GoogleFonts.robotoMono(
                            color: kCaptionColor,
                            fontSize: 15.0,
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Column(
                          children: skills
                              .map(
                                (skill) => Container(
                              margin: const EdgeInsets.only(bottom: 15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: skill.percentage,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 10.0),
                                      alignment: Alignment.centerLeft,
                                      height: 25.0,
                                      child: Text(skill.skill, style: GoogleFonts.robotoMono(
                                        color: kCaptionColor,
                                        fontSize: 14.0,
                                      ),),
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Expanded(
                                    // remaining (blank part)
                                    flex: 100 - skill.percentage,
                                    child: Divider(
                                      color: kCaptionColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    "${skill.percentage}%",
                                    style: GoogleFonts.robotoMono(
                                      color: kCaptionColor,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                              .toList(),
                        )

                      ],
                    )),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: const SizedBox(height: 0),
                ),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 3 : 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1000),
                    child: Container(
                      color: kDangerColor,
                      child: Image.asset(
                        "assets/images/feyzad.jpeg",
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: constraints.maxWidth > 720.0 ? 1 : 0,
                  child: const SizedBox(height: 0,),
                ),
              ]));
    }));
  }
}
