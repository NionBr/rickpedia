import 'package:flutter/material.dart';
import 'package:myapp/src/screens/widgets/card_widget.dart';
import 'package:myapp/src/services/character_service.dart';
import 'package:myapp/src/states/home_screen_states/home_state.dart';
import 'package:myapp/src/stores/character_store.dart';
import 'package:uno/uno.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final store = CharacterStore(CharacterService(Uno()));
  int page = 1;

  @override
  void initState() {
    super.initState();
    store.getAllCharacters(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rickpedia'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            if (page > 1) {
              page -= 1;
              store.getAllCharacters(page);
            }
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              if (page <= 42) {
                page += 1;
                store.getAllCharacters(page);
              }
            },
            icon: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(
            width: 3,
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, state, widget) {
          if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is HomeErrorState) {
            return Center(
              child: Text(state.error),
            );
          }

          if (state is HomeSuccessState) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                return CardWidget(
                  name: state.characters[index].name,
                  image: state.characters[index].image,
                  status: state.characters[index].status,
                  gender: state.characters[index].gender,
                  species: state.characters[index].species,
                );
              },
            );
          }
          return Container();
        },
      ),
    );
  }
}
