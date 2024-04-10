import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status/core/presentation/viewmodel/base_view_model.dart';

class ViewModelProvider<T extends BaseViewModel> extends StatefulWidget {
  const ViewModelProvider({
    super.key,
    required this.create,
    required this.child,
    this.initialize,
  });

  final T Function() create;
  final Function(T)? initialize;
  final Widget child;

  @override
  State<ViewModelProvider<T>> createState() => _ViewModelProviderState<T>();
}

class _ViewModelProviderState<T extends BaseViewModel>
    extends State<ViewModelProvider<T>> {
  late final viewModel = widget.create();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      widget.initialize?.call(viewModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => viewModel,
      child: widget.child,
      dispose: (_, __) => viewModel.dispose(),
    );
  }
}