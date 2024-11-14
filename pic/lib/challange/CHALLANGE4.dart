
class Point {
final double x;
final double y;

const Point(this.x, this.y);
// the dart whne use const, we can not change the value
Point translate(double dx, double dy){
return Point(x + dx, y + dy);
}

@override
String toString() {
return 'Point($x, $y)';
}
}

class Shape {
late Point _left;
late Point _right;
String? _backgroundColor;

Shape({required Point left, required Point right, String? backgroundColor}) :
_left = left,
_right = right,
_backgroundColor = backgroundColor;

Point get left => _left;
Point get right => _right;
double get width => _right.x - _left.x;
double get height => _right.y - _left.y;
String? get backgroundColor => _backgroundColor;
}

class distance {
   final double _meter;
   
   const distance.kms(double kms) : _meter=kms * 1000;
   const distance.meter(double meter) : _meter=meter;
   const distance.cm(double cm) : _meter=cm / 100;

//    double get meter{

//         return _meter;

//    } 
//    double get kms{
    
//     return _meter / 1000;

//    }
//    double get cms{

//     return  _meter * 100;

//    } 

const distance.from(double value, {String meter = 'meter'}) 
     : _meter = double  == 'kms' ? value * 1000 
     : double == 'cm' ? value / 100 
     : value;


  double get meter => _meter;
  double get kms => _meter / 1000;
  double get cms => _meter * 100;


    distance operator +(distance meters) {
    return distance.meter(_meter + meters._meter);
    }
}

void main() {
var shape = Shape(
left: Point(2, 3),
right: Point(5, 7),
);

print('Width: ${shape.width}');
print('Height: ${shape.height}');

distance d1 = distance.kms(3.4);
distance d2 = distance.meter(1000);

distance total = d2 + d1;
  
print('total distance is : ${total.kms} km');
print('total distance is : ${total.cms} cm');
print('total distance is : ${total.meter} meter');

}