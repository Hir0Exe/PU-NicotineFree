import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AvatarSelector extends StatefulWidget {
  final AvatarType initialAvatar;
  final Function(AvatarType) onAvatarSelected;

  const AvatarSelector({
    Key? key,
    required this.initialAvatar,
    required this.onAvatarSelected,
  }) : super(key: key);

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  late AvatarType _currentSelection;

  @override
  void initState() {
    super.initState();
    _currentSelection = widget.initialAvatar;
  }

  void _selectAvatar(AvatarType avatarType) {
    setState(() {
      _currentSelection = avatarType;
    });
    // Notificar al padre del cambio
    widget.onAvatarSelected(avatarType);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Selecciona tu Avatar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildAvatarOption(
                    avatarType: AvatarType.elderly,
                    emoji: '👴',
                    label: 'Anciano',
                    isSelected: _currentSelection == AvatarType.elderly,
                  ),
                  const SizedBox(width: 12),
                  _buildAvatarOption(
                    avatarType: AvatarType.young,
                    emoji: '👦',
                    label: 'Joven',
                    isSelected: _currentSelection == AvatarType.young,
                  ),
                  const SizedBox(width: 12),
                  _buildAvatarOption(
                    avatarType: AvatarType.adult,
                    emoji: '👨',
                    label: 'Señor',
                    isSelected: _currentSelection == AvatarType.adult,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Cancelar'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0080FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Listo',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatarOption({
    required AvatarType avatarType,
    required String emoji,
    required String label,
    required bool isSelected,
  }) {
    return GestureDetector(
      onTap: () => _selectAvatar(avatarType),
      child: Container(
        width: 85,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF0080FF).withOpacity(0.2) : Colors.grey[100],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF0080FF) : Colors.transparent,
            width: 3,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              emoji,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: isSelected ? const Color(0xFF0080FF) : Colors.grey[700],
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar el avatar del usuario
class UserAvatar extends StatelessWidget {
  final AvatarType avatarType;
  final double size;
  final VoidCallback? onTap;

  const UserAvatar({
    Key? key,
    required this.avatarType,
    this.size = 80,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String emoji = _getEmojiForAvatar(avatarType);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF0080FF), Color(0xFF00D4AA)],
          ),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                emoji,
                style: TextStyle(fontSize: size * 0.6),
              ),
              if (onTap != null)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.edit,
                      size: size * 0.2,
                      color: const Color(0xFF0080FF),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _getEmojiForAvatar(AvatarType type) {
    switch (type) {
      case AvatarType.elderly:
        return '👴';
      case AvatarType.young:
        return '👦';
      case AvatarType.adult:
        return '👨';
    }
  }
}

