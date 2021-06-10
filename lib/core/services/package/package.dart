import 'package:dio/dio.dart';

import '../../core_shelf.dart';

class PackageApiService {
  final String _endpoint = 'https://f682c61e0edc.ngrok.io/api/packages';
  final Dio _dio = Dio();

  Future<List<DonationPackage>> getPackages() async {
    var tempPackageList = <DonationPackage>[];
    try {
      var response = await _dio.get(_endpoint);
      var responseData = response.data['packages'];
      responseData.forEach(
          (package) => tempPackageList.add(DonationPackage.fromJson(package)));
      return tempPackageList;
    } on DioError catch (error, stacktrace) {
      print('Exception occured: $error stackTrace: $stacktrace');
      rethrow;
    }
  }
}
