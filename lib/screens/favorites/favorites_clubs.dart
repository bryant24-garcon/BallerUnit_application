import 'package:azul_football/api/clubs_api.dart';
import 'package:azul_football/localizations/localization_constants.dart';
import 'package:azul_football/widgets/trensations_widgets.dart';

import 'package:azul_football/widgets/widgets_clubs.dart';
import 'package:azul_football/widgets/widgets_user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class FavoritesClubsScreen extends StatefulWidget {
  final bool fromHome;

  FavoritesClubsScreen({this.fromHome = false});

  @override
  _FavoritesClubsScreenState createState() => _FavoritesClubsScreenState();
}

class _FavoritesClubsScreenState extends State<FavoritesClubsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ShakeTransition(
        duration: Duration(milliseconds: 1600),
        axis: Axis.vertical,
        child: CardBottomNavClubs(
          label: getTranslated(context, 'save'),
          onTap: () {
            //TODO : next
            if (widget.fromHome) {
              Get.back();
            } else {
              Get.offAndToNamed('/home');
            }
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShakeTransition(
                duration: Duration(milliseconds: 900),
                child: TileClubs(
                  title: getTranslated(context, 'popular_clubs'),
                  subTitle: getTranslated(context, 'popular_clubs_2'),
                ),
              ),
              ShakeTransition(
                duration: Duration(milliseconds: 1600),
                child: InputUser(
                  hint: getTranslated(context, 'search_club'),
                  hideHint: true,
                  icon: FontAwesomeIcons.search,
                ),
              ),
              Flexible(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 5,
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  children: [
                    for (int i = 0; i < ClubsApi.cListClubs.length; i++)
                      ShakeListTransition(
                        duration: Duration(milliseconds: (i + 5) * 200),
                        axis: Axis.vertical,
                        child: CardClubTeam(
                          image: ClubsApi.cListClubs[i].logo,
                          isSelected: ClubsApi.cListClubs[i].picked,
                          onTap: () {
                            setState(() {
                              ClubsApi.cListClubs[i].picked =
                                  !ClubsApi.cListClubs[i].picked;
                            });
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
