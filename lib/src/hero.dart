class Hero {
  final int id;
  String name;
  Hero(this.id, this.name);

  factory Hero.fromJson(Map<String, dynamic> hero) =>
    Hero(_toInt(hero['id']), hero['name']);

  Map toJson() => {'id': this.id, 'name': this.name};
}

int _toInt(id) => id is int ? id: int.parse(id);