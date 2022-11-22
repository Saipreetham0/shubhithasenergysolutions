import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shubhithasenergysolutions/scr/constants/colors.dart';
import 'package:shubhithasenergysolutions/scr/constants/sizes.dart';
import 'package:shubhithasenergysolutions/scr/constants/text_strings.dart';

class ClientDataUploadScreen extends StatefulWidget {
  const ClientDataUploadScreen({super.key});

  @override
  State<ClientDataUploadScreen> createState() => _ClientDataUploadScreenState();
}

class _ClientDataUploadScreenState extends State<ClientDataUploadScreen> {
  final _formKey = GlobalKey<FormState>();
  final _clientNameController = TextEditingController();
  final _clientEmailController = TextEditingController();
  final _clientPhoneNumber = TextEditingController();
  final _clientAddress = TextEditingController();
  final _clientNameOfSiteBuilding = TextEditingController();
  final _clientLiveLocation = TextEditingController();
  final _clientLivLatLong = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _clientNameController.dispose();
    _clientEmailController.dispose();
    _clientPhoneNumber.dispose();
    _clientAddress.dispose();
    _clientNameOfSiteBuilding.dispose();
    _clientLiveLocation.dispose();

    super.dispose();
  }

  final db = FirebaseFirestore.instance;

  String lat = '';
  String long = '';

  String location = 'Null, Press Button';
  String Address = 'searching.....';

  String Locations = '';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    // print(placemarks);

    Placemark place = placemarks[0];
    // Address =
    //     '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(() {
      Address =
          '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultSize - 10, vertical: tDefaultSize - 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Site Survey Report',
                  style: Theme.of(context).textTheme.headline2),
              const SizedBox(height: tDefaultSize - 10),
              TextFormField(
                controller: _clientNameController,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: tEmployeeFormFieldClient,
                  hintText: tEmployeeFormFieldClient,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return "Please enter client's name";
                  }
                  return null;
                },
              ),
              const SizedBox(height: tDefaultSize - 15),
              TextFormField(
                controller: _clientEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: tEmployeeFormFieldClientEmail,
                  hintText: tEmployeeFormFieldClientEmail,
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return "Please enter client's email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: tDefaultSize - 15),
              TextFormField(
                controller: _clientPhoneNumber,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: tEmployeeFormFieldClientPhone,
                  hintText: tEmployeeFormFieldClientPhone,
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 10 ||
                      value.length > 10) {
                    return "Please enter client's phone number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: tDefaultSize - 15),
              TextFormField(
                controller: _clientAddress,
                keyboardType: TextInputType.streetAddress,
                decoration: const InputDecoration(
                  labelText: tEmployeeFormFieldClientAddress,
                  hintText: tEmployeeFormFieldClientAddress,
                  prefixIcon: Icon(Icons.location_city),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter client's address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: tDefaultSize - 15),
              TextFormField(
                controller: _clientNameOfSiteBuilding,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: tEmployeeFormFieldClientNameOfBuilding,
                  hintText: tEmployeeFormFieldClientNameOfBuilding,
                  prefixIcon: Icon(Icons.business),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter client's name of building";
                  }
                  return null;
                },
              ),
              const SizedBox(height: tDefaultSize - 15),
              TextFormField(
                controller: _clientLiveLocation,
                keyboardType: TextInputType.streetAddress,
                decoration: InputDecoration(
                  labelText: tEmployeeFormFieldClientLiveLocation,
                  hintText: tEmployeeFormFieldClientLiveLocation,
                  prefixIcon: const Icon(Icons.location_on),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.my_location,
                      color: isDark
                          ? tPrimaryColor
                          : Theme.of(context).iconTheme.color,
                    ),
                    onPressed: () {
                      getLiveLocation();
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter client's live location";
                  }
                  return null;
                },
              ),
              const SizedBox(height: tDefaultSize - 15),

              const SizedBox(height: tDefaultSize - 15),
              TextFormField(
                enabled: false,
                controller: _clientLivLatLong,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: tEmployeeFormFieldLatitudeAndLongitude,
                  hintText: tEmployeeFormFieldLatitudeAndLongitude,
                  prefixIcon: Icon(Icons.gps_not_fixed_outlined),
                  // prefixIcon: Icon(Lin),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please Press the GPS button";
                  }
                  return null;
                },
              ),
              const SizedBox(height: tDefaultSize - 15),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // print('object');
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Processing Data')),
                      // );
                      uploadData();
                    }
                  },
                  child: const Text('Submit',
                      style: TextStyle(fontFamily: 'bookmanoldstyle')),
                ),
              ),
              // Text('${Address}')
            ],
          ),
        )),
      ),
    );
  }

  Future<void> getLiveLocation() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';

    // print('${position.latitude} , ${position.longitude}');
    GetAddressFromLatLong(position);

    setState(() {
      location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
      lat = '${position.latitude}';
      long = '${position.longitude}';

      _clientLivLatLong.text = '${lat} , ${long}';
      _clientLiveLocation.text = Address;
    });
  }

  uploadData() {
    // upload data to firebase

    db.collection('SiteSurveyReport').add({
      'Name': _clientNameController.text,
      'Email': _clientEmailController.text,
      'PhoneNumber': _clientPhoneNumber.text,
      'Address': _clientAddress.text,
      'NameOfSiteBuilding': _clientNameOfSiteBuilding.text,
      'LiveLocation': _clientLiveLocation.text,
      'LiveLocationLat': lat,
      'LiveLocationLong': long,
    }).then((value) => {
          // print('Data Added'),
          // SnackBar(content: Text('Processing Data')),
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Processing Data')),
          ),
          
          // Get.snackbar('Success', 'Data Added'),
          _clientNameController.clear(),
          _clientEmailController.clear(),
          _clientPhoneNumber.clear(),
          _clientAddress.clear(),
          _clientNameOfSiteBuilding.clear(),
          _clientLiveLocation.clear(),
          _clientLivLatLong.clear(),
        });
  }
}
