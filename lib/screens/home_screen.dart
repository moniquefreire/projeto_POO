import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants.dart';
import '../widgets/info_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(40),
              width: double.infinity,
              color: kPrimaryColor.withOpacity(0.03),
              child: Wrap(
                runSpacing: 20,
                spacing: 20,
                children: <Widget>[
                  InfoCard(
                    title: "Leg Springs",
                    effectedNum: 400,
                    press: () {
                      Navigator.pushNamed(context, '/chart_screen');
                    },
                  ),
                  InfoCard(
                    title: "Arm Springs",
                    effectedNum: 200,
                    press: () {
                      Navigator.pushNamed(context, '/chart_screen');
                    },
                  ),
                  InfoCard(
                    title: "Pull Straps",
                    effectedNum: 350,
                    press: () {
                      Navigator.pushNamed(context, '/chart_screen');
                    },
                  ),
                  InfoCard(
                    title: "Footwork",
                    effectedNum: 75,
                    press: () {
                      Navigator.pushNamed(context, '/chart_screen');
                    },
                  ),
                  InfoCard(
                    title: "Short Box Series",
                    effectedNum: 20,
                    press: () {
                      Navigator.pushNamed(context, '/chart_screen');
                    },
                  ),
                  InfoCard(
                    title: "Knee Stretches",
                    effectedNum: 300,
                    press: () {
                      Navigator.pushNamed(context, '/chart_screen');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor.withOpacity(.03),
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset("assets/icons/menu.svg"),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hello, Physiotherapist!",
                style: GoogleFonts.quicksand(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: kTextGrey,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "See the petient´s performance on the pilates exercises",
                style: GoogleFonts.quicksand(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: kTextGrey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
