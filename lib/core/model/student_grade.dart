class StudentGradeModel{
  String? assignmentName;
  String? grade;
  String? note;
  String? teacherName;



  StudentGradeModel.name(
      {this.assignmentName,
        this.grade,
        this.note,
        this.teacherName,
      });

  StudentGradeModel.fromJson(Map<String, dynamic> json) {
    assignmentName=json["assignmentName"];
    grade=json["grade"];
    note=json["note"];
    teacherName=json["teacherName"];
  }

  Map<String, dynamic> toMap() {
    return {
      "assignmentName": this.assignmentName,
      "grade": this.grade,
      "note": this.note,
      "teacherName": this.teacherName,
    };
  }
}