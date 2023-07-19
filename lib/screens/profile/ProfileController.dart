import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';
import 'ProfileModel.dart';

class ProfileController extends GetxController {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final formKey = GlobalKey<FormState>();
  final dio = Dio();
  ProfileModel? profileModel;
  Future<ProfileModel>? futureProfileModel;
  var errorMsg = ''.obs;
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var mobileController = TextEditingController();
  var emailController = TextEditingController();
  var accController = TextEditingController();

  @override
  void onInit() {
    futureProfileModel = getProfile();
    super.onInit();
  }
  // https://account.exerciseera.com/api/candidate/profile
  Future<ProfileModel> getProfile() async {
    try {
      final SharedPreferences prefs = await _prefs;

      var url ='https://account.exerciseera.com/api/candidate/profile';
      var token =await prefs!.get('token');

      var headers = {'Authorization': token};
      dio.interceptors.add(LoggingInterceptor());

      Response response = await dio.get(url, options: Options(
        headers: headers,
      ));
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data);
        setProfileData();

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
    return profileModel!;
  }

  setProfileData()
  {
    firstNameController.text=profileModel!.data![0]!.name;
    lastNameController.text=profileModel!.data![0]!.lastName;
    mobileController.text=profileModel!.data![0]!.mobile.toString();
    emailController.text=profileModel!.data![0]!.email;
    accController.text=profileModel!.data![0]!.accountNo;
  }

}