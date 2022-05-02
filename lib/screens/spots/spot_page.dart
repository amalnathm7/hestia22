import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:hestia22/main.dart';
import 'package:map_launcher/map_launcher.dart';

class SpotPage extends StatefulWidget {
  const SpotPage({Key? key, required this.data}) : super(key: key);
  final Map data;

  @override
  _SpotPageState createState() => _SpotPageState();
}

class _SpotPageState extends State<SpotPage> {
  double _opacity = 0;
  EdgeInsets _padding1 = EdgeInsets.zero;
  EdgeInsets _padding2 = EdgeInsets.zero;
  EdgeInsets _padding3 = EdgeInsets.zero;
  List<Map> data1 = [
    {
      'name': 'Almanac',
      'category': 'Quiz',
      'datetime': DateTime.now(),
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
    },
    {
      'name': 'Web Crawler',
      'category': 'Competition',
      'datetime': DateTime.now(),
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
    },
    {
      'name': 'NFT and BlockChain',
      'category': 'Workshop',
      'datetime': DateTime.now(),
      'description':
          'Loo ooo oooo ooo oooooo ooooooo ong description goes here',
    },
  ];

  Future<void> _goToCoordinates(Coords coordinates, String title) async {
    if ((await MapLauncher.isMapAvailable(MapType.google))!) {
      await MapLauncher.showMarker(
        mapType: MapType.google,
        coords: coordinates,
        title: title,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 200), () {
      setState(() {
        _opacity = 1;
        _padding1 = EdgeInsets.only(
          left: 20,
          right: 20,
        );
        _padding2 = EdgeInsets.only(
          left: 5,
          right: 5,
        );
        _padding3 = EdgeInsets.only(
          top: 20,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _opacity = 0;
          _padding1 = EdgeInsets.zero;
          _padding2 = EdgeInsets.zero;
          _padding3 = EdgeInsets.zero;
        });
        await Future.delayed(Duration(milliseconds: 300));
        return await true;
      },
      child: Material(
        color: Constants.color1,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Hero(
                    tag: widget.data['name'],
                    child: Image.network(
                      widget.data['image'],
                      height: 300,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      color: Constants.color3,
                      colorBlendMode: BlendMode.overlay,
                    ),
                  ),
                  Positioned(
                    right: 30,
                    top: 80,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    colors: [
                                      Constants.color1.withOpacity(.4),
                                      Constants.color1.withOpacity(.8),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                ),
                                child: BackButton(
                                  color: Constants.color2.withOpacity(.5),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    colors: [
                                      Constants.color1.withOpacity(.4),
                                      Constants.color1.withOpacity(.8),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Constants.color2.withOpacity(.5),
                                  ),
                                  onPressed: () async {
                                    await _goToCoordinates(
                                        widget.data['coordinates'],
                                        widget.data['name']);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Constants.color1,
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.color1.withOpacity(.8),
                                    Constants.color1.withOpacity(.4),
                                  ],
                                  begin: AlignmentDirectional.topStart,
                                  end: AlignmentDirectional.bottomEnd,
                                ),
                              ),
                              child: AnimatedOpacity(
                                opacity: _opacity,
                                duration: Duration(milliseconds: 500),
                                child: AnimatedPadding(
                                  padding: _padding1,
                                  duration: Duration(milliseconds: 500),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        widget.data['name'],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            color: Constants.color2
                                                .withOpacity(.75)),
                                      ),
                                      Text(
                                        widget.data['caption'],
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: Constants.color2
                                                .withOpacity(.5)),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        widget.data['description'],
                                        style: TextStyle(
                                            overflow: TextOverflow.clip,
                                            fontSize: 14,
                                            color: Constants.color2
                                                .withOpacity(.25)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 1,
                  ),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        height: 400,
                        width: 270,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          gradient: LinearGradient(
                            colors: [
                              Constants.color3.withOpacity(.4),
                              Constants.color3.withOpacity(.8),
                            ],
                            begin: AlignmentDirectional.topStart,
                            end: AlignmentDirectional.bottomEnd,
                          ),
                        ),
                        child: ListView.builder(
                          itemCount: data1.length,
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => AnimatedOpacity(
                            opacity: _opacity,
                            duration: Duration(milliseconds: 500),
                            child: AnimatedPadding(
                              duration: Duration(milliseconds: 500),
                              padding: _padding2,
                              child: ListTile(
                                title: Text(
                                  data1[index]['name'],
                                  style: TextStyle(
                                    color: Constants.color2,
                                  ),
                                ),
                                subtitle: Text(
                                  data1[index]['category'],
                                  style: TextStyle(
                                    color: Constants.color2.withOpacity(.5),
                                  ),
                                ),
                                trailing: Text(
                                  DateFormat.MMMMEEEEd()
                                      .format((data1[index]['datetime'])),
                                  style: TextStyle(
                                    color: Constants.color2.withOpacity(.25),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AnimatedPadding(
                    padding: _padding3,
                    duration: Duration(milliseconds: 500),
                    child: AnimatedOpacity(
                      opacity: _opacity,
                      duration: Duration(milliseconds: 500),
                      child: Container(
                        height: 400,
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "Events held at " + widget.data['name'],
                            style: TextStyle(
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
