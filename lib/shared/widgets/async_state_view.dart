import 'package:flutter/material.dart';

class AsyncStateView<T> extends StatelessWidget {
  const AsyncStateView({required this.value, required this.data, super.key});

  final AsyncSnapshot<T> value;
  final Widget Function(T data) data;

  @override
  Widget build(BuildContext context) {
    if (value.hasError) {
      return Center(child: Text(value.error.toString()));
    }
    if (!value.hasData) {
      return const Center(child: CircularProgressIndicator());
    }
    return data(value.requireData);
  }
}
