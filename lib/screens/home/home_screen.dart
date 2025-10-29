import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/user_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0080FF),
              Color(0xFF00D4AA),
            ],
          ),
        ),
        child: SafeArea(
          child: Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              final UserModel? user = authProvider.currentUser;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '¡Hola, ${user?.name ?? "Usuario"}!',
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const Text(
                                'Tu progreso es increíble',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () async {
                              // Confirmar logout
                              final confirm = await showDialog<bool>(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Cerrar sesión'),
                                  content: const Text(
                                      '¿Estás seguro de que quieres cerrar sesión?'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                      child: const Text('Cancelar'),
                                    ),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      child: const Text('Cerrar sesión'),
                                    ),
                                  ],
                                ),
                              );

                              if (confirm == true && context.mounted) {
                                await context.read<AuthProvider>().signOut();
                              }
                            },
                            icon: const Icon(
                              Icons.logout,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Días sin fumar
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: const Color(0xFF00D4AA).withOpacity(0.2),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.calendar_today,
                                size: 40,
                                color: Color(0xFF00D4AA),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              '${user?.daysSinceQuit ?? 0} días',
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              'sin fumar',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 16),
                            
                            // Progreso semanal
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Progreso semanal',
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  '100%',
                                  style: TextStyle(
                                    color: Color(0xFF0080FF),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: LinearProgressIndicator(
                                value: 1.0,
                                minHeight: 10,
                                backgroundColor: Colors.grey[200],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF0080FF),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),
                            
                            // Botón de retos
                            ElevatedButton(
                              onPressed: () {
                                // TODO: Navegar a retos
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Retos disponibles - En desarrollo'),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 12,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: const Text(
                                'Ver retos disponibles',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Estadísticas
                      Row(
                        children: [
                          Expanded(
                            child: _buildStatCard(
                              icon: Icons.attach_money,
                              title: 'Dinero\nahorrado',
                              value:
                                  '\$${(user?.moneySaved ?? 0).toStringAsFixed(2)}',
                              color: const Color(0xFF4CAF50),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildStatCard(
                              icon: Icons.smoke_free,
                              title: 'Cigarrillos\nevitados',
                              value: '${user?.cigarettesAvoided ?? 0}',
                              color: const Color(0xFF0080FF),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Mejoras en tu salud
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mejoras en tu salud',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildHealthItem(
                              icon: Icons.favorite,
                              title: 'Circulación sanguínea mejorada',
                              isCompleted: (user?.daysSinceQuit ?? 0) >= 2,
                            ),
                            _buildHealthItem(
                              icon: Icons.air,
                              title: 'Sentido del olfato recuperado',
                              isCompleted: (user?.daysSinceQuit ?? 0) >= 7,
                            ),
                            _buildHealthItem(
                              icon: Icons.monitor_heart,
                              title: 'Riesgo cardíaco reducido',
                              isCompleted: (user?.daysSinceQuit ?? 0) >= 30,
                              isLast: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthItem({
    required IconData icon,
    required String title,
    required bool isCompleted,
    bool isLast = false,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: isCompleted ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: isCompleted ? Colors.black : Colors.grey,
                ),
              ),
            ),
            Icon(
              isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
              color: isCompleted ? Colors.green : Colors.grey,
            ),
          ],
        ),
        if (!isLast) const Divider(height: 24),
      ],
    );
  }
}

