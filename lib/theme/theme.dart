import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff3b608f),
      surfaceTint: Color(0xff3b608f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffd4e3ff),
      onPrimaryContainer: Color(0xff001c39),
      secondary: Color(0xff1b6585),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc3e8ff),
      onSecondaryContainer: Color(0xff001e2c),
      tertiary: Color(0xff775a0b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffdf9e),
      onTertiaryContainer: Color(0xff261a00),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff43474e),
      outline: Color(0xff73777f),
      outlineVariant: Color(0xffc3c6cf),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa4c9fe),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001c39),
      primaryFixedDim: Color(0xffa4c9fe),
      onPrimaryFixedVariant: Color(0xff204876),
      secondaryFixed: Color(0xffc3e8ff),
      onSecondaryFixed: Color(0xff001e2c),
      secondaryFixedDim: Color(0xff8fcff3),
      onSecondaryFixedVariant: Color(0xff004c68),
      tertiaryFixed: Color(0xffffdf9e),
      onTertiaryFixed: Color(0xff261a00),
      tertiaryFixedDim: Color(0xffe9c16c),
      onTertiaryFixedVariant: Color(0xff5b4300),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1b4472),
      surfaceTint: Color(0xff3b608f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5276a7),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff004863),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff397c9d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff563f00),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff907023),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff171d1e),
      onSurfaceVariant: Color(0xff3f434a),
      outline: Color(0xff5b5f67),
      outlineVariant: Color(0xff777b83),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffa4c9fe),
      primaryFixed: Color(0xff5276a7),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff385d8d),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff397c9d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff176383),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff907023),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff755708),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002344),
      surfaceTint: Color(0xff3b608f),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1b4472),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff002535),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff004863),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff2e2000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff563f00),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff5fafb),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff20242b),
      outline: Color(0xff3f434a),
      outlineVariant: Color(0xff3f434a),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xffe3ecff),
      primaryFixed: Color(0xff1b4472),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002d56),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff004863),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff003144),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff563f00),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff3b2a00),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
      surfaceContainer: Color(0xffe9eff0),
      surfaceContainerHigh: Color(0xffe3e9ea),
      surfaceContainerHighest: Color(0xffdee3e5),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffa4c9fe),
      surfaceTint: Color(0xffa4c9fe),
      onPrimary: Color(0xff00315d),
      primaryContainer: Color(0xff204876),
      onPrimaryContainer: Color(0xffd4e3ff),
      secondary: Color(0xff8fcff3),
      onSecondary: Color(0xff003549),
      secondaryContainer: Color(0xff004c68),
      onSecondaryContainer: Color(0xffc3e8ff),
      tertiary: Color(0xffe9c16c),
      onTertiary: Color(0xff3f2e00),
      tertiaryContainer: Color(0xff5b4300),
      onTertiaryContainer: Color(0xffffdf9e),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffdee3e5),
      onSurfaceVariant: Color(0xffc3c6cf),
      outline: Color(0xff8d9199),
      outlineVariant: Color(0xff43474e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff3b608f),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001c39),
      primaryFixedDim: Color(0xffa4c9fe),
      onPrimaryFixedVariant: Color(0xff204876),
      secondaryFixed: Color(0xffc3e8ff),
      onSecondaryFixed: Color(0xff001e2c),
      secondaryFixedDim: Color(0xff8fcff3),
      onSecondaryFixedVariant: Color(0xff004c68),
      tertiaryFixed: Color(0xffffdf9e),
      onTertiaryFixed: Color(0xff261a00),
      tertiaryFixedDim: Color(0xffe9c16c),
      onTertiaryFixedVariant: Color(0xff5b4300),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffabcdff),
      surfaceTint: Color(0xffa4c9fe),
      onPrimary: Color(0xff001730),
      primaryContainer: Color(0xff6e93c5),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xff93d3f7),
      onSecondary: Color(0xff001925),
      secondaryContainer: Color(0xff5898ba),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffedc670),
      onTertiary: Color(0xff1f1500),
      tertiaryContainer: Color(0xffaf8c3d),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xfff6fcfd),
      onSurfaceVariant: Color(0xffc7cbd4),
      outline: Color(0xff9fa3ab),
      outlineVariant: Color(0xff80838b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff214977),
      primaryFixed: Color(0xffd4e3ff),
      onPrimaryFixed: Color(0xff001127),
      primaryFixedDim: Color(0xffa4c9fe),
      onPrimaryFixedVariant: Color(0xff073764),
      secondaryFixed: Color(0xffc3e8ff),
      onSecondaryFixed: Color(0xff00131d),
      secondaryFixedDim: Color(0xff8fcff3),
      onSecondaryFixedVariant: Color(0xff003b51),
      tertiaryFixed: Color(0xffffdf9e),
      onTertiaryFixed: Color(0xff191000),
      tertiaryFixedDim: Color(0xffe9c16c),
      onTertiaryFixedVariant: Color(0xff473300),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffa4c9fe),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffabcdff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfff8fbff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xff93d3f7),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffffaf7),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffedc670),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff0e1415),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffbfaff),
      outline: Color(0xffc7cbd4),
      outlineVariant: Color(0xffc7cbd4),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffdee3e5),
      inversePrimary: Color(0xff002b52),
      primaryFixed: Color(0xffdbe7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffabcdff),
      onPrimaryFixedVariant: Color(0xff001730),
      secondaryFixed: Color(0xffcdebff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xff93d3f7),
      onSecondaryFixedVariant: Color(0xff001925),
      tertiaryFixed: Color(0xffffe4af),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffedc670),
      onTertiaryFixedVariant: Color(0xff1f1500),
      surfaceDim: Color(0xff0e1415),
      surfaceBright: Color(0xff343a3b),
      surfaceContainerLowest: Color(0xff090f10),
      surfaceContainerLow: Color(0xff171d1e),
      surfaceContainer: Color(0xff1b2122),
      surfaceContainerHigh: Color(0xff252b2c),
      surfaceContainerHighest: Color(0xff303637),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
