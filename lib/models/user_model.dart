import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String name;
  final DateTime createdAt;
  final DateTime? quitDate; // Fecha en la que decidió dejar de fumar
  final int? cigarettesPerDay; // Cigarrillos por día antes de dejar
  final double? pricePerPack; // Precio por paquete
  final int? cigarettesPerPack; // Cigarrillos por paquete (típicamente 20)

  UserModel({
    required this.uid,
    required this.email,
    required this.name,
    required this.createdAt,
    this.quitDate,
    this.cigarettesPerDay,
    this.pricePerPack,
    this.cigarettesPerPack = 20,
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
    );
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

