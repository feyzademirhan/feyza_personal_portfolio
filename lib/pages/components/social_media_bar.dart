import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/url_helper.dart';
import 'package:flutter/material.dart';

class SocialMediaBar extends StatelessWidget {
  const SocialMediaBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      margin: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
        border: Border.all(color:kPrimaryColor.withOpacity(0.3), width: 1.4),
        borderRadius: const BorderRadius.all(Radius.circular(35)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              UrlHelper.launchUrl('https://github.com/feyzademirhan');
            },
            child: ImageIcon(
              const AssetImage("assets/icons/github.png"),
              color: kPrimaryColor.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              UrlHelper.launchUrl(
                'https://www.linkedin.com/in/FeyzaDemirhan/',
              );
            },
            child: ImageIcon(
              const AssetImage("assets/icons/linkedin.png"),
              color: kPrimaryColor.withOpacity(0.75),
            ),
          ),
          const SizedBox(height: 15),
          InkWell(
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              UrlHelper.launchUrl(
                "mailto:feyzadhan@gmail.com?subject=Hello%20Feyza",
              );
            },
            child: ImageIcon(
              const AssetImage("assets/icons/mail.png"),
              color: kPrimaryColor.withOpacity(0.75),
            ),
          ),
        ],
      ),
    );
  }
}