import 'package:dio/dio.dart';
import '../../common_widgets/SharedPrefConstant.dart';
import '../../common_widgets/utilities.dart';
import '../../constants/exports.dart';


class HttpsService{



     var   headers = {
     'Authorization': 'Bearer ${localStorage.read(SharedPrefConstant().token)}'
     };

}