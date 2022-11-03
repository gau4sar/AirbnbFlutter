import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:airbnb_flutter/view_model/SharedViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../utils/custom_styles/CustomTextStyles.dart';
import '../utils/items/SpaceListBuilder.dart';
import '../utils/routes/RoutesName.dart';
import '../utils/widget/CustomProgressBar.dart';
import '../utils/widget/Spacer.dart';

class ExplorePageWidget extends StatefulWidget {
  const ExplorePageWidget({Key? key}) : super(key: key);

  @override
  _ExplorePageWidgetState createState() => _ExplorePageWidgetState();
}

class _ExplorePageWidgetState extends State<ExplorePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

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

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: InkWell(
                  onTap: () async {
                    /*gotoSearchPage();*/
                    Navigator.pushNamed(context, RoutesName.search);

                    /*context.pushNamed(
                      'SearchPage',
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.topToBottom,
                        ),
                      },
                    );*/
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(12, 12, 12, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 28,
                          ),
                          /*if (functions.isSearchValueEmpty(
                              FFAppState().searchQueryExplore))*/
                          if (true)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 16, 0, 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Where to?",
                                    style: CustomTextStyle.title3,
                                  ),
                                  CustomSpacer(height: 8),
                                  Text(
                                    "Anywhere · Any week · Add guests",
                                    style: CustomTextStyle.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          /*if (functions.isSearchValueEmpty(
                                  FFAppState().searchQueryExplore) ==
                              false)*/
                          if (false)
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  8, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextButton(
                                    child: const Text(
                                      "dynamic text",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                    onPressed: () async {
                                      gotoSearchPage();
                                    },
                                  )
                                ],
                              ),
                            ),
                          const Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(1, 0),
                              child: Icon(
                                Icons.filter_alt,
                                color: Colors.black,
                                size: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              /*if (functions.isSearchValueEmpty(FFAppState().searchQueryExplore))*/
              if (true)
                Expanded(
                  child: sharedViewModel.isGetAirbnbListingApiLoading
                      ? const CustomCircularProgressBar()
                      : Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: DefaultTabController(
                            length: 6,
                            initialIndex: 0,
                            child: Column(
                              children: const [
                                TabBar(
                                  isScrollable: true,
                                  labelColor: Colors.black,
                                  labelStyle: CustomTextStyle.normalBold
                                  /*FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                    )*/
                                  ,
                                  indicatorColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      text: 'Shared homes',
                                      icon: Icon(
                                        Icons.house_outlined,
                                        size: 32,
                                      ),
                                    ),
                                    Tab(
                                      text: 'Amazing pools',
                                      icon: Icon(
                                        Icons.pool,
                                        size: 32,
                                      ),
                                    ),
                                    Tab(
                                      text: 'OMG!',
                                      icon: Icon(
                                        Icons.reddit,
                                        size: 32,
                                      ),
                                    ),
                                    Tab(
                                      text: 'Design',
                                      icon:
                                          Icon(Icons.design_services, size: 32),
                                    ),
                                    Tab(
                                      text: 'Beach',
                                      icon: Icon(
                                        Icons.beach_access_outlined,
                                        size: 32,
                                      ),
                                    ),
                                    Tab(
                                      text: 'Camping',
                                      icon: Icon(
                                        Icons.campaign,
                                        size: 32,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: TabBarView(
                                    children: [
                                      SpaceListBuilder(),
                                      SpaceListBuilder(),
                                      SpaceListBuilder(),
                                      SpaceListBuilder(),
                                      SpaceListBuilder(),
                                      SpaceListBuilder(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              /*if (functions.isSpaceVisible('dont show1', 'dont show'))
                Expanded(
                  child: StreamBuilder<List<SpaceRecord>>(
                    stream: querySpaceRecord(
                      queryBuilder: (spaceRecord) =>
                          spaceRecord.where(
                              'country',
                              isEqualTo: FFAppState().searchQueryExplore),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme
                                  .of(context)
                                  .primaryColor,
                            ),
                          ),
                        );
                      }
                      List<SpaceRecord> filteredSpaceListViewSpaceRecordList =
                      snapshot.data!;
                      if (filteredSpaceListViewSpaceRecordList.isEmpty) {
                        return Center(
                          child: EmptySpaceComponentWidget(),
                        );
                      }
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: filteredSpaceListViewSpaceRecordList.length,
                        itemBuilder: (context, filteredSpaceListViewIndex) {
                          final filteredSpaceListViewSpaceRecord =
                          filteredSpaceListViewSpaceRecordList[
                          filteredSpaceListViewIndex];
                          return Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 16, 16, 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(16),
                                          child: Image.network(
                                            filteredSpaceListViewSpaceRecord
                                                .imageUrl!,
                                            width: double.infinity,
                                            height: MediaQuery
                                                .of(context)
                                                .size
                                                .height *
                                                0.4,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: AlignmentDirectional(1, -1),
                                        child: Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              4, 4, 4, 4),
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              final spaceUpdateData = {
                                                'fav':
                                                !filteredSpaceListViewSpaceRecord
                                                    .fav!,
                                              };
                                              await filteredSpaceListViewSpaceRecord
                                                  .reference
                                                  .update(spaceUpdateData);
                                            },
                                            value:
                                            filteredSpaceListViewSpaceRecord
                                                .fav!,
                                            onIcon: Icon(
                                              Icons.favorite,
                                              color: Color(0xFFFF0B0B),
                                              size: 25,
                                            ),
                                            offIcon: Icon(
                                              Icons.favorite_border,
                                              color: Colors.white,
                                              size: 25,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            context.pushNamed('SearchPage');
                                          },
                                          child: Text(
                                            filteredSpaceListViewSpaceRecord
                                                .location!,
                                            style: FlutterFlowTheme
                                                .of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 4, 0),
                                              child: Icon(
                                                Icons.star_rounded,
                                                color: Colors.black,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              filteredSpaceListViewSpaceRecord
                                                  .ratings!,
                                              style:
                                              FlutterFlowTheme
                                                  .of(context)
                                                  .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        if (functions.isDistanceAvailable(
                                            filteredSpaceListViewSpaceRecord
                                                .distance))
                                          Text(
                                            '${filteredSpaceListViewSpaceRecord
                                                .distance} kilometers away',
                                            style: GoogleFonts.getFont(
                                              'Open Sans',
                                              fontSize: 14,
                                            ),
                                          ),
                                        Text(
                                          filteredSpaceListViewSpaceRecord
                                              .availabilityDate!,
                                          style: GoogleFonts.getFont(
                                            'Open Sans',
                                            fontSize: 14,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0, 4, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Text(
                                                '\$${filteredSpaceListViewSpaceRecord
                                                    .price}',
                                                style:
                                                FlutterFlowTheme
                                                    .of(context)
                                                    .bodyText1,
                                              ),
                                              Text(
                                                ' night',
                                                style: GoogleFonts.getFont(
                                                  'Open Sans',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),*/
              if (false)
                /*if (functions
                  .isSearchValueEmpty(FFAppState().searchQueryExplore) ==
                  false)*/
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 16, 16),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      sharedViewModel.listOfSpaces?.length,
                                  itemBuilder: (context, listViewIndex) {
                                    var listViewSpaceRecord;

                                    listViewSpaceRecord = sharedViewModel
                                        .listOfSpaces?[listViewIndex];

                                    return Visibility(
                                      visible:
                                          true /*functions.isSpaceVisible(
                                              listViewSpaceRecord.category,
                                              'shared_homes')*/
                                      ,
                                      child: Align(
                                        alignment: AlignmentDirectional(0, 0),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 16, 16, 16),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Stack(
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      child: Image.network(
                                                        "https://public.opendatasoft.com/explore/dataset/airbnb-listings/files/${listViewSpaceRecord?.fields?.pictureUrl?.id}/download/",
                                                        width: double.infinity,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height *
                                                            0.4,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        const AlignmentDirectional(
                                                            1, -1),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                              4, 4, 4, 4),
                                                      child: const Icon(
                                                        Icons.favorite,
                                                        color:
                                                            Color(0xFFFF0B0B),
                                                        size: 25,
                                                      ), /*ToggleIcon(
                                                        onPressed:
                                                            () async {
                                                          final spaceUpdateData =
                                                          {
                                                            'fav':
                                                            !listViewSpaceRecord
                                                                .fav!,
                                                          };
                                                          await listViewSpaceRecord
                                                              .reference
                                                              .update(
                                                              spaceUpdateData);
                                                        },
                                                        value:
                                                        listViewSpaceRecord
                                                            .fav!,
                                                        onIcon: Icon(
                                                          Icons.favorite,
                                                          color: Color(
                                                              0xFFFF0B0B),
                                                          size: 25,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons
                                                              .favorite_border,
                                                          color:
                                                          Colors.white,
                                                          size: 25,
                                                        ),
                                                      ),*/
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 8, 0, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        /*context.pushNamed(
                                                            'SearchPage');*/
                                                      },
                                                      child: Text(
                                                        "${listViewSpaceRecord?.fields?.city} ${listViewSpaceRecord?.fields?.country}",
                                                        /*style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyText1,*/
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 4, 0),
                                                          child: Icon(
                                                            Icons.star_rounded,
                                                            color: Colors.black,
                                                            size: 20,
                                                          ),
                                                        ),
                                                        Text(
                                                          listViewSpaceRecord
                                                              .fields
                                                              ?.reviewScoresRating!,
                                                          /*style: FlutterFlowTheme
                                                              .of(context)
                                                              .bodyText1,*/
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    /*if (functions
                                                        .isDistanceAvailable(
                                                        listViewSpaceRecord
                                                            .distance))
                                                      Text(
                                                        '${listViewSpaceRecord
                                                            .distance} kilometers away',
                                                        style: GoogleFonts
                                                            .getFont(
                                                          'Open Sans',
                                                          fontSize: 14,
                                                        ),
                                                      ),*/
                                                    Text(
                                                      "Oct 25 - 28",
                                                      style:
                                                          GoogleFonts.getFont(
                                                        'Open Sans',
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 4, 0, 0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            '\$${listViewSpaceRecord.fields?.price}',
                                                            /*style: FlutterFlowTheme
                                                                .of(
                                                                context)
                                                                .bodyText1,*/
                                                          ),
                                                          Text(
                                                            ' night',
                                                            style: GoogleFonts
                                                                .getFont(
                                                              'Open Sans',
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 14,
                                                            ),
                                                          ),
                                                        ],
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
                                  },
                                ),
                              ),
                            ),
                          ],
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

  void gotoSearchPage() {
    Navigator.pushNamed(context, RoutesName.search);
  }
}
