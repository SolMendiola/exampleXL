extension StringExtension on String?{
   bool get isEmpty => this == null || this!.isEmpty;
   bool get isNotEmpty => !isEmpty;
}
