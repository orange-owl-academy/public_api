import 'package:flutter/material.dart';
import 'package:public_api/core/utils/constants/urls.dart';
import 'package:public_api/data/models/character.dart';
import 'package:public_api/core/services/api_service.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  bool isLoading = true;
  final ApiService _apiService = ApiService();
  late Character character;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadCharacters();
  }

  void _loadCharacters() async {
    final data = await _apiService.fetchData(characterUrl);
    character = Character.fromJson(data);
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        centerTitle: true,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: character.results!.length,
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(character.results![index].image!),
                title: Text(character.results![index].name!),
              ),
            ),
    );
  }
}
