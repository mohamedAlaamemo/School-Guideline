class AddNewUserModel{
  String? name;
  String? birthDate;
  String? address;
  String? nID;
  String? email;
  String? phone;
  String? password;
  String? kind;



  AddNewUserModel.name(
      {this.name,
        this.birthDate,
        this.address,
        this.email,
        this.nID,
        this.phone,
        this.password,
        this.kind,

      });

  AddNewUserModel.fromJson(Map<String, dynamic> json) {
    name=json["name"];
    birthDate=json["birthDate"];
    address=json["address"];
    email=json["email"];
    nID=json["nID"];
    phone=json["phone"];
    password=json["password"];
    kind=json["kind"];
  }

  Map<String, dynamic> toMap() {
    return {
      "name": this.name,
      "birthDate": this.birthDate,
      "address": this.address,
      "phone": this.phone,
      "email": this.email,
      "nID": this.nID,
      "password": this.password,
      "kind": this.kind,
    };
  }
}