import 'dart:io' show HttpClient, HttpHeaders;

enum NetworkFileType { imageJpg, imagePng, pdf, plainText, svg, unknown }

NetworkFileType networkFileTypeFrom(List<String> header) {
  try {
    final pattern = header.first.split(';').first;
    switch (pattern) {
      case 'image/jpeg':
        return NetworkFileType.imageJpg;
      case 'image/png':
        return NetworkFileType.imagePng;
      case 'application/pdf':
        return NetworkFileType.pdf;
      case 'text/plain':
        return NetworkFileType.plainText;
      case 'image/svg+xml':
        return NetworkFileType.svg;
      default:
        return NetworkFileType.unknown;
    }
  } on StateError catch (_) {
    return NetworkFileType.unknown;
  }
}

Future<NetworkFileType> typeOf(Uri url) => HttpClient()
    .headUrl(url)
    .then((response) => response.close())
    .then((response) => networkFileTypeFrom(
        response.headers[HttpHeaders.contentTypeHeader] ?? []));


void testUrlType()
{
  print( typeOf(Uri.https('bit.ly', '/3dAtFwy')));
   print( typeOf(Uri.https('bit.ly', '/3qL3msT')));

}