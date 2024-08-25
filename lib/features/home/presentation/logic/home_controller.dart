import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_list/features/home/logic/get_users.dart';
import 'package:user_list/features/home/presentation/logic/user.dart';

part 'home_state.dart';

class HomeController extends GetxController {
  final GetUsersUseCase _getUsersUseCase;
  final ScrollController scrollController = ScrollController();
  HomeState state = HomeState();

  HomeController(this._getUsersUseCase);

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
    for (int i = 0; i < 50; i++) {
      await getUsers();
    }
  }

  Future<void> getUsers() async {
    state = state.copyWith(isLoading: true);
    update();

    final result = await _getUsersUseCase.run();

    result.fold(
      (error) {
        state = state.copyWith(isLoading: false);
        update();
      },
      (r) {
        final List<User> updatedUsers = List.from(state.users ?? []);
        updatedUsers.add(r!.user);

        state = state.copyWith(
          isLoading: false,
          users: updatedUsers,
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
