import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
 String name;
 String email;
 String id;
 DateTime date;
 bool delete;
 DocumentReference reference;

 UserModel({
   required this.name,
   required this.email,
   required this.id,
   required this.date,
   required this.reference,
   required this.delete
});

UserModel copyWith({
   String? name,
   String? email,
   String? id,
   DateTime? date,
   bool? delete,
   DocumentReference? reference,
})=>UserModel(
    name: name ?? this.name,
    email: email ?? this.email,
    id: id ?? this.id,
    date: date ?? this.date,
    reference: reference ?? this.reference,
    delete: delete ?? this.delete
);

factory UserModel.fromJson(dynamic json) =>UserModel(
    name: json ['name']??'',
    email: json ['email']?? '',
    id: json ['id']??'',
    date: json['date']??'',
    reference: json['reference']??'',
    delete: json['delete']??''
);

Map<String,dynamic> toJson() =>{
  'name':name,
  'email':email,
  'id':id,
  'date':date,
  'reference':reference,
  'delete':delete
};


}