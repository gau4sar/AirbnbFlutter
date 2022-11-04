import 'package:airbnb_flutter/data/network/NetworkApiService.dart';
import 'package:airbnb_flutter/repository/AirbnbListingRpository.dart';
import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:airbnb_flutter/view_model/sharedViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/widget/CustomTabWidget.dart';
import 'ExplorePage.dart';

void main() {
  final sharedViewModel = SharedViewModel(
      AirbnbRepo: AirbnbListingRepository(apiService: NetworkApiService()));
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<SharedViewModel>.value(value: sharedViewModel),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ExplorePageWidget(),
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const ExplorePageWidget(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final sharedViewModel =
          Provider.of<SharedViewModel>(context, listen: false);

      sharedViewModel.getAirbnbListing(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = Provider.of<SharedViewModel>(context);

    return MaterialApp(
      theme: ThemeData(backgroundColor: Colors.white),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: ListView.builder(
          /*shrinkWrap: true,*/
          // Let the ListView know how many items it needs to build.
          itemCount: sharedViewModel.listOfSpaces?.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = sharedViewModel.listOfSpaces?[index];

            var s ="${item?.fields?.city} ${item?.fields?.country}";
            item?.fields?.price;

            //https://public.opendatasoft.com/explore/dataset/airbnb-listings/files/1333549eac1ff1f91b4443e0dc910c3a/download/

            //var s = "https://public.opendatasoft.com/explore/dataset/airbnb-listings/files/${item?.fields?.pictureUrl?.id}/download/";

            var st = item?.fields?.pictureUrl?.id;
            return Text(
                style:
                    const TextStyle(fontSize: 16, color: AppColors.blackColor),
                "City-> ${item?.fields?.city}  Property type-> ${item?.fields?.propertyType}");
          },
        ),
      ),
    );

    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body:
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            /*RoundButton(
              title: "Get list",
              */ /*isLoading: sharedViewModel.isGetAirbnbListingApiLoading,*/ /*
              onPress: () {
                sharedViewModel.getAirbnbListing(context);
              },
            ),*/
            ListView.builder(
              /*shrinkWrap: true,*/
              // Let the ListView know how many items it needs to build.
              itemCount: sharedViewModel.listOfSpaces?.length,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                final item = sharedViewModel.listOfSpaces?[index];

                return Text(
                    "City-> ${item?.fields?.city}  Property type-> ${item?.fields?.propertyType}");
              },
            )
          ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
