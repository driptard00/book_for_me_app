// To parse this JSON data, do
//
//     final customers = customersFromMap(jsonString);

import 'dart:convert';

Customers customersFromMap(String str) => Customers.fromMap(json.decode(str));

String customersToMap(Customers data) => json.encode(data.toMap());

class Customers {  
    String? id;
    String? fullname;
    String? email;
    String? password;
    String? picture;
    String? phonenumber;
    String? role;
    String? token;


    Customers({
        this.id,
        this.fullname,
        this.email,
        this.password,
        this.picture,
        this.phonenumber,
        this.role,
        this.token,
    });

    factory Customers.fromMap(Map<String, dynamic> json) => Customers(
        id: json["_id"],
        fullname: json["fullname"],
        email: json["email"],
        password: json["password"],
        picture: json["picture"],
        phonenumber: json["phonenumber"],
        role: json["role"],
        token: json["token"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "fullname": fullname,
        "email": email,
        "password": password,
        "picture": picture,
        "phonenumber": phonenumber,
        "role": role,
        "token": token,
    };
}
