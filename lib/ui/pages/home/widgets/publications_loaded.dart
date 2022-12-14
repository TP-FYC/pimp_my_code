import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pimp_my_code/domain/entities/enum/content_type.dart';
import 'package:pimp_my_code/state/like/like_cubit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../../../domain/entities/content/content.dart';
import '../../../../ioc_container.dart';
import '../../../../state/retrieve_content/retrieve_content_cubit.dart';
import '../../../../utils/like_helper.dart';
import '../../../default_pictures.dart';
import 'comment_modal.dart';
import 'create_post_card.dart';
import 'post_card.dart';

class PublicationsLoaded extends StatelessWidget {
  final List<Content> publications;

  void showComments(BuildContext context, Content content) {
    final contentCubit = sl<RetrieveContentCubit>()..loadComment(content.id!);
    Alert(
      context: context,
      title: 'comments'.tr(),
      content: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => contentCubit,
          ),
          BlocProvider(
            create: (context) => LikeCubit(
              contentRepository: sl(),
              sessionCubit: sl(),
              retrieveContentCubit: context.read<RetrieveContentCubit>(),
            ),
          ),
        ],
        child: CommentModal(content.id!),
      ),
      buttons: [
        DialogButton(
          onPressed: () async {
            await showMaterialModalBottomSheet(
              context: context,
              builder: (context) => CreatePostCard(contentId: content.id!),
            );
            contentCubit.loadComment(content.id!);
          },
          child: const Text('add_comment').tr(),
        ),
      ],
    ).show();
  }

  const PublicationsLoaded({
    Key? key,
    required this.publications,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: publications.length,
      itemBuilder: (context, index) {
        return PostCard(
          isFullPage: false,
          allowOwnerActions: false,
          sessionCubit: sl(),
          contentType: ContentType.publication,
          contentId: publications[index].id!,
          onLikePressed: () =>
              onLikePress(context.read<LikeCubit>(), publications[index]),
          onUnlikePressed: () =>
              onDislikePress(context.read<LikeCubit>(), publications[index]),
          onCommentaryPressed: () => showComments(context, publications[index]),
          reloadPublication: () {},
          codes: publications[index].code == null
              ? ['']
              : [publications[index].code!],
          title: publications[index].title,
          post: publications[index].content,
          imageURL: DefaultPictures.defaultUserPicture,
          username: publications[index].username,
          creatorId: publications[index].creatorId,
          date:
              DateFormat('dd MMMM yyyy').format(publications[index].createdAt),
          isLiked: publications[index].isLike,
          isDisliked: publications[index].isDislike,
          likeCount: publications[index].numberOfLikes.toString(),
          unlikeCount: publications[index].numberOfDislikes.toString(),
          commentaryCount: publications[index].numberOfComments.toString(),
        );
      },
    );
  }
}
