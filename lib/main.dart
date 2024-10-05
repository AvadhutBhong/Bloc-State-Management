import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Blocs/Internet_bloc/internet_state.dart';
import 'Blocs/themeBlocs/theme_bloc.dart';
import 'Blocs/themeBlocs/ThemeEvent.dart';
import 'Blocs/Internet_bloc/internet_bloc.dart';
import 'themes/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => InternetBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.themeData, // Theme managed by Bloc
            home: const MyHomePage(),
          );
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isLightTheme = BlocProvider.of<ThemeBloc>(context).state.themeData == AppTheme.lightTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc State Management'),
        actions: [
          // Wrap the button in Padding to make it visible
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ThemeToggleButton(isLightTheme: isLightTheme),
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is InternetGainedState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Internet connected!'), backgroundColor: Colors.green),
              );
            } else if (state is InternetLostState) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('You are disconnected!'), backgroundColor: Colors.red),
              );
            }
          },
          builder: (context, state) {
            if (state is InternetLostState) {
              return const Text('Not connected!');
            } else if (state is InternetGainedState) {
              return const Text('Connected!');
            } else {
              return const Text('Loading...');
            }
          },
        ),
      ),
    );
  }
}

class ThemeToggleButton extends StatelessWidget {
  final bool isLightTheme;

  const ThemeToggleButton({super.key, required this.isLightTheme});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<ThemeBloc>().add(ToggleThemeEvent());
      },
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return RotationTransition(
            turns: child.key == const ValueKey('sun') ? Tween(begin: 1.0, end: 0.75).animate(animation) : animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: isLightTheme
            ? const Icon(Icons.dark_mode, key: ValueKey('moon'), size: 28, color: Colors.black54)
            : const Icon(Icons.light_mode, key: ValueKey('sun'), size: 28, color: Colors.yellowAccent),
      ),
    );
  }
}
