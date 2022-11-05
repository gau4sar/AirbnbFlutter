import 'package:airbnb_flutter/screens/routes/RoutesName.dart';
import 'package:airbnb_flutter/utils/Colors.dart';
import 'package:airbnb_flutter/utils/utils.dart';
import 'package:airbnb_flutter/utils/widget/CustomTabWidget.dart';
import 'package:airbnb_flutter/view_model/sharedViewModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../utils/Constant.dart';
import '../utils/components/CustomTextButton.dart';
import '../utils/custom_styles/CustomTextStyles.dart';
import '../utils/items/SpaceListBuilder.dart';
import '../utils/widget/ButtonWidgets.dart';
import '../utils/widget/CustomProgressBar.dart';
import '../utils/widget/Spacer.dart';
import '../utils/custom_styles/CustomTextStyles.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({Key? key}) : super(key: key);

  @override
  _SearchPageWidgetState createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  String? searchTextFieldLatestSelectedOption;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  Widget build(BuildContext context) {
    final sharedViewModel = Provider.of<SharedViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.primaryBackgroundColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(-1, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 0, 12),
                  child: InkWell(
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE7E7E7),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Color(0x33000000),
                            offset: Offset(0, 2),
                          )
                        ],
                        shape: BoxShape.circle,
                      ),
                      child: const Align(
                        alignment: AlignmentDirectional(-1, -1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                child: Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 0, 8),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: const SelectionArea(
                                  child: Text(
                                'Where to?',
                                style: CustomTextStyle.title2,
                              )),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Color(0xFF4C575A),
                                  ),
                                ),
                                child: Align(
                                  alignment:
                                      const AlignmentDirectional(0.15, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            8, 0, 8, 0),
                                    child: Stack(
                                      children: [
                                        Autocomplete<String>(
                                          initialValue:
                                              const TextEditingValue(text: ""),
                                          optionsBuilder: (textEditingValue) {
                                            if (textEditingValue.text == '') {
                                              return const Iterable<
                                                  String>.empty();
                                            }

                                            return sharedViewModel
                                                .getListOfFilteredCountry(
                                                    textEditingValue.text);
                                          },
                                          optionsViewBuilder:
                                              (context, onSelected, options) {
                                            return Align(
                                              alignment: Alignment.topLeft,
                                              child: Material(
                                                child: Container(
                                                  width: 300,
                                                  color: AppColors.whiteColor,
                                                  child: ListView.builder(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10.0),
                                                    itemCount: options.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index) {
                                                      final String option =
                                                          options
                                                              .elementAt(index);

                                                      return GestureDetector(
                                                        onTap: () {
                                                          onSelected(option);
                                                        },
                                                        child: ListTile(
                                                            title: Text(
                                                          option,
                                                          style: CustomTextStyle
                                                              .normal,
                                                        )),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          onSelected: (String selection) {
                                            setState(() {
                                              sharedViewModel
                                                      .latestSearchQuery =
                                                  selection;

                                              searchTextFieldLatestSelectedOption =
                                                  selection;
                                            });
                                            FocusScope.of(context).unfocus();
                                          },
                                          fieldViewBuilder: (
                                            context,
                                            textEditingController,
                                            focusNode,
                                            onEditingComplete,
                                          ) {
                                            sharedViewModel
                                                    .searchTextFieldLatestController =
                                                textEditingController;
                                            return TextFormField(
                                              controller: textEditingController,
                                              focusNode: focusNode,
                                              onEditingComplete:
                                                  onEditingComplete,
                                              onChanged: (value) => {
                                                sharedViewModel
                                                    .latestSearchQuery = value
                                              }
                                              /*EasyDebounce.debounce(
                                                'searchTextFieldLatestController',
                                                Duration(milliseconds: 2000),
                                                () async {
                                                  setState(() => FFAppState()
                                                          .searchQueryExplore =
                                                      searchTextFieldLatestController!
                                                          .text);
                                                  setState(() => FFAppState()
                                                          .selectedDestination =
                                                      searchTextFieldLatestController!
                                                          .text);
                                                },
                                              )*/
                                              ,
                                              autofocus: true,
                                              obscureText: false,
                                              decoration: const InputDecoration(
                                                hintText: 'Search destinations',
                                                hintStyle:
                                                    CustomTextStyle.normal,
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                errorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedErrorBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                prefixIcon: Icon(
                                                  Icons.search,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              style: CustomTextStyle.normal,
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: const BoxDecoration(
                                color: AppColors.whiteColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 0),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.horizontal,
                                  itemCount:
                                      sharedViewModel.listOfCountry.length,
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewDestinationsRecord =
                                        sharedViewModel
                                            .listOfCountry[listViewIndex]
                                            .toString();
                                    return Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              8, 0, 8, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          sharedViewModel.selectedCountry =
                                              listViewDestinationsRecord;

                                          if (listViewDestinationsRecord ==
                                              Constant.I_M_FLEXIBLE) {
                                            sharedViewModel.latestSearchQuery =
                                                "";
                                          } else {
                                            sharedViewModel.latestSearchQuery =
                                                listViewDestinationsRecord;
                                          }

                                          setState(() {});
                                        },
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.36,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.26,
                                          decoration: const BoxDecoration(
                                            color: AppColors.whiteColor,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  if (true)
                                                    Expanded(
                                                      child: Container(
                                                        width: 120,
                                                        height: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: sharedViewModel
                                                                .getBorderColor(
                                                                    listViewDestinationsRecord),
                                                            width: sharedViewModel
                                                                .getBorderWidth(
                                                                    listViewDestinationsRecord),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  2, 2, 2, 2),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Image.asset(
                                                              Utils().getCountryImage(
                                                                  listViewDestinationsRecord),
                                                              width: 120,
                                                              height: 120,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (false)
                                                    Expanded(
                                                      child: Container(
                                                        width: 120,
                                                        height: 120,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AppColors
                                                              .primaryText,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          border: Border.all(
                                                            color: Color(
                                                                0xFF070707),
                                                            width: 0,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      2, 2, 2),
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8),
                                                            child: Image.asset(
                                                              "listViewDestinationsRecord.image!",
                                                              width: 120,
                                                              height: 120,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                ],
                                              ),
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(-1, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 8, 0, 0),
                                                  child: SelectionArea(
                                                      child: Text(
                                                    listViewDestinationsRecord,
                                                    style:
                                                        CustomTextStyle.normal,
                                                  )),
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
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 1),
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                            child: CustomTextButton(
                              onPress: () async {
                                sharedViewModel.clearAllValues();
                                Navigator.pop(context);
                              },
                              title: 'Clear all',
                              isLoading: false,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 16, 0),
                            child: CustomPrimaryButton(
                                onPress: () {
                                  Navigator.pop(context);
                                },
                                /*onPress: () async {
                                */ /*setState(
                                    () => FFAppState().searchQueryExplore = '');
                                context.pop();*/ /*
                              },*/
                                name: 'Search'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
