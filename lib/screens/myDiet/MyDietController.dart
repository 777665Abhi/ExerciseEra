import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';
import '../home/DietModel.dart';
import 'MyDietModel.dart';

class MyDietController extends GetxController
{
  Future<MyDietModel>? futureDietModel;
  MyDietModel? dietModel;
  final dio = Dio();
  var errorMsg = "".obs;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void onInit() {
    futureDietModel = dietPlansApiCall();
  }

  Future<MyDietModel> dietPlansApiCall() async {
    try {
      final SharedPreferences prefs = await _prefs;
      dio.interceptors.add(LoggingInterceptor());
      var url ="https://account.exerciseera.com/api/dietPlan/getPurchasedDietPlan";
      var token =await prefs!.get('token');
      var headers = {'Authorization': token};
      Response response = await dio.get(url ,  options: Options(
        headers: headers,
      ));
      if (response.statusCode == 200) {
        dietModel = MyDietModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        DioException.fromDioError(e);
        errorMsg.value = DioException.errorMessage!;
        errorMsg.value =
            DioException.handleStatusCode(e.response!.statusCode);
        toast(message: errorMsg.value);
      } else {
        toast(message: "Something went wrong");
      }
    }
    return dietModel!;
  }
}