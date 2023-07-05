import 'package:dio/dio.dart';
import 'package:exercise_era/constants/exports.dart';

import '../../common_widgets/widgets.dart';
import '../../network/dio/error_handling.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var createUserError;
  TextEditingController emailEditController = TextEditingController();
  TextEditingController centerEditController = TextEditingController();
  TextEditingController phoneEditController = TextEditingController();
  TextEditingController userFirstNameEditController = TextEditingController();
  TextEditingController userSecondNameEditController = TextEditingController();
  TextEditingController passwordEditController = TextEditingController();
  var showPasswordText = false.obs;
  var dio = Dio();
  var loginErrorMessage = "".obs;
  var cookieErrorMessage = "".obs;
  var isLoadingData = false.obs;
  bool checkboxValue = false;

  hideShowPassword() {
    showPasswordText.value = !showPasswordText.value;
    update();
  }

  void createUser() async {
    Response response;
    try {
      response = await dio
          .post("https://account.exerciseera.com/request/user/save", data: {
        "isBranchOffice": false,
        "userType": "c",
        "lastName": userSecondNameEditController.text,
        "password": passwordEditController.text,
        "emailid": emailEditController.text,
        "mobileNo": phoneEditController.text,
        "firstName": userFirstNameEditController.text
      });
      if (response.statusCode == 200) {
      }
    } catch (e) {
      if (e is DioError) {
        DioException.fromDioError(e);
        createUserError.value = DioException.errorMessage!;
        createUserError.value =
            DioException.handleStatusCode(e.response!.statusCode);
        toast(message: createUserError.value);
      } else {
        toast(message: "Something went wrong");
      }
    }
  }
}
