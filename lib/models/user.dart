
class User{

  String ?name;
  int ?salary;
  int ?age;
  int ?id;

  User({this.name,this.age,this.salary,this.id});

  User.fromJson(Map<String, dynamic> json):
      name = json['name'],
      salary = json['salary'],
      age = json['age'],
      id = json['id'];

  Map<String, dynamic> toJson() => {
    'name':name,
    'salary':salary,
    'age':age,
    'id':id
  };

}