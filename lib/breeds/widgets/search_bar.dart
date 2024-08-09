import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final TextEditingController _controller;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Search',
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => _formKey.currentState?.save(),
          ),
        ),
        onSaved: (value) {
          if (value?.isEmpty ?? true) {
            context.read<BreedsBloc>().add(const BreedsClearRequested());
            return;
          }
          context.read<BreedsBloc>().add(BreedsSearchRequested(value!));
        },
        // onChanged: (value) {
        //   context.read<BreedsBloc>().add(BreedsSearchChanged(search: value));
        // },
      ),
    );
  }
}
