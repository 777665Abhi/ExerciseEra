import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../common_widgets/widgets.dart';
import '../../constants/exports.dart';
import '../courseScreen/CourseDataModel.dart';
import 'CourseDetailModel.dart';
import 'PlayCourseModel.dart';
import 'VideoDetailModel.dart';

class MyCourseDetailController extends GetxController {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final dio = Dio();
  PlayCourseModel? playCourseModel;
  Future<PlayCourseModel>? futureplayCourseModel;
  VideoDetailModel? videoDetailModel;
  Future<VideoDetailModel>? futureVideoDetailModel;
  CourseDetailModel? courseDetailModel;
  Future<CourseDetailModel>? futureCourseDetailModel;
  var errorMsg="".obs;
  //https://account.exerciseera.com/api/course/videos/playCourse/79795f55f6544b96b95f55f6542b96e0
  VideoPlayerController? videoPlayerController1;
  ChewieController? chewieController;
  int? bufferDelay;
  var courseId="";
  dynamic argumentData = Get.arguments;
  var checkCourseList=true;
  var checkCourseDetail=false;

  @override
  void onInit() {
    // courseId=argumentData[0]['courseId'];
    courseId='79795f55f6544b96b95f55f6542b96e0';
    futureplayCourseModel = getPlayCourse(courseId);
    futureCourseDetailModel =getCourseDetail(courseId);
    super.onInit();
  }

  Future<void> initializePlayer(videoUrl) async {
    videoPlayerController1 = VideoPlayerController.network(videoUrl);
    await Future.wait([
      videoPlayerController1!.initialize(),
    ]);
    _createChewieController();
  }

  void _createChewieController() {
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController1!,
      autoPlay: true,
      looping: false,
      progressIndicatorDelay:
      bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
    );
    update();
  }

  //Video list
  // I/flutter (19552): log:URI: https://account.exerciseera.com/api/course/videos/playCourse/73864cc4382e49ad864cc4382e29ad79
  Future<PlayCourseModel> getPlayCourse(courseId) async {
    try {
      final SharedPreferences prefs = await _prefs;
      dio.interceptors.add(LoggingInterceptor());
      var url = "https://account.exerciseera.com/api/course/videos/playCourse/$courseId";
      var token =await prefs!.get('token');

      // var token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2VtYWlsIjoicHJhYmhqb3QwMDA5MkBnbWFpbC5jb20iLCJ1c2VyX2ZuYW1lIjpudWxsLCJ1c2VyX25hbWUiOiJwcmFiaGpvdDAwMDkyQGdtYWlsLmNvbSIsImlzcyI6IkxvY2FsIiwidXNlcl9sbmFtZSI6bnVsbCwiY2xpZW50X2lkIjoiY2xpZW50LW1vYmlsZSIsInVzZXJfdXVpZCI6bnVsbCwidXNlcl9pZCI6NzQ1LCJ1c2VyX21vYmlsZSI6bnVsbCwic2NvcGUiOlsiYWxsIl0sInVzZXJfaGllcmFyY2h5IjpudWxsLCJleHAiOjE2OTE0OTE1MTcsImp0aSI6ImFjNDNjNGFmLWE5MGMtNDNkNS1iNzU2LTQwMmQ5OTkxNTJiNyJ9.00qV-s4ysG3KcnoerzxgRe5qzF-mMl8_FtD1ED8QJ_I";
      var headers = {'Authorization': token};
      Response response = await dio.get(url,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        playCourseModel = PlayCourseModel.fromJson(response.data);
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
    return playCourseModel!;
  }

  //Course Detail
  // https://account.exerciseera.com/request/getCourseDetail/79795f55f6544b96b95f55f6542b96e0
  Future<CourseDetailModel> getCourseDetail(courseId) async {
    try {
      final SharedPreferences prefs = await _prefs;
      var url =
          'https://account.exerciseera.com/request/getCourseDetail/$courseId';
      // "https://account.exerciseera.com/request/getCourseDetail/79795f55f6544b96b95f55f6542b96e0";

      var token =await prefs!.get('token');

      // var token ="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2VtYWlsIjoicHJhYmhqb3QwMDA5MkBnbWFpbC5jb20iLCJ1c2VyX2ZuYW1lIjpudWxsLCJ1c2VyX25hbWUiOiJwcmFiaGpvdDAwMDkyQGdtYWlsLmNvbSIsImlzcyI6IkxvY2FsIiwidXNlcl9sbmFtZSI6bnVsbCwiY2xpZW50X2lkIjoiY2xpZW50LW1vYmlsZSIsInVzZXJfdXVpZCI6bnVsbCwidXNlcl9pZCI6NzQ1LCJ1c2VyX21vYmlsZSI6bnVsbCwic2NvcGUiOlsiYWxsIl0sInVzZXJfaGllcmFyY2h5IjpudWxsLCJleHAiOjE2OTE0OTE1MTcsImp0aSI6ImFjNDNjNGFmLWE5MGMtNDNkNS1iNzU2LTQwMmQ5OTkxNTJiNyJ9.00qV-s4ysG3KcnoerzxgRe5qzF-mMl8_FtD1ED8QJ_I";
      var headers = {'Authorization': token};
      Response response = await dio.get(url,
          options: Options(
            headers: headers,
          ));

      if (response.statusCode == 200) {
        courseDetailModel = CourseDetailModel.fromJson(response.data);
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
    return courseDetailModel!;
  }

  //PLay video url
  //https://account.exerciseera.com/api/course/videos/getVideoDetail/84be2b949d894b9dbe2b949d897b9d5a
 getVideoUrl(videoId) async {
    try {
      var videoUrl="";
      final SharedPreferences prefs = await _prefs;
      dio.interceptors.add(LoggingInterceptor());
      var url = "https://account.exerciseera.com/api/course/videos/getVideoDetail/$videoId";
      var token =await prefs!.get('token');
      var headers = {'Authorization': token};
      Response response = await dio.get(url,
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        videoDetailModel = VideoDetailModel.fromJson(response.data);
        videoUrl=videoDetailModel!.dataOB!.videoUrl!;
        initializePlayer(videoUrl);
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
    return videoDetailModel!;
  }

  @override
  void dispose() {
    videoPlayerController1!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

}
