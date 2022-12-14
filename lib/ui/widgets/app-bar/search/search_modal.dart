import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../state/retrieve_user/retrieve_user_cubit.dart';
import 'searched_users_loaded.dart';

import '../../loading.dart';

class SearchModal extends StatelessWidget {
  const SearchModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextField(
            onChanged: (text) {
              if (text != '') {
                context.read<RetrieveUserCubit>().loadUser(text);
              }
            },
            decoration: InputDecoration(
              hintText: 'search_user'.tr(),
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          BlocConsumer<RetrieveUserCubit, RetrieveUserState>(
              listener: (context, state) {
            state.maybeWhen(
              orElse: () {},
              failure: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('failed_to_load_users').tr(),
                  backgroundColor: Theme.of(context).errorColor,
                ));
              },
            );
          }, builder: (context, state) {
            return state.maybeWhen(
              initial: () {
                return const SizedBox();
              },
              orElse: () => const Loading(),
              loaded: (users) => SearchedUsersLoaded(users: users),
            );
          }),
        ],
      ),
    );
  }
}
