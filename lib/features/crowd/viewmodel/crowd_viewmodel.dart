import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../model/crowd_status.dart';
import '../repository/crowd_repository.dart';
import '../service/crowd_service.dart';

part 'crowd_viewmodel.g.dart';

@riverpod
CrowdService crowdService(CrowdServiceRef ref) => CrowdService();

@riverpod
CrowdRepository crowdRepository(CrowdRepositoryRef ref) =>
    CrowdRepository(ref.watch(crowdServiceProvider));

@riverpod
class CrowdViewModel extends _$CrowdViewModel {
  @override
  FutureOr<List<CrowdStatus>> build() async {
    return ref.watch(crowdRepositoryProvider).getCrowdIntelligence();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(crowdRepositoryProvider).getCrowdIntelligence(),
    );
  }
}
