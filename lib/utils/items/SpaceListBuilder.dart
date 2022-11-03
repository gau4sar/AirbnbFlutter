import 'package:airbnb_flutter/utils/custom_styles/CustomTextStyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../view_model/SharedViewModel.dart';

class SpaceListBuilder extends StatelessWidget {
  const SpaceListBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = Provider.of<SharedViewModel>(context);

    return ListView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: sharedViewModel.listOfSpaces?.length,
      itemBuilder: (context, listViewIndex) {
        var listViewSpaceRecord;

        listViewSpaceRecord = sharedViewModel.listOfSpaces?[listViewIndex];

        return Visibility(
          visible:
              true /*functions.isSpaceVisible(
                                              listViewSpaceRecord.category,
                                              'shared_homes')*/
          ,
          child: Align(
            alignment: const AlignmentDirectional(0, 0),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.network(
                            "https://public.opendatasoft.com/explore/dataset/airbnb-listings/files/${listViewSpaceRecord?.fields?.pictureUrl?.id}/download/",
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.4,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const Align(
                        alignment: AlignmentDirectional(1, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(4, 16, 16, 4),
                          child: Icon(
                            Icons.favorite,
                            color: Color(0xFFFF0B0B),
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
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            /*context.pushNamed(
                                                            'SearchPage');*/
                          },
                          child: Text(
                            style: CustomTextStyle.normalBold,
                            "${listViewSpaceRecord?.fields?.city} ${listViewSpaceRecord?.fields?.country}",
                            /*style: FlutterFlowTheme
                                                            .of(context)
                                                            .bodyText1,*/
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 4, 0),
                              child: Icon(
                                Icons.star_rounded,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                            Text(
                              style: CustomTextStyle.normalBold,
                              "${listViewSpaceRecord.fields?.reviewScoresRating}",
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
                    alignment: const AlignmentDirectional(-1, 0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          style: GoogleFonts.getFont(
                            'Open Sans',
                            fontSize: 14,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                style: CustomTextStyle.normalBold,
                                '\$${listViewSpaceRecord.fields?.price}',
                                /*style: FlutterFlowTheme
                                                                .of(
                                                                context)
                                                                .bodyText1,*/
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
          ),
        );
      },
    );
  }
}
