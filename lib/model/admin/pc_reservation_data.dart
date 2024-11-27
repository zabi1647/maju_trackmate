class ReservationPcs {
  List<Rooms>? rooms;

  ReservationPcs({this.rooms});

  ReservationPcs.fromJson(Map<String, dynamic> json) {
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.rooms != null) {
      data['rooms'] = this.rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rooms {
  String? roomName;
  List<Pcs>? pcs;

  Rooms({this.roomName, this.pcs});

  Rooms.fromJson(Map<String, dynamic> json) {
    roomName = json['room_name'];
    if (json['pcs'] != null) {
      pcs = <Pcs>[];
      json['pcs'].forEach((v) {
        pcs!.add(new Pcs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['room_name'] = this.roomName;
    if (this.pcs != null) {
      data['pcs'] = this.pcs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pcs {
  int? pcName;
  List<Reservations>? reservations;

  Pcs({this.pcName, this.reservations});

  Pcs.fromJson(Map<String, dynamic> json) {
    pcName = json['pc_name'];
    if (json['reservations'] != null) {
      reservations = <Reservations>[];
      json['reservations'].forEach((v) {
        reservations!.add(new Reservations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pc_name'] = this.pcName;
    if (this.reservations != null) {
      data['reservations'] = this.reservations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reservations {
  int? pcName;
  String? user;
  String? slot;
  bool? isApproved;
  String? createdAt;

  Reservations(
      {this.pcName, this.user, this.slot, this.isApproved, this.createdAt});

  Reservations.fromJson(Map<String, dynamic> json) {
    pcName = json['pc_name'];
    user = json['user'];
    slot = json['slot'];
    isApproved = json['is_approved'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pc_name'] = this.pcName;
    data['user'] = this.user;
    data['slot'] = this.slot;
    data['is_approved'] = this.isApproved;
    data['created_at'] = this.createdAt;
    return data;
  }
}
