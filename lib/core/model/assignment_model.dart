class AssignmentModel{
  String? fileName;
  String? filePath;



  AssignmentModel.name(
      {this.fileName,
        this.filePath,
      });

  AssignmentModel.fromJson(Map<String, dynamic> json) {
    fileName=json["fileName"];
    filePath=json["filePath"];
  }

  Map<String, dynamic> toMap() {
    return {
      "fileName": this.fileName,
      "filePath": this.filePath,
    };
  }
}