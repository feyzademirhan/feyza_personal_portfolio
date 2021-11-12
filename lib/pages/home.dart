import 'dart:async';

import 'package:feyportfolio/utils/constants.dart';
import 'package:feyportfolio/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'components/carousel.dart';
import 'components/about.dart';
import 'components/footer.dart';
import 'components/projects.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _headerGlobalKey = GlobalKey();
  final _aboutGlobalKey = GlobalKey();
  final _projectsGlobalKey = GlobalKey();
  final _contactGlobalKey = GlobalKey();

  final _scrollController = ScrollController();

  final _fabStream = StreamController<bool>();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _fabStream.sink.add(_scrollController.offset > 500);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      drawer: buildDrawer(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            flexibleSpace: Container(
              color: kBackgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 50, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Row(
                            children: [
                              MaterialButton(
                                onPressed: _scrollToAbout,
                                highlightColor: Colors.white60,
                                child: Text(
                                  "About Me",
                                  style: GoogleFonts.oswald(
                                    color: kCaptionColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                onPressed: _scrollToProjects,
                                highlightColor: Colors.white60,
                                child: Text(
                                  "Projects",
                                  style: GoogleFonts.oswald(
                                    color: kCaptionColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              MaterialButton(
                                onPressed: _scrollToContact,
                                color: kPrimaryColor,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                child: Text(
                                  "Contact Me",
                                  style: GoogleFonts.oswald(
                                    color: kCaptionColor,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ),
          ..._slivers(),
        ],
      ),
      floatingActionButton: _buildFab(),
    );
  }

  Drawer buildDrawer() {
    return Drawer(
        child: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: Column(
            children: [
              ListTile(
                onTap: _scrollToHome,
                title: Text(
                  "Home",
                  style:
                      GoogleFonts.oswald(color: kCaptionColor, fontSize: 16.0),
                ),
              ),
              ListTile(
                onTap: _scrollToAbout,
                title: Text(
                  "About",
                  style:
                      GoogleFonts.oswald(color: kCaptionColor, fontSize: 16.0),
                ),
              ),
              ListTile(
                onTap: _scrollToProjects,
                title: Text(
                  "Projects",
                  style:
                      GoogleFonts.oswald(color: kCaptionColor, fontSize: 16.0),
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: kCaptionColor),
              const SizedBox(height: 10),
              ListTile(
                onTap: _scrollToContact,
                title: Text(
                  "Contact",
                  style:
                      GoogleFonts.oswald(color: kCaptionColor, fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  List<Widget> _slivers() => [
        SliverToBoxAdapter(
          key: _headerGlobalKey,
          child: Carousel(),
        ),
        SliverToBoxAdapter(
          key: _aboutGlobalKey,
          child: About(),
        ),
        SliverToBoxAdapter(
          key: _projectsGlobalKey,
          child: Projects(),
        ),
        SliverToBoxAdapter(
          key: _contactGlobalKey,
          child: Footer(),
        ),
      ];
  Widget _buildFab() {
    return StreamBuilder<bool>(
      stream: _fabStream.stream,
      builder: (_, data) {
        final bool showFab = data.hasData && data.data!;
        return AnimatedOpacity(

          opacity: showFab ? 1 : 0,
          duration: const Duration(milliseconds: 500),
          child: FloatingActionButton(
            backgroundColor: kDangerColor,
            onPressed: showFab
                ? _scrollToHome
                : null, // make sure user cannot click when button hidden
            mini: true,
            child: const Icon(Icons.arrow_upward_rounded)
          ),
        );
      },
    );
  }

  void _scrollToHome() {
    Scrollable.ensureVisible(
      _headerGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToAbout() {
    Scrollable.ensureVisible(
      _aboutGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToProjects() {
    Scrollable.ensureVisible(
      _projectsGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  void _scrollToContact() {
    Scrollable.ensureVisible(
      _contactGlobalKey.currentContext!,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _fabStream.close();
    super.dispose();
  }
}
