class CharacterClass {
  String name;
  List<Specialization> specializations;

  CharacterClass({required this.name, required this.specializations});
}

class Specialization {
  String name;
  Attributes attributes;

  Specialization({required this.name, required this.attributes});
}

class Attributes {
  List<String> engravings;
  List<String> combatStats;

  Attributes({required this.engravings, required this.combatStats});
}


