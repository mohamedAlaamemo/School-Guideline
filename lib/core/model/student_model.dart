class StudentModel{
  String? name;
  String? level;



  StudentModel.name(
      {this.name,
        this.level,
      });

  StudentModel.fromJson(Map<String, dynamic> json) {
    name=json["name"];
    level=json["level"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "level": this.level,
    };
  }
}