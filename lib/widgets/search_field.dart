import 'package:flutter/material.dart';

class AddressSearchField extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String) onChanged;

  const AddressSearchField({
    super.key,
    required this.searchController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: 'Search for an address',
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),

        prefixIcon: const Icon(Icons.search, color: Colors.grey),

        contentPadding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(8.0),
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
