class HomeScreenState {
  int count;
  String? name;
  String? places;

  HomeScreenState({required this.count, this.name, this.places});

  HomeScreenState copyWith({int? count, String? name, String? places}) {
    return HomeScreenState(
      count: count ?? this.count,
      name: name ?? this.name,
      places: places ?? this.places,
    );
  }
}
