import 'package:dartz/dartz.dart';
import 'package:tree_view/features/common/domain/entities/asset_entity.dart';
import 'package:tree_view/features/common/domain/entities/company_entity.dart';
import 'package:tree_view/features/common/domain/entities/location_entity.dart';
import 'package:tree_view/shared/api/error_response.dart';

abstract class ICompanyRepository {
  Future<Either<ErrorResponse, List<CompanyEntity>>> obterCompanhias();
  Future<Either<ErrorResponse, List<LocationEntity>>> obterLocalizacoes(
      String companyId);
  Future<Either<ErrorResponse, List<AssetsEntity>>> obterAssets(
      String companyId);
}
