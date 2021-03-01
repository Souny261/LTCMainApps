import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ltcmainapp/LtcEvent/Controller/EventModel.dart';
import 'package:ltcmainapp/LtcEvent/pages/EventDetailPage.dart';

class EventSlide extends StatefulWidget {
  List<EventModel> evenList;
  EventSlide({this.evenList});
  @override
  _EventSlideState createState() => _EventSlideState();
}

class _EventSlideState extends State<EventSlide> {
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.1,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            height: MediaQuery.of(context).size.height / 3,
          ),
          items: widget.evenList
              .map((item) => Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Stack(
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  EventDetailPage(item)));
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Stack(
                                        children: <Widget>[
                                          Column(
                                            children: <Widget>[
                                              Expanded(
                                                child: Container(
                                                  //height: MediaQuery.of(context).size.height / 2.8,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(10.0),
                                                      topRight:
                                                          Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: CachedNetworkImage(
                                                    imageUrl: item.eventBG,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Stack(
                                                      children: [
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            image:
                                                                DecorationImage(
                                                              image:
                                                                  imageProvider,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          bottom: 0,
                                                          right: 0,
                                                          left: 0,
                                                          child: ClipRect(
                                                            child:
                                                                BackdropFilter(
                                                              filter:
                                                                  new ImageFilter
                                                                          .blur(
                                                                      sigmaX:
                                                                          10.0,
                                                                      sigmaY:
                                                                          10.0),
                                                              child: Container(
                                                                height: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .height /
                                                                    7,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  vertical: 8.0,
                                                                  horizontal:
                                                                      16.0,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                        .white54),
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                      item.fmTitle,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          TextStyle(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            18,
                                                                        fontFamily:
                                                                            'NotoSansLaoUI-Regular',
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      height: 3,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                WidgetSpan(
                                                                                  child: Icon(
                                                                                    Icons.location_on,
                                                                                    color: Colors.red[800],
                                                                                    size: 18,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: item.fmAddress,
                                                                                  style: TextStyle(
                                                                                    fontStyle: FontStyle.italic,
                                                                                    fontSize: 15,
                                                                                    color: Colors.black,
                                                                                    fontFamily: 'NotoSansLaoUI-Regular',
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              RichText(
                                                                            textAlign:
                                                                                TextAlign.left,
                                                                            text:
                                                                                TextSpan(
                                                                              children: [
                                                                                WidgetSpan(
                                                                                  child: Icon(
                                                                                    Icons.timelapse_outlined,
                                                                                    color: Colors.red[800],
                                                                                    size: 18,
                                                                                  ),
                                                                                ),
                                                                                TextSpan(
                                                                                  text: "${item.depName}/${item.sectionName}",
                                                                                  style: TextStyle(
                                                                                    fontStyle: FontStyle.italic,
                                                                                    fontSize: 15,
                                                                                    color: Colors.black,
                                                                                    fontFamily: 'NotoSansLaoUI-Regular',
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                        ),
                                                      ],
                                                    ),
                                                    placeholder:
                                                        (context, url) =>
                                                            Image.asset(
                                                      "assets/r.gif",
                                                      height: 30.0,
                                                      width: 30.0,
                                                    ),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Positioned(
                                            top: 10,
                                            right: 9,
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Container(
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                        color: Colors.red[800],
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  5.0),
                                                        )),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      DateFormat("MMM").format(
                                                          DateTime.parse(
                                                        item.inDate,
                                                      )),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.0,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 45,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  5.0),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  5.0),
                                                        )),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Text(
                                                      DateFormat("dd").format(
                                                          DateTime.parse(
                                                        item.inDate,
                                                      )),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.red[800],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18.0,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      );
                    },
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.evenList.map((url) {
            int index = widget.evenList.indexOf(url);
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == index ? Colors.red[800] : Colors.red[100],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
