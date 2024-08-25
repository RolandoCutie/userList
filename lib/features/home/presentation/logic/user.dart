import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  final Datos? result;

  User({
    this.result,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        result:
            json["results"] == null ? null : Datos.fromJson(json["results"][0]),
      );
}

class Datos {
  final String? gender;
  final Name? name;
  final Location? location;
  final String? email;
  final Dob? dob;
  final String? phone;
  final String? cell;
  final Id? id;
  final Picture? picture;
  final String? nat;

  Datos({
    this.gender,
    this.name,
    this.location,
    this.email,
    this.dob,
    this.phone,
    this.cell,
    this.id,
    this.picture,
    this.nat,
  });

  factory Datos.fromJson(Map<String, dynamic> json) => Datos(
        gender: json["gender"],
        name: json["name"] == null ? null : Name.fromJson(json["name"]),
        location: json["location"] == null
            ? null
            : Location.fromJson(json["location"]),
        email: json["email"],
        dob: json["dob"] == null ? null : Dob.fromJson(json["dob"]),
        phone: json["phone"],
        cell: json["cell"],
        id: json["id"] == null ? null : Id.fromJson(json["id"]),
        picture:
            json["picture"] == null ? null : Picture.fromJson(json["picture"]),
        nat: json["nat"],
      );

  Map<String, dynamic> toJson() => {
        "gender": gender,
        "name": name?.toJson(),
        "location": location?.toJson(),
        "email": email,
        "dob": dob?.toJson(),
        "phone": phone,
        "cell": cell,
        "id": id?.toJson(),
        "picture": picture?.toJson(),
        "nat": nat,
      };
}

class Dob {
  final DateTime? date;
  final int? age;

  Dob({
    this.date,
    this.age,
  });

  factory Dob.fromJson(Map<String, dynamic> json) => Dob(
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "date": date?.toIso8601String(),
        "age": age,
      };
}

class Id {
  final String? name;
  final String? value;

  Id({
    this.name,
    this.value,
  });

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

class Location {
  final Street? street;
  final String? city;
  final String? state;
  final String? country;

  final Coordinates? coordinates;
  final Timezone? timezone;

  Location({
    this.street,
    this.city,
    this.state,
    this.country,
    this.coordinates,
    this.timezone,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        street: json["street"] == null ? null : Street.fromJson(json["street"]),
        city: json["city"],
        state: json["state"],
        country: json["country"],
        coordinates: json["coordinates"] == null
            ? null
            : Coordinates.fromJson(json["coordinates"]),
        timezone: json["timezone"] == null
            ? null
            : Timezone.fromJson(json["timezone"]),
      );

  Map<String, dynamic> toJson() => {
        "street": street?.toJson(),
        "city": city,
        "state": state,
        "country": country,
        "coordinates": coordinates?.toJson(),
        "timezone": timezone?.toJson(),
      };
}

class Coordinates {
  final String? latitude;
  final String? longitude;

  Coordinates({
    this.latitude,
    this.longitude,
  });

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
        latitude: json["latitude"],
        longitude: json["longitude"],
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Street {
  final int? number;
  final String? name;

  Street({
    this.number,
    this.name,
  });

  factory Street.fromJson(Map<String, dynamic> json) => Street(
        number: json["number"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "name": name,
      };
}

class Timezone {
  final String? offset;
  final String? description;

  Timezone({
    this.offset,
    this.description,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) => Timezone(
        offset: json["offset"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "description": description,
      };
}

class Name {
  final String? title;
  final String? first;
  final String? last;

  Name({
    this.title,
    this.first,
    this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}

class Picture {
  final String? large;
  final String? medium;
  final String? thumbnail;

  Picture({
    this.large,
    this.medium,
    this.thumbnail,
  });

  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        large: json["large"],
        medium: json["medium"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "large": large,
        "medium": medium,
        "thumbnail": thumbnail,
      };
}
