import 'package:cloud_firestore/cloud_firestore.dart';

enum AvatarType {
  elderly, // Anciano
  young, // Joven
  adult, // Señor
}

class UserModel {
  final String uid;
  final String email;
  final String name;
  final DateTime createdAt;
  final DateTime? quitDate; // Fecha en la que decidió dejar de fumar
  final int? cigarettesPerDay; // Cigarrillos por día antes de dejar
  final double? pricePerPack; // Precio por paquete
  final int? cigarettesPerPack; // Cigarrillos por paquete (típicamente 20)
  final AvatarType avatarType; // Tipo de avatar del usuario

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
    this.quitDate,
    this.cigarettesPerDay,
    this.pricePerPack,
    this.cigarettesPerPack = 20,
    this.avatarType = AvatarType.young, // Avatar por defecto
  });

  // Convertir desde Firestore
  factory UserModel.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      quitDate: data['quitDate'] != null
          ? (data['quitDate'] as Timestamp).toDate()
          : null,
      cigarettesPerDay: data['cigarettesPerDay'],
      pricePerPack: data['pricePerPack']?.toDouble(),
      cigarettesPerPack: data['cigarettesPerPack'] ?? 20,
      avatarType: _avatarTypeFromString(data['avatarType'] ?? 'young'),
    );
  }

  // Helper para convertir string a AvatarType
  static AvatarType _avatarTypeFromString(String type) {
    switch (type) {
      case 'elderly':
        return AvatarType.elderly;
      case 'young':
        return AvatarType.young;
      case 'adult':
        return AvatarType.adult;
      default:
        return AvatarType.young;
    }
  }

  // Convertir a Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': Timestamp.fromDate(createdAt),
      'quitDate': quitDate != null ? Timestamp.fromDate(quitDate!) : null,
      'cigarettesPerDay': cigarettesPerDay,
      'pricePerPack': pricePerPack,
      'cigarettesPerPack': cigarettesPerPack,
      'avatarType': avatarType.toString().split('.').last,
    };
  }

  // Copiar con modificaciones
  UserModel copyWith({
    String? uid,
    String? email,
    String? name,
    DateTime? createdAt,
    DateTime? quitDate,
    int? cigarettesPerDay,
    double? pricePerPack,
    int? cigarettesPerPack,
    AvatarType? avatarType,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      quitDate: quitDate ?? this.quitDate,
      cigarettesPerDay: cigarettesPerDay ?? this.cigarettesPerDay,
      pricePerPack: pricePerPack ?? this.pricePerPack,
      cigarettesPerPack: cigarettesPerPack ?? this.cigarettesPerPack,
      avatarType: avatarType ?? this.avatarType,
    );
  }

  // Calcular días sin fumar
  int get daysSinceQuit {
    if (quitDate == null) return 0;
    return DateTime.now().difference(quitDate!).inDays;
  }

  // Calcular cigarrillos evitados
  int get cigarettesAvoided {
    if (quitDate == null || cigarettesPerDay == null) return 0;
    return daysSinceQuit * cigarettesPerDay!;
  }

  // Calcular dinero ahorrado
  double get moneySaved {
    if (quitDate == null ||
        cigarettesPerDay == null ||
        pricePerPack == null ||
        cigarettesPerPack == null) {
      return 0;
    }
    final packsAvoided = cigarettesAvoided / cigarettesPerPack!;
    return packsAvoided * pricePerPack!;
  }
}

