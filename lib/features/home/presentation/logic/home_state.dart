part of 'home_controller.dart';

class HomeState {
  final String error;
  final bool isLoading;
  double mapZoom;

  final List<User>? users;

  HomeState({
    this.error = "",
    this.isLoading = false,
    this.users = const [],
    this.mapZoom = 12,
  });

  factory HomeState.initial() => HomeState();

  bool get hasError => error.isNotEmpty == true;

  HomeState copyWith({
    String? error,
    bool? isLoading,
    List<User>? users,
    double? mapZoom,
  }) {
    return HomeState(
        error: error ?? this.error,
        isLoading: isLoading ?? this.isLoading,
        users: users ?? this.users,
        mapZoom: mapZoom ?? this.mapZoom);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.isLoading == isLoading &&
        other.mapZoom == mapZoom &&
        other.users == users &&
        other.error == error;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        mapZoom.hashCode ^
        users.hashCode ^
        error.hashCode;
  }
}
