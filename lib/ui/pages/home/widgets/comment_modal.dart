import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pimp_my_code/domain/entities/enum/content_type.dart';
import 'package:pimp_my_code/state/like/like_cubit.dart';
import 'package:pimp_my_code/utils/like_helper.dart';
import '../../../../domain/entities/content/content.dart';
import '../../../../ioc_container.dart';
import '../../../../state/retrieve_content/retrieve_content_cubit.dart';
import '../../../default_pictures.dart';
import 'post_card.dart';

class CommentModal extends StatelessWidget {
  const CommentModal(this.parentId, {Key? key}) : super(key: key);
  final String parentId;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      child: BlocBuilder<RetrieveContentCubit, RetrieveContentState>(
        builder: (context, state) {
          return state.maybeWhen(
            loaded: (comments) => _buildCommentList(comments, context),
            orElse: () => const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }

  Column _buildCommentList(List<Content> comments, BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: ((context, index) {
              return PostCard(
                isFullPage: false,
                allowOwnerActions: true,
                sessionCubit: sl(),
                contentType: ContentType.comment,
                contentId: comments[index].id!,
                onLikePressed: () =>
                    onLikePress(context.read<LikeCubit>(), comments[index]),
                onUnlikePressed: () =>
                    onDislikePress(context.read<LikeCubit>(), comments[index]),
                onCommentaryPressed: () {},
                reloadPublication: () {
                  context.read<RetrieveContentCubit>().loadComment(parentId);
                },
                codes: comments[index].code == null
                    ? ['']
                    : [comments[index].code!],
                title: comments[index].title,
                post: comments[index].content,
                imageURL: DefaultPictures.defaultUserPicture,
                username: comments[index].username,
                creatorId: comments[index].creatorId,
                date: DateFormat('dd MMMM yyyy')
                    .format(comments[index].createdAt),
                isLiked: comments[index].isLike,
                isDisliked: comments[index].isDislike,
                likeCount: comments[index].numberOfLikes.toString(),
                unlikeCount: comments[index].numberOfDislikes.toString(),
                commentaryCount: comments[index].numberOfComments.toString(),
              );
            }),
            itemCount: comments.length,
          ),
        ),
      ],
    );
  }
}
