/// message : "success"
/// user : {"name":"Marwan Reda","email":"ma5853505@gmail.com","role":"user"}
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YTczZjljZmE3ODk1ZTgxZjIxYzg1MCIsIm5hbWUiOiJNYXJ3YW4gUmVkYSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzM5MDE0MDQ1LCJleHAiOjE3NDY3OTAwNDV9.eP6z-ZOYymSzuLELuE53yAIhvREAyyfn3RuqxSCxAi0"

class RegisterResponseEntity {
  RegisterResponseEntity({
    this.message,
    this.user,
    this.statusMsg,
    this.token,
  });

  String? message;
  UserEntity? user;
  String? token;
  String? statusMsg;
}

/// name : "Marwan Reda"
/// email : "ma5853505@gmail.com"
/// role : "user"

class UserEntity {
  UserEntity({
    this.name,
    this.email,
  });

  String? name;
  String? email;
}
