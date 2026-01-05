import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tomisha_work_test/data/local/get_storage_helper.dart';

class HttpHelper {
  final Dio _dio;

  HttpHelper(this._dio) {
    _dio.interceptors.add(
      LogInterceptor(request: true, responseBody: true, requestBody: true),
    );
  }

  Dio get dio => _dio;

  static BaseOptions dioOptions = BaseOptions(
    headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      "charset": "utf-8",
      "Accept-Charset": "utf-8",
    },
    responseType: ResponseType.plain,
  );

  // static Future<void> openUrl(Uri url, {bool isNewTab = true}) async {
  //   if (!await launchUrl(
  //     url,
  //     webOnlyWindowName: isNewTab ? '_blank' : '_self',
  //   )) {
  //     print('Could not launch $url');
  //   }
  // }
}

String resolveUrl(String raw) {
  final base = Get.find<GetStorageHelper>().baseUrl;
  final src = raw.trim();
  if (src.isEmpty) return src;

  final uri = Uri.tryParse(src);
  // if it's an absolute URI with a scheme (http, https, data, file, etc.)
  if (uri != null && uri.hasScheme) return src;

  // protocol-relative URLs like //example.com -> treat as https
  if (src.startsWith('//')) return 'https:$src';

  // if it already starts with the base url, return as-is
  if (src.startsWith(base)) return src;

  // resolve relative path against base url (handles slashes correctly)
  final baseUri = Uri.tryParse(base) ?? Uri();
  return baseUri.resolve(src).toString();
}
