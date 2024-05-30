import 'package:dartz/dartz.dart';
import 'package:tree_view/features/common/domain/entities/location_entity.dart';
import 'package:tree_view/features/common/domain/repositories/company_repository.dart';
import 'package:tree_view/shared/api/error_response.dart';

class ObterLocalizacoesUsecase {
  final ICompanyRepository _repository;

  ObterLocalizacoesUsecase({required ICompanyRepository repository})
      : _repository = repository;
  Future<Either<ErrorResponse, List<LocationEntity>>> call(String companyId) =>
      _repository.obterLocalizacoes(companyId);
}
