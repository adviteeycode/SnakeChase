import 'package:snake_chase/Constants/constant.dart';

void findColumn(double width) {
  col = (width / 25).toInt();
}

void findRow(double size, double height) {
  int tempRow = 0;
  double temp = size;
  while (temp < height) {
    tempRow++;
    temp += size;
  }
  row = tempRow - 1;
}
