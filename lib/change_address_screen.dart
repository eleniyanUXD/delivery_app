import 'package:flutter/material.dart';
import 'models/address_model.dart';
import 'widgets/change_address_map.dart';
import 'widgets/search_field.dart';
import 'services/address_service.dart';

class ChangeAddressScreen extends StatefulWidget {
  const ChangeAddressScreen({super.key});

  @override
  State<ChangeAddressScreen> createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  final TextEditingController searchController = TextEditingController();

  List<AddressModel> addresses = [];
  AddressModel? selectedAddress;
  bool isLoading = false;

  Future<void> searchAddress(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        addresses = [];
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final results = await AddressService.searchAddress(query);

      if (!mounted) return;

      setState(() {
        addresses = results;
      });
    } catch (e) {
      debugPrint('Address search error: $e');
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Change Address',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AddressSearchField(
              searchController: searchController,
              onChanged: (value) {
                searchAddress(value);
              },
            ),

            const SizedBox(height: 16),

            if (isLoading) const CircularProgressIndicator(),

            // Map showing the selected address
            ChangeAddressMap(
              latitude: selectedAddress?.latitude ?? 6.5244,
              longitude: selectedAddress?.longitude ?? 3.3792,
            ),

            const SizedBox(height: 16),

            Expanded(
              child: addresses.isEmpty
                  ? const Center(
                      child: Text(
                        'Search for an address',
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    )
                  : ListView.builder(
                      itemCount: addresses.length,
                      itemBuilder: (context, index) {
                        final address = addresses[index];

                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 4,
                          ),

                          leading: const Icon(
                            Icons.location_on,
                            color: Colors.green,
                          ),

                          title: Text(
                            address.displayName,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          onTap: () {
                            setState(() {
                              selectedAddress = address;

                              // Clear search results
                              addresses = [];

                              // Show selected address in search field
                              searchController.text = address.displayName;
                            });
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),

      //Select Address Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox(
          height: 52,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: selectedAddress == null
                ? null
                : () {
                    Navigator.pop(context, selectedAddress);
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text(
              'Select Address',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
