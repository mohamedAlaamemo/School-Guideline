class ApplicationModel{
  String? name;
  String? birthDate;
  String? address;
  String? nID;
  String? email;
  String? phone;
  String? gender;
  String? school;



  ApplicationModel.name(
      {this.name,
        this.birthDate,
        this.address,
        this.email,
        this.nID,
        this.phone,
        this.gender,
        this.school,

      });

  ApplicationModel.fromJson(Map<String, dynamic> json) {
    name=json["name"];
    birthDate=json["birthDate"];
    address=json["address"];
    email=json["email"];
    nID=json["nID"];
    phone=json["phone"];
    gender=json["gender"];
    school=json["school"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "birthDate": this.birthDate,
      "address": this.address,
      "phone": this.phone,
      "email": this.email,
      "nID": this.nID,
      "gender": this.gender,
      "school": this.school,
    };
  }
}