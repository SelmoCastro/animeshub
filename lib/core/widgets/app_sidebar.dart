import 'package:flutter/material.dart';

class AppSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onDestinationSelected;

  const AppSidebar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    const neonPurple = Color(0xFFBB86FC);
    const darkPurple = Color(0xFF1A1128);

    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.5),
        border: Border(
          right: BorderSide(color: Colors.white.withOpacity(0.1)),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 48),
          // Logo/Home Icon Area
          _SidebarItem(
            icon: Icons.home_filled,
            isSelected: selectedIndex == 0,
            onTap: () => onDestinationSelected(0),
            color: neonPurple,
          ),
          _SidebarItem(
            icon: Icons.grid_view_rounded,
            isSelected: selectedIndex == 1,
            onTap: () => onDestinationSelected(1),
            color: neonPurple,
          ),
          _SidebarItem(
            icon: Icons.search,
            isSelected: selectedIndex == 2,
            onTap: () => onDestinationSelected(2),
            color: neonPurple,
          ),
          _SidebarItem(
            icon: Icons.play_circle_fill,
            isSelected: selectedIndex == 3,
            onTap: () => onDestinationSelected(3),
            color: neonPurple,
          ),
          const Spacer(),
          _SidebarItem(
            icon: Icons.logout,
            isSelected: false,
            onTap: () => onDestinationSelected(4),
            color: Colors.redAccent,
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;

  const _SidebarItem({
    required this.icon,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.2) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? Border.all(color: color.withOpacity(0.5)) : null,
          boxShadow: isSelected
              ? [BoxShadow(color: color.withOpacity(0.2), blurRadius: 10)]
              : null,
        ),
        child: Icon(
          icon,
          color: isSelected ? color : Colors.white.withOpacity(0.5),
          size: 28,
        ),
      ),
    );
  }
}
