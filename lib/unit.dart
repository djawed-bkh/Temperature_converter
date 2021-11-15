class Unit {
  final String? name;
  final double? conversion;


  const Unit({
    required String this.name,
    required double this.conversion,
  });

  /// Creates a [Unit] from a JSON object.
  Unit.fromJson(Map jsonMap)
      : assert(jsonMap['name'] != null),
        assert(jsonMap['conversion'] != null),
        name = jsonMap['name'],
        conversion = jsonMap['conversion'].toDouble();
}