import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';
import '../dietPlan/DietPlanDetailModel.dart';

class MyDietDetailController extends GetxController {
  final dio = Dio();
  Future<DietPlanDetailModel>? futureDietDetailModel;
  DietPlanDetailModel? dietDetailModel;
  var courseDetailErrorMessage = ''.obs;
  dynamic argumentData = Get.arguments;

  var dietId = "";

  @override
  void onInit() {
    dietId = argumentData[0]['dietId'];
    futureDietDetailModel = getDietDetail(dietId);
    super.onInit();
  }

  Future<DietPlanDetailModel> getDietDetail(dietId) async {
    try {
      var url =
          'https://account.exerciseera.com/request/getDietPlanChartDetail/$dietId';
      dio.interceptors.add(LoggingInterceptor());

      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        if (response.data['success']=="true")
          dietDetailModel = DietPlanDetailModel.fromJson(response.data);
        else {
          toast(message: "${response.data['message']}");
          Get.back();
          // navigator!.pop();
        }
      }
    } catch (e) {
      if (e is DioError) {
        DioException.fromDioError(e);
        courseDetailErrorMessage.value = DioException.errorMessage!;
        courseDetailErrorMessage.value =
            DioException.handleStatusCode(e.response!.statusCode);
        toast(message: courseDetailErrorMessage.value);
      } else {
        toast(message: "Something went wrong");
      }
    }
    return dietDetailModel!;
  }
}
