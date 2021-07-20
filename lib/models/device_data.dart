class Device {
  String guid;
  String mac;
  String type;
  String quantity;
  String name;
  String version;
  String minor;

  Device(
    this.guid,
    this.mac,
    this.minor,
    this.name,
    this.quantity,
    this.type,
    this.version
  );

  Device.fromMap(Map<String, dynamic> device){
    this.guid = device["guid"];
    this.mac = device["mac"];
    this.minor = device["minor"];
    this.name = device["name"];
    this.quantity = device["quantity"];
    this.type = device["type"];
    this.version = device["version"];
  }

  Map<String, dynamic> toMap() =>{
    'guid' : guid,
    'mac' : mac,
    'minor' : minor,
    'name' : name,
    'quantity' : quantity,
    'type' : type,
    'version' : version,
  };

  String get getGuid => guid;
  String get getMac => mac;
  String get getMinor => minor;
  String get getName => name;
  String get getQuantity => quantity;
  String get getType => type;
  String get getVersion => version;

  set getGuid (String value) {guid = value;}
  set getMac (String value) {mac = value;}
  set getMinor (String value) {minor = value;}
  set getName (String value) {name = value;}
  set getQuantity (String value) {quantity = value;}
  set getType (String value) {type = value;}
  set getVersion (String value) {version = value;}
}