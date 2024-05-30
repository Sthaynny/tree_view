import 'package:dartz/dartz.dart';
import 'package:pop_network/pop_network.dart';
import 'package:tree_view/features/common/data/datasource/companhia_datasource.dart';
import 'package:tree_view/features/common/data/models/asset_model.dart';
import 'package:tree_view/features/common/data/models/company_model.dart';
import 'package:tree_view/features/common/data/models/location_model.dart';
import 'package:tree_view/features/common/domain/entities/asset_entity.dart';
import 'package:tree_view/features/common/domain/entities/company_entity.dart';
import 'package:tree_view/features/common/domain/entities/location_entity.dart';
import 'package:tree_view/features/common/domain/repositories/company_repository.dart';
import 'package:tree_view/shared/api/error_response.dart';

class CompanyRepository implements ICompanyRepository {
  final CompanyDatasource _datasource;

  CompanyRepository({required CompanyDatasource datasource})
      : _datasource = datasource;
  @override
  Future<Either<ErrorResponse, List<CompanyEntity>>> obterCompanhias() async {
    try {
      final result = await _datasource.obterCompanhias();
      if (result.isSuccessful) {
        return Right((result.data as List)
            .map((element) => CompanyModel.fromMap(element))
            .toList());
      } else {
        return Left(ErrorResponse.withMappedError(
          message: result.data,
          statusCode: result.statusCode,
        ));
      }
    } catch (e) {
      return Left(ErrorResponse.withMappedError());
    }
  }

  @override
  Future<Either<ErrorResponse, List<LocationEntity>>> obterLocalizacoes(
      String companyId) async {
    try {
      final result = await _datasource.obterLocalizacoes(companyId);
      if (result.isSuccessful) {
        return Right((result.data as List)
            .map((element) => LocationModel.fromMap(element))
            .toList());
      } else {
        return Left(ErrorResponse.withMappedError(
          message: result.data,
          statusCode: result.statusCode,
        ));
      }
    } catch (e) {
      return Left(ErrorResponse.withMappedError());
    }
  }

  @override
  Future<Either<ErrorResponse, List<AssetsEntity>>> obterAssets(
      String companyId) async {
    try {
      final result = await _datasource.obterAssets(companyId);
      if (result.isSuccessful) {
        return Right((result.data as List)
            .map((element) => AssetsModel.fromMap(element))
            .toList());
      } else {
        return Left(ErrorResponse.withMappedError(
          message: result.data,
          statusCode: result.statusCode,
        ));
      }
    } catch (e) {
      return Left(ErrorResponse.withMappedError());
    }
  }
}
