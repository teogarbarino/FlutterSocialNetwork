//  ======================================================================================================================
//      Page principale Ce fichier sert à la gestion du BottomNavigationBar en utilisant Provider
// ======================================================================================================================
// Flutter Imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:social667/controllers/provider/index_provider.dart';
import 'package:social667/utils/appBar.dart';
import 'package:social667/utils/dialog_boxes.dart';
import 'package:social667/views/feed_screen.dart'; // Pour exit l'application

class MainPage extends StatelessWidget {
  final List<Widget> screens = [const FeedScreen()];

  MainPage({super.key});

  //  ======================================================================================================================
  //                                                    VIEW SECTION
  //  ======================================================================================================================
  @override
  Widget build(BuildContext context) {
    // Récupérer l'index du screen provider
    final IndexProvider screenindexprovider =
        Provider.of<IndexProvider>(context);
    int currentScreenIndex = screenindexprovider.getScreenIndex;

    double widthScreen = MediaQuery.of(context).size.width;

    return WillPopScope(
        onWillPop: () async {
          // On demande à l'user s'il souhaite ou non quitter l'app
          var shouldPop = await showPopUp(
            "",
            "",
            "Oui",
            "Non",
            context,
            twoButtons: true,
          );
          if (shouldPop == true) {
            await SystemChannels.platform
                .invokeMethod<void>('SystemNavigator.pop', true);
            return true; // Pop Scope
          } else {
            return false; // Ne Pop Pas Le Scope
          }
        },
        child: Scaffold(
          // Définition appbar
          appBar: appBarAccount(widthScreen, context),
          // Def du BottomNavigationBar
          // drawer: const Menu(),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            showUnselectedLabels: true,
            currentIndex: currentScreenIndex,
            onTap: (value) => screenindexprovider.updateScreenIndex(value),
            // Liste des items du BottomNavigationBar
            items: [
              BottomNavigationBarItem(
                label: "onglet 1",
                icon: Icon((currentScreenIndex == 0)
                    ? Icons.percent
                    : Icons.percent_outlined),
              ),
              BottomNavigationBarItem(
                label: "onglet 2",
                icon: Icon((currentScreenIndex == 1)
                    ? Icons.store
                    : Icons.store_mall_directory_outlined),
              ),
              BottomNavigationBarItem(
                label: "onglet 3",
                icon: Icon((currentScreenIndex == 3)
                    ? Icons.emoji_events
                    : Icons.emoji_events_outlined),
              ),
            ],
          ),
          body: screens[currentScreenIndex],
        ));
  }
}
