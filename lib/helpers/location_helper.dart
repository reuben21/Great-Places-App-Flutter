const GOOGLE_API_KEY = 'AIzaSyCjNf26c3QKWJbMAM1iFz1dJUpZp8Q7n0U';

class LocationHelper {
  static String generateLocationPreviewImage({double latitude,double longitude}) {
    return "https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:S%7C$latitude,$longitude&key=$GOOGLE_API_KEY";
  }
}