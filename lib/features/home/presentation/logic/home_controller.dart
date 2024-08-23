import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list/features/home/logic/get_users.dart';
import 'package:user_list/features/home/presentation/logic/user.dart';

part 'home_state.dart';

class HomeController extends GetxController {
  final GetUsersUseCase _findProductToLookupCase;
  final ScrollController scrollController = ScrollController();
  HomeState state = const HomeState();

  HomeController(this._findProductToLookupCase);

  @override
  void onInit() {
    super.onInit();
    _fetchInitialUsers();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          _fetchInitialUsers();
        }
      }
    });
  }

  Future<void> _fetchInitialUsers() async {
    for (int i = 0; i < 15; i++) {
      await findProductToLookup();
    }
  }

  Future<void> findProductToLookup() async {
    state = state.copyWith(isLoading: true);
    update();

    final result = await _findProductToLookupCase.run();

    result.fold(
      (error) {
        state = state.copyWith(isLoading: false);
        update();
      },
      (r) {
        final List<User> users = state.users ?? [];
        users.add(r!.user);

        state = state.copyWith(
          isLoading: false,
          users: users,
        );
        update();
      },
    );
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
