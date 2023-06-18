class TableModel{
  String? subjectName;
  String? teacherName;
  String? time;



  TableModel.name(
      {this.subjectName,
        this.teacherName,
        this.time,
      });

  TableModel.fromJson(Map<String, dynamic> json) {
    subjectName=json["subjectName"];
    teacherName=json["teacherName"];
    time=json["time"];
  }

  Map<String, dynamic> toMap() {
    return {
      "subjectName": this.subjectName,
      "teacherName": this.teacherName,
      "time": this.time,
    };
  }
}