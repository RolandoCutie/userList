import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:user_list/features/home/logic/get_users.dart';
import 'package:user_list/features/home/presentation/logic/user.dart';

part 'home_state.dart';

class HomeController extends GetxController {
  final GetUsersUseCase _getUsersUseCase;
  final ScrollController scrollController = ScrollController();
  HomeState state = HomeState();

  late MapController mapController;

  HomeController(this._getUsersUseCase);

  @override
  void onInit() {
    super.onInit();
    mapController = MapController();
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

  void onMoreZoom() {
    if (state.mapZoom > 20) return;
    state = state.copyWith(mapZoom: state.mapZoom += 1);
    mapController.move(mapController.camera.center, state.mapZoom);
    update();
  }

  void onLessZoom() {
    if (state.mapZoom < 5) return;
    state = state.copyWith(mapZoom: state.mapZoom -= 1);
    mapController.move(mapController.camera.center, state.mapZoom);
    update();
  }
}
