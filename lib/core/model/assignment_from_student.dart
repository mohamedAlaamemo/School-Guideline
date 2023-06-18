class AssignmentModelFromStudent{
  String? fileName;
  String? filePath;
  String? parentId;
  String? studentId;



  AssignmentModelFromStudent.name(
      {this.fileName,
        this.filePath,
        this.parentId,
        this.studentId,
      });

  AssignmentModelFromStudent.fromJson(Map<String, dynamic> json) {
    fileName=json["fileName"];
    filePath=json["filePath"];
    parentId=json["parentId"];
    studentId=json["studentId"];
  }

  Map<String, dynamic> toMap() {
    return {
      "fileName": this.fileName,
      "filePath": this.filePath,
      "parentId": this.parentId,
      "studentId": this.studentId,
    };
  }
}