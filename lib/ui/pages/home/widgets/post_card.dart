import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:pimp_my_code/domain/entities/enum/content_type.dart';
import 'package:pimp_my_code/ui/pages/publication/update_publication_modal.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../../../../ioc_container.dart';
import '../../../../state/delete_content/delete_content_cubit.dart';
import '../../../../state/session/session_cubit.dart';
import '../../../../state/update_content/update_content_bloc.dart';
import '../../../widgets/code_editor/code_showroom.dart';
import '../../../widgets/image_full_screen_wrapper/image_full_screen_wrapper.dart';
import '../../publication/delete_publication_modal.dart';

class PostCard extends StatelessWidget {
  const PostCard({
    Key? key,
    required this.isFullPage,
    required this.allowOwnerActions,
    required this.sessionCubit,
    required this.post,
    required this.imageURL,
    required this.username,
    required this.creatorId,
    required this.date,
    this.language = 'dart',
    this.title,
    this.codes,
    this.likeCount = '0',
    this.unlikeCount = '0',
    this.commentaryCount = '0',
    this.onLikePressed,
    this.onUnlikePressed,
    this.onCommentaryPressed,
    required this.reloadPublication,
    required this.isLiked,
    required this.isDisliked,
    required this.contentId,
    required this.contentType,
  }) : super(key: key);

  final bool isFullPage;
  final bool allowOwnerActions;
  final SessionCubit sessionCubit;
  final String language;
  final ContentType contentType;
  final String? title;
  final String imageURL;
  final String contentId;
  final String username;
  final String creatorId;
  final String date;
  final String post;
  final List<String>? codes;
  final String likeCount, unlikeCount, commentaryCount;
  final Function()? onLikePressed,
      onUnlikePressed,
      onCommentaryPressed,
      reloadPublication;
  final bool isLiked;
  final bool isDisliked;

  Future<void> onUpdatePress(BuildContext context) async {
    await Alert(
      context: context,
      title: 'update_content'.tr(),
      content: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                sl<UpdateContentBloc>()..init(title ?? '', post),
          ),
        ],
        child: UpdatePublicationModal(
          contentId: contentId,
          title: title,
          content: post,
          reloadFunction: () => reloadPublication!(),
        ),
      ),
      buttons: [],
    ).show();
  }

  Future<void> onDeletePress(BuildContext context) async {
    await Alert(
      context: context,
      title: 'delete_content_confirmation'.tr(),
      content: BlocProvider(
        create: (context) => sl<DeleteContentCubit>(),
        child: DeletePublicationModal(contentId: contentId),
      ),
      buttons: [],
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    final card = isFullPage
        ? GFCard(
            boxFit: BoxFit.fitHeight,
            height: MediaQuery.of(context).size.height * 0.8,
            title: buildCardHeader(context),
            content: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: content(),
            ),
            buttonBar: buttonBar(),
          )
        : GFCard(
            boxFit: BoxFit.cover,
            title: buildCardHeader(context),
            content: content(),
            buttonBar: buttonBar(),
          );
    return Column(
      children: [
        if (isFullPage)
          Row(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.only(bottomRight: Radius.circular(15)),
                child: Container(
                  color: Colors.amber,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => context.pop(),
                    color: Colors.blueGrey,
                  ),
                ),
              ),
            ],
          ),
        Stack(
          children: [
            card,
            _buildActionButtons(context),
          ],
        ),
      ],
    );
  }

  GFListTile buildCardHeader(BuildContext context) {
    return GFListTile(
      onTap: () {
        if (contentType == ContentType.publication) {
          context.push('/publication/$contentId');
        }
      },
      avatar: buildAvatar(),
      title: buildTitle(),
      subTitle: Text(date),
    );
  }

  GFAvatar buildAvatar() {
    return GFAvatar(
      backgroundImage: NetworkImage(imageURL),
    );
  }

  Text buildTitle() {
    return Text(
      username,
      style: const TextStyle(fontWeight: FontWeight.bold),
    );
  }

  GFButtonBar buttonBar() {
    return GFButtonBar(
      children: <Widget>[
        GFButton(
          textColor: Colors.black,
          onPressed: onLikePressed,
          text: likeCount,
          icon: Icon(
            isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
          ),
          shape: GFButtonShape.square,
          type: GFButtonType.transparent,
        ),
        GFButton(
          textColor: Colors.black,
          onPressed: onUnlikePressed,
          text: unlikeCount,
          icon: Icon(
            isDisliked ? Icons.thumb_down : Icons.thumb_down_outlined,
          ),
          shape: GFButtonShape.square,
          type: GFButtonType.transparent,
        ),
        if (contentType == ContentType.publication)
          GFButton(
            textColor: Colors.black,
            onPressed: onCommentaryPressed,
            text: commentaryCount,
            icon: const Icon(Icons.comment_outlined),
            shape: GFButtonShape.square,
            type: GFButtonType.transparent,
          ),
      ],
    );
  }

  Column content() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        if (title != null)
          const SizedBox(
            height: 20,
          ),
        if (codes != null && codes!.first.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 2.5,
            ),
            child: CodeShowRoom(
              data: codes!.first,
              language: language,
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 10,
          ),
          child: Text(
            post,
            textAlign: TextAlign.left,
          ),
        ),
      ],
    );
  }

  _buildActionButtons(BuildContext context) {
    return FutureBuilder<String>(
        future: context.read<SessionCubit>().getUserId(),
        builder: (context, AsyncSnapshot<String> snapshot) {
          if (snapshot.hasData) {
            return Positioned(
                top: 50,
                right: 50,
                child: Row(
                  children: [
                    if (creatorId == snapshot.data! && allowOwnerActions)
                      InkWell(
                        onTap: () {
                          onUpdatePress(context);
                        },
                        child: const Icon(Icons.edit),
                      ),
                    if (creatorId == snapshot.data! && allowOwnerActions)
                      InkWell(
                        onTap: () {
                          onDeletePress(context);
                        },
                        child: const Icon(Icons.delete),
                      ),
                  ],
                ));
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
