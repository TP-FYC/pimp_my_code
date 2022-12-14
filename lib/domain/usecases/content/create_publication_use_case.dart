import 'package:dartz/dartz.dart';
import '../../../core/failure.dart';
import '../../repositories/content_repository.dart';
import '../../../infrastructure/converter/content_mapper.dart';

import '../../../core/usecase.dart';
import '../../../ioc_container.dart';

class CreatePublicationUseCase extends UseCase<Unit, CreatePublicationParam> {
  final ContentRepository _contentRepository;

  CreatePublicationUseCase(this._contentRepository);

  @override
  Future<Either<Failure, Unit>> call(CreatePublicationParam params) async {
    final either =
        _contentRepository.createContent(ContentMapper(sl()).fromParam(params));
    return either;
  }
}

class CreatePublicationParam {
  String? title, code, codeResult, parentId;
  String content, username, creatorId, contentType;
  DateTime createdAt;

  CreatePublicationParam({
    this.title,
    this.code,
    this.codeResult,
    this.parentId,
    required this.createdAt,
    required this.creatorId,
    required this.contentType,
    required this.content,
    required this.username,
  });
}

class CreatePublicationFailure extends Failure {
  String message;

  CreatePublicationFailure(this.message);
}
