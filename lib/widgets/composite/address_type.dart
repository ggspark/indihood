import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:indihood/widgets/base_type.dart';
import 'package:url_launcher/url_launcher.dart';

///A widget to render the data with following schema
/// {
///    "type": "SCHEMA",
///    "lat": {
///      "type": "float",
///      "num": "1"
///    },
///    "lng": {
///      "type": "float",
///      "num": "1"
///    },
///    "address": {
///      "type": "string",
///      "num": "1"
///    }
///  }
class AddressType extends BaseType {
  ///Constructor to initialise the fields
  const AddressType(
    String title,
    Map<String, dynamic> schema,
    dynamic data, {
    Key key,
  }) : super(title, schema, data, key: key);

  @override
  Widget requiredSingle(BuildContext context, Map<String, Widget> widgetMap) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 12.0,
        ),
        _GoogleMapWidget(data["lat"], data["lng"]),
        SizedBox(
          width: 12.0,
        ),
        Flexible(
          child: Text(
            data["address"],
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(color: Colors.white),
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
      ],
    );
  }
}

class _GoogleMapWidget extends StatefulWidget {
  final LatLng center;

  _GoogleMapWidget(double lat, double lng, {Key key})
      : center = LatLng(lat, lng),
        super(key: key);

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<_GoogleMapWidget> {
  GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _launchURL,
      child: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFCED7DB),
            width: 0.5,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: IgnorePointer(
            child: GoogleMap(
              zoomControlsEnabled: false,
              zoomGesturesEnabled: false,
              scrollGesturesEnabled: false,
              rotateGesturesEnabled: false,
              mapToolbarEnabled: false,
              compassEnabled: false,
              tiltGesturesEnabled: false,
              trafficEnabled: false,
              myLocationButtonEnabled: false,
              myLocationEnabled: false,
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: widget.center,
                zoom: 13.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId(widget.center.toString()),
                  position: widget.center,
                )
              },
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    String url =
        'https://www.google.com/maps/search/?api=1&query=${widget.center.latitude},${widget.center.longitude}';
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
