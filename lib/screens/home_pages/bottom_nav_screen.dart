import 'package:azul_football/screens/home_pages/news.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';

import 'account.dart';
import 'events.dart';
import 'favorites.dart';

class BottomNavScreen extends StatefulWidget {
  final int indexPage;
  final Widget screen;
  BottomNavScreen({this.indexPage, this.screen});

  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen>
    with TickerProviderStateMixin {
  TabController _tabController;

  int _indexPage;
  List<Widget> _listPages = [
    NewsPage(),
    EventsPage(),
    FavoritesPage(),
    AccountPage(),
  ];

  _getPageInstant() {
    if (_indexPage == widget.indexPage) {
      return widget.screen != null
          ? widget.screen
          : _listPages[(_indexPage - 1)];
    } else {
      return _listPages[(_indexPage - 1)];
    }
  }

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);

    widget.indexPage != null ? _indexPage = widget.indexPage : _indexPage = 1;
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _getPageInstant(),
          ),
          Container(
            width: double.infinity,
            height: 55.0,
            decoration: BoxDecoration(
                //color: theme.primaryColorDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    theme.primaryColor,
                    theme.primaryColorDark,
                  ],
                )),
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: JumpingTabBar(
                controller: _tabController,
                onChangeTab: (int index) {
                  //  print(index);
                  setState(() {
                    _indexPage = index;
                  });
                },
                circleGradient: LinearGradient(
                  colors: [
                    theme.primaryColorDark,
                    theme.primaryColor,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
                selectedIndex: _indexPage,
                items: [
                  TabItemIcon(
                    buildWidget: (_, color) => TabBottomMain(
                      isSelected: _indexPage == 1,
                      icon: FontAwesomeIcons.home,
                    ),
                    startColor: theme.backgroundColor,
                    endColor: theme.backgroundColor,
                    curveColor: theme.backgroundColor,
                  ),
                  TabItemIcon(
                    buildWidget: (_, color) => TabBottomMain(
                      isSelected: _indexPage == 2,
                      icon: FontAwesomeIcons.futbol,
                    ),
                    startColor: theme.backgroundColor,
                    endColor: theme.backgroundColor,
                    curveColor: theme.backgroundColor,
                  ),
                  TabItemIcon(
                    buildWidget: (_, color) => TabBottomMain(
                      isSelected: _indexPage == 3,
                      icon: FontAwesomeIcons.heart,
                    ),
                    startColor: theme.backgroundColor,
                    endColor: theme.backgroundColor,
                    curveColor: theme.backgroundColor,
                  ),
                  TabItemIcon(
                    buildWidget: (_, color) => TabBottomMain(
                      isSelected: _indexPage == 4,
                      icon: FontAwesomeIcons.cog,
                    ),
                    startColor: theme.backgroundColor,
                    endColor: theme.backgroundColor,
                    curveColor: theme.backgroundColor,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBottomMain extends StatelessWidget {
  final bool isSelected;
  final IconData icon;

  TabBottomMain({this.isSelected = false, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: isSelected ? 15.0 : 0.0),
      child: Icon(
        icon,
        size: 20.0,
        color: Colors.white,
      ),
    );
  }
}
