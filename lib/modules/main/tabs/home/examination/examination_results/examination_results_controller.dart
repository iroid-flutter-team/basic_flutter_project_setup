import 'package:align_flutter_app/models/response/home/results/results_response.dart';
import 'package:get/get.dart';
import '../../../../../../api/api_repository.dart';
import '../../../../../../shared/constants/png_image_constant.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';
import 'model/examination_results_model.dart';


class ExaminationResultsController extends GetxController{
  final ApiRepository apiRepository;
  ExaminationResultsController({required this.apiRepository});

  var resultsResponse =  ResultsResponse().obs;
  var jobId = Get.arguments;

List<ExaminationResultsModel> examinationResultsModel = [
  ExaminationResultsModel(
      reactionImage: SvgImageConstants.average,
      image: PngImageConstants.windows,
      titleText: 'Windows',
      reactionText: 'Need attention',
  ),
  ExaminationResultsModel(
    reactionImage: SvgImageConstants.poor,
    image: PngImageConstants.doors,
    titleText: 'Doors',
    reactionText: 'Need repair it asap',
  ),
  ExaminationResultsModel(
    reactionImage: SvgImageConstants.very_poor,
    image: PngImageConstants.wall,
    titleText: 'Wall',
    reactionText: 'Very poor conditon',
  ),
  ExaminationResultsModel(
    reactionImage: SvgImageConstants.poor,
    image: PngImageConstants.celling,
    titleText: 'Celling',
    reactionText: 'Need repair it',
  ),
];

   getResults(int jobId) async{
     var res = await apiRepository.getResults(jobId);
      if(res != null){
        resultsResponse.value = res;
      }
      print("resultsResponse=========${resultsResponse.value.results?.length}");
      print("resultsResponseIMage=========${resultsResponse.value.results![1].images?[1].image.toString()}");
   }


 @override
  void onInit() {
    getResults(18);
    super.onInit();
  }
}