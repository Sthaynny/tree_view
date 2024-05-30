import 'package:dartz/dartz.dart';
import 'package:tree_view/features/common/domain/entities/company_entity.dart';
import 'package:tree_view/features/common/domain/repositories/company_repository.dart';
import 'package:tree_view/shared/api/error_response.dart';

class ObterComanhiasUsecase {
  final ICompanyRepository _repository;

  ObterComanhiasUsecase({required ICompanyRepository repository})
      : _repository = repository;
  Future<Either<ErrorResponse, List<CompanyEntity>>> call() =>
      _repository.obterCompanhias();
}
