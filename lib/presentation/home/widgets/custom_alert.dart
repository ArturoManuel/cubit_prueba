import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/counter_cubit.dart';

class CustomAlert extends StatelessWidget {
  const CustomAlert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Refrescar data"),
      actions: [
        ElevatedButton(onPressed: () {
          context.read<HomeCubit>().getfechGetData();
          Navigator.of(context).pop();
        }, child: Text("Aceptar"))

      ],
    );
  }
}