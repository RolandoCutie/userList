part of 'home_controller.dart';

class HomeState {
  final String error;
  final bool isLoading;
  final bool isSearching;

  final List<User>? users;

  const HomeState({
    this.error = "",
    this.isLoading = false,
    this.isSearching = false,
    this.users,
  });

  factory HomeState.initial() => const HomeState();

  bool get hasError => error.isNotEmpty == true;

  HomeState copyWith({
    String? error,
    bool? isLoading,
    bool? isSearching,
    List<User>? users,
  }) {
    return HomeState(
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      isSearching: isSearching ?? this.isSearching,
      users: users ?? this.users,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeState &&
        other.isLoading == isLoading &&
        other.isSearching == isSearching &&
        other.users == users &&
        other.error == error;
  }

  @override
  int get hashCode {
    return isLoading.hashCode ^
        isSearching.hashCode ^
        users.hashCode ^
        error.hashCode;
  }
}
