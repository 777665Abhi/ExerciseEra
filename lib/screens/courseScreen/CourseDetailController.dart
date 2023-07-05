import 'package:chewie/chewie.dart';
import 'package:dio/dio.dart';
import 'package:exercise_era/screens/courseScreen/CourseDataModel.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/exports.dart';
import '../../common_widgets/widgets.dart';
import '../../network/dio/error_handling.dart';
import '../../network/dio/interceptors.dart';
import 'CourseVideoDetailModel.dart';

class CourseDetailController extends GetxController {
  VideoPlayerController? videoPlayerController1;
  ChewieController? chewieController;

  final dio = Dio();
  CourseDataModel? courseDetailModel;
  Future<CourseDataModel>? futureCourseDetailModel;
  var courseDetailErrorMessage = ''.obs;

  CourseVideoDetailModel? courseVideoModel;
  Future<CourseVideoDetailModel>? futureCourseVideoModel;
  var courseVideoErrorMessage = ''.obs;
  int? bufferDelay;
  dynamic argumentData = Get.arguments;

  var courseId="";
  @override
  void onInit() {
    courseId=argumentData[0]['courseId'];
    futureCourseDetailModel = getCourseDetail(courseId);
    super.onInit();
  }

  Future<void> initializePlayer(videoUrl) async {
    videoPlayerController1 = VideoPlayerController.network(videoUrl);
    await Future.wait([
      videoPlayerController1!.initialize(),
    ]);
    update();
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

  Future<CourseDataModel> getCourseDetail(courseId) async {
    try {
      var url =
          'https://account.exerciseera.com/request/getVideoCourseDetailById/$courseId';
          // 'https://account.exerciseera.com/request/getVideoCourseDetailById/97d805935c124f219805935c125f21d6';
      dio.interceptors.add(LoggingInterceptor());

      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        courseDetailModel = CourseDataModel.fromJson(response.data);
        initializePlayer(courseDetailModel?.dataOB?.courseDetail?.videoUrl);
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
    return courseDetailModel!;
  }

// https://account.exerciseera.com/request/getMyCourseVideosById/97d805935c124f219805935c125f21d6

  Future<CourseVideoDetailModel> getMyCourseVideosById() async {
    try {
      var url =
          'https://account.exerciseera.com/request/getMyCourseVideosById/97d805935c124f219805935c125f21d6';
      dio.interceptors.add(LoggingInterceptor());

      Response response = await dio.get(url);
      if (response.statusCode == 200) {
        courseVideoModel = CourseVideoDetailModel.fromJson(response.data);
      }
    } catch (e) {
      if (e is DioError) {
        DioException.fromDioError(e);
        courseVideoErrorMessage.value = DioException.errorMessage!;
        courseVideoErrorMessage.value =
            DioException.handleStatusCode(e.response!.statusCode);
        toast(message: courseVideoErrorMessage.value);
      } else {
        toast(message: "Something went wrong");
      }
    }
    return courseVideoModel!;
  }
}
