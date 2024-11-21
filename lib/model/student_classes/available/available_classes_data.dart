class RoomAvailableData {
  List<Blocks>? blocks;

  RoomAvailableData({this.blocks});

  RoomAvailableData.fromJson(Map<String, dynamic> json) {
    if (json['blocks'] != null) {
      blocks = <Blocks>[];
      json['blocks'].forEach((v) {
        blocks!.add(new Blocks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.blocks != null) {
      data['blocks'] = this.blocks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Blocks {
  String? blockName;
  List<Rooms>? rooms;

  Blocks({this.blockName, this.rooms});

  Blocks.fromJson(Map<String, dynamic> json) {
    blockName = json['block_name'];
    if (json['rooms'] != null) {
      rooms = <Rooms>[];
      json['rooms'].forEach((v) {
        rooms!.add(new Rooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['block_name'] = this.blockName;
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
  String? pcName;
  bool? isAvailable;

  Pcs({this.pcName, this.isAvailable});

  Pcs.fromJson(Map<String, dynamic> json) {
    pcName = json['pc_name'];
    isAvailable = json['is_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pc_name'] = this.pcName;
    data['is_available'] = this.isAvailable;
    return data;
  }
}
