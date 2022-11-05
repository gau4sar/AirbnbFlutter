import 'package:airbnb_flutter/data/network/NetworkApiService.dart';
import 'package:airbnb_flutter/repository/AirbnbListingRepository.dart';
import 'package:airbnb_flutter/screens/SearchPageWidget.dart';
import 'package:airbnb_flutter/screens/routes/RoutesName.dart';
import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:airbnb_flutter/view_model/sharedViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/widget/CustomTabWidget.dart';
import 'ExplorePage.dart';



main() async {
/*
  WidgetsFlutterBinding.ensureInitialized();
*/

  /*openStore().then((Store store) {
    final userViewModel = UserViewModel();
    final authViewModel = AuthViewModel(
      authRepo: AuthRepository(
          apiService: NetworkApiService(),
          userModelBox: store.box<UserModelDb>()),
    );

    runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<UserViewModel>.value(value: userViewModel),
          ChangeNotifierProvider<AuthViewModel>.value(value: authViewModel),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home:
          MyApp()
          ,
        )));
  });*/

  final sharedViewModel = SharedViewModel(
      airbnbRepo: AirbnbListingRepository(apiService: NetworkApiService()));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SharedViewModel>.value(value: sharedViewModel),
  ], child: MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home:
    MyApp()
    ,
  )));
}



/*
void main() {
  final sharedViewModel = SharedViewModel(
      AirbnbRepo: AirbnbListingRepository(apiService: NetworkApiService()));
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<SharedViewModel>.value(value: sharedViewModel),
  ], child: const MyApp()));
}
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MainScreen();
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<MainScreen> {
  bool hasBeenInitialized = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
/*
        home: const SplashScreen(),
*/
        initialRoute: RoutesName.explore,
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          RoutesName.explore: (context) => ExplorePageWidget(),
          RoutesName.search: (context) => SearchPageWidget(),
        });
  }
}