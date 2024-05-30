import 'package:dartz/dartz.dart';
import 'package:tree_view/features/common/domain/entities/asset_entity.dart';
import 'package:tree_view/features/common/domain/repositories/company_repository.dart';
import 'package:tree_view/shared/api/error_response.dart';

class ObterAssetsUsecase {
  final ICompanyRepository _repository;

  ObterAssetsUsecase({required ICompanyRepository repository})
      : _repository = repository;
  Future<Either<ErrorResponse, List<AssetsEntity>>> call(String companyId) =>
      _repository.obterAssets(companyId);
}
