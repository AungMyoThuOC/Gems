class AccMap {
  var name;
  var phonenum;
  var password;
  var image;
  var checkZero;

  AccMap(
    this.name, 
    this.phonenum, 
    this.password, 
    this.image, 
    this.checkZero
  );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'phonenum': phonenum,
      'password': password,
      'image': image,
      'checkZero': checkZero,
    };
    return map;
  }

  AccMap.fromMap(Map<String, dynamic> map) {
    name = map['name'];
    phonenum = map['phonenum'];
    password = map['password'];
    image = map['image'];
    checkZero = map['checkZero'];
  }
}
