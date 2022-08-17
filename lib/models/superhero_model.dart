class SuperheroModel {
  String name;
  int experience;
  List<String> skills;

  SuperheroModel({
    required this.name,
    required this.experience,
    required this.skills,
  });

  SuperheroModel copyWith({String? newName, int? newExperience, List<String>? newSkills}) {
    return SuperheroModel(
      name: newName ?? name,
      experience: newExperience ?? experience,
      skills: newSkills ?? skills,
    );
  }
}