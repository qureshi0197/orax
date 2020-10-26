
class Profile{
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  Profile({
    this.id, 
    this.avatar, 
    this.email, 
    this.first_name,
    this.last_name
    });

  factory Profile.fromJson(Map<String, dynamic> json ) {
    return Profile(

      id:         json['data']['id'] as int,
      first_name: json['data']['first_name'] as String,
      last_name:  json['data']['last_name'] as String,
      email:      json['data']['email'] as String,
      avatar:     json['data']['avatar'] as String
      
      );
  }
}