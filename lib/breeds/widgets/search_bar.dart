import 'package:catbreeds/app_ui/app_ui.dart';
import 'package:catbreeds/breeds/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedSearchBar extends StatefulWidget {
  const BreedSearchBar({super.key});

  @override
  State<BreedSearchBar> createState() => _BreedSearchBarState();
}

class _BreedSearchBarState extends State<BreedSearchBar> {
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
        textInputAction: TextInputAction.search,
        controller: _controller,
        decoration: InputDecoration(
          labelText: 'Search',
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () => _formKey.currentState?.save(),
              ),
              // const SizedBox(width: AppSpacing.md),
              IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  _controller.clear();
                  context.read<BreedsBloc>().add(const BreedsClearRequested());
                },
              ),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
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
