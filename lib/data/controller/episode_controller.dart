import 'package:get/get.dart';
import 'package:showbox/data/repo/episode_repo/episode_repo.dart';

class EpisodeController extends GetxController implements GetxService {
  EpisodeRepo repo;
  EpisodeController({required this.repo});
}
