import 'package:bloc_state_management/Blocs/themeBlocs/ThemeEvent.dart';
import 'package:bloc_state_management/themes/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(ThemeState(themeData: AppTheme.lightTheme)){
      on<ToggleThemeEvent> ((event, emit) {
        emit(
          ThemeState(themeData: state.themeData == AppTheme.lightTheme ? AppTheme.darkTheme : AppTheme.lightTheme)
        );
      });
  }
}