import 'package:feyportfolio/model/stats.dart';
import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/screen_helper.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

class Projects extends StatelessWidget {
  Projects({Key? key}) : super(key: key);
  final List<Stat> stats = [
    Stat(count: "0", text: "Clients"),
    Stat(count: "0", text: "Projects"),
    Stat(count: "0", text: "Awards"),
    Stat(count: "1-", text: "Years\nExperience"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ScreenHelper(
        desktop: _buildUi(kDesktopMaxWidth, context),
        tablet: _buildUi(kTabletMaxWidth, context),
        mobile: _buildUi(getMobileMaxWidth(context), context),
      ),
    );
  }

  Widget _buildUi(double width, BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 100,),
        ResponsiveWrapper(
          maxWidth: width,
          minWidth: width,
          defaultScale: false,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraint) {
              return Wrap(
                spacing: 20.0,
                runSpacing: 20.0,
                children: stats
                    .map(
                        (stat) {
                      return Container(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        width: ScreenHelper.isMobile(context)
                            ? constraint.maxWidth / 2.0 - 20
                            : (constraint.maxWidth / 4.0 - 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(stat.count, style: GoogleFonts.robotoMono(
                              fontWeight: FontWeight.w700,
                              fontSize: 32.0,
                              color: kCaptionColor,
                            ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              stat.text, style: GoogleFonts.robotoMono(fontSize: 16.0, color: kCaptionColor,),
                            )
                          ],
                        ),
                      );
                    }
                )
                    .toList(),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "2. MY PROJECTS",
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
        const SizedBox(height: 100),
      ],
    );
  }
}
