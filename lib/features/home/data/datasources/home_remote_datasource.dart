import 'package:muta_test/core/data/datasources/core_local_data_source.dart';
import 'package:muta_test/core/services/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:muta_test/features/home/data/models/languages_model.dart';

abstract class HomeRemoteDatasource {
  Future<LanguagesModel> getAllLanguages();
}

@LazySingleton(as: HomeRemoteDatasource)
class HomeRemoteDatasourceImpl implements HomeRemoteDatasource {
  final ApiService apiService;
  final CoreLocalDataSource coreLocalDataSource;
  HomeRemoteDatasourceImpl({required this.apiService, required this.coreLocalDataSource});

  @override
  Future<LanguagesModel> getAllLanguages() async {
    final String accessToken = 'Bearer ${await coreLocalDataSource.getAccessToken()}';
    final LanguagesModel languagesModel = await apiService.getAllLanguages(token: accessToken);
    return languagesModel;
  }
}
