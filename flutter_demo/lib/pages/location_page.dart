import 'package:flutter/material.dart';
import 'package:flutterdemo/controller/bg_container.dart';
import 'package:flutterdemo/controller/navigation.dart';
import 'package:flutterdemo/pages/info_widget.dart';
import 'package:geolocator/geolocator.dart';

class LocationPage extends StatefulWidget {
  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: '定位服务',
      ),
      body: BGContainer(
        child: SingleChildScrollView(
          child: FutureBuilder(
            // future: getLastKnownPosition(),
            builder: (context, snapshot) {
              List<Widget> children;

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  children = <Widget>[
                    Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: InfoWidget('Error', snapshot.error.toString()),
                    )
                  ];
                } else {
                  children = <Widget>[
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: InfoWidget(
                        'Last known position23:',
                        snapshot.data.toString(),
                      ),
                    ),
                  ];
                }
              } else {
                children = <Widget>[
                  SizedBox(
                    child: CircularProgressIndicator(),
                    width: 60,
                    height: 60,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  )
                ];
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: children,
              );
            },
          ),
        ),
      ),
    );
  }
}
