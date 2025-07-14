import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Geolocation {
  static Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position position;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    } else {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
    }
    position = await Geolocator.getCurrentPosition();
    return position;
  }

  static Future<Position?> getLastKnownPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    Position? position;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    } else {
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
    }
    position = await Geolocator.getLastKnownPosition();
    return position;
  }

  static Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  static Future<LocationPermission> checkPermission() async {
    return await Geolocator.checkPermission();
  }

  static Future<LocationPermission> requestPermission() async {
    return await Geolocator.requestPermission();
  }

  static Future<bool> openAppSettings() async {
    return await Geolocator.openAppSettings();
  }

  static Future<bool> openLocationSettings() async {
    return await Geolocator.openLocationSettings();
  }

  static Future<Placemark> getPlacemark(Position position) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    return placemarks.first;
  }

  static Future<String> getAddress(Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.street.toString();
  }

  static Future<String> getCity(Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.locality.toString();
  }

  static Future<String> getCountry(Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.country.toString();
  }

  static Future<String> getPostalCode(Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.postalCode.toString();
  }

  static Future<String> getFullAddress(Position position) async {
    final placemark = await getPlacemark(position);
    return placemark.toString();
  }

  static Future<String> getFullAddressWithoutCountry(Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.toString().replaceAll(placemark.country.toString(), '');
  }

  static Future<String> getFullAddressWithoutPostalCode(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.toString().replaceAll(placemark.postalCode.toString(), '');
  }

  static Future<String> getFullAddressWithoutCity(Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.toString().replaceAll(placemark.locality.toString(), '');
  }

  static Future<String> getFullAddressWithoutStreet(Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark.toString().replaceAll(placemark.street.toString(), '');
  }

  static Future<String> getFullAddressWithoutCountryAndPostalCode(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.country.toString(), '')
        .replaceAll(placemark.postalCode.toString(), '');
  }

  static Future<String> getFullAddressWithoutCountryAndCity(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.country.toString(), '')
        .replaceAll(placemark.locality.toString(), '');
  }

  static Future<String> getFullAddressWithoutCountryAndStreet(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.country.toString(), '')
        .replaceAll(placemark.street.toString(), '');
  }

  static Future<String> getFullAddressWithoutPostalCodeAndCity(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.postalCode.toString(), '')
        .replaceAll(placemark.locality.toString(), '');
  }

  static Future<String> getFullAddressWithoutPostalCodeAndStreet(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.postalCode.toString(), '')
        .replaceAll(placemark.street.toString(), '');
  }

  static Future<String> getFullAddressWithoutCityAndStreet(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.locality.toString(), '')
        .replaceAll(placemark.street.toString(), '');
  }

  static Future<String> getFullAddressWithoutCountryAndPostalCodeAndCity(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.country.toString(), '')
        .replaceAll(placemark.postalCode.toString(), '')
        .replaceAll(placemark.locality.toString(), '');
  }

  static Future<String> getFullAddressWithoutCountryAndPostalCodeAndStreet(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.country.toString(), '')
        .replaceAll(placemark.postalCode.toString(), '')
        .replaceAll(placemark.street.toString(), '');
  }

  static Future<String> getCountryAndCity(
      double latitude, double longitude) async {
    final List<Placemark> placemark =
        await placemarkFromCoordinates(latitude, longitude);
    return '${placemark[0].country}, ${placemark[0].locality}';
  }

  static Future<String> getFullAddressWithoutCountryAndCityAndStreet(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.country.toString(), '')
        .replaceAll(placemark.locality.toString(), '')
        .replaceAll(placemark.street.toString(), '');
  }

  static Future<String> getFullAddressWithoutPostalCodeAndCityAndStreet(
      Position position) async {
    final Placemark placemark = await getPlacemark(position);
    return placemark
        .toString()
        .replaceAll(placemark.postalCode.toString(), '')
        .replaceAll(placemark.locality.toString(), '')
        .replaceAll(placemark.street.toString(), '');
  }
}
