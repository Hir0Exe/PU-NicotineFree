import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A1B9A),
              Color(0xFF8E24AA),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Notificaciones',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Mantente motivado siempre',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Mensaje del día
                        Container(
                          padding: const EdgeInsets.all(24),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.pink.withOpacity(0.1),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 32,
                                ),
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                'Mensaje del día',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  '"Cada día sin fumar es una victoria. ¡Celebra tus logros!"',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                    height: 1.3,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Header de notificaciones
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                'Todas las\nnotificaciones',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.check_circle_outline, size: 16),
                              label: const Text(
                                'Marcar leídas',
                                style: TextStyle(fontSize: 12),
                              ),
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF6A1B9A),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Lista de notificaciones
                        _buildNotification(
                          icon: Icons.emoji_events,
                          color: Colors.orange,
                          title: '¡Nuevo logro desbloqueado!',
                          message:
                              'Has completado 3 semanas sin fumar. ¡Increíble progreso!',
                          time: 'Hace 1 hora',
                          isNew: true,
                        ),
                        const SizedBox(height: 12),
                        _buildNotification(
                          icon: Icons.favorite,
                          color: Colors.pink,
                          title: 'Mensaje motivacional',
                          message:
                              'Tu cuerpo ya está sanando. Los pulmones se limpian cada día más.',
                          time: 'Hace 3 horas',
                          isNew: true,
                        ),
                        const SizedBox(height: 12),
                        _buildNotification(
                          icon: Icons.stars,
                          color: const Color(0xFF0080FF),
                          title: 'Nuevo reto disponible',
                          message:
                              '¿Listo para el desafío "Mes sin recaídas"? Únete ahora.',
                          time: 'Hace 5 horas',
                          isNew: false,
                        ),
                        const SizedBox(height: 12),
                        _buildNotification(
                          icon: Icons.priority_high,
                          color: const Color(0xFF9C27B0),
                          title: '¡Hito importante!',
                          message:
                              'Mañana cumples 1 mes sin fumar. ¡Prepárate para celebrar!',
                          time: 'Hace 1 día',
                          isNew: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotification({
    required IconData icon,
    required Color color,
    required String title,
    required String message,
    required String time,
    required bool isNew,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isNew ? color.withOpacity(0.05) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isNew ? color.withOpacity(0.2) : Colors.grey[200]!,
          width: isNew ? 2 : 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    if (isNew) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0080FF),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'Nuevo',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.access_time,
                      size: 14,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(width: 4),
                    Text(
                      time,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

