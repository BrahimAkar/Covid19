class FileMedical {
  int fileNumber;
  int disease;
  int sensitivity;
  String bloodType;
  int weight;
  String age;

  FileMedical(this.fileNumber, this.disease, this.sensitivity, this.bloodType,
      this.weight, this.age);

  String get age2 => age;
  set age2(newValue) {
    age = newValue;
  }
}
