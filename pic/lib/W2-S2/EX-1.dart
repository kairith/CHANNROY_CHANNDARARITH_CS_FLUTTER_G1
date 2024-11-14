enum Skill { FLUTTER, DART, OTHER }

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearOfExperience;

  // Default constructor
  Employee({
    required String name,
    required double baseSalary,
    List<Skill>? skills,
    required  address,
    required yearOfExperience,
                               })  : _name = name,
                                    _baseSalary = baseSalary,
                                    _skills = skills ?? [],
                                    _address = address,
                                    _yearOfExperience = yearOfExperience;
  
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearOfExperience => _yearOfExperience;

  Employee.mobileDeveloper( String name, double baseSalary, {
    List<Skill>? skills,
    required  address,
    required yearOfExperience,
  })  :
       _name = name,
       _baseSalary = baseSalary,
        _skills = skills ?? [],
        _address = address,
        _yearOfExperience = yearOfExperience;


  void printDetails() {

    print('Employee: $name, Base Salary: \$${baseSalary}');
     print('Computed Salary: \$${computeSalary()}');

}
   double computeSalary() {

    double total = _baseSalary;

    total += _yearOfExperience * 2000;

    for(var skill in _skills) {
      switch(skill) {
        case Skill.FLUTTER:
          total += 5000;
          break;
        case Skill.DART:
          total += 3000;
          break;
        case Skill.OTHER:
          total += 1000;
          break;
      }
    }
    return total;
}

}
class Address {
  String _city;
  String _street;
  String _zipCode;


  Address({

    required String city,
    required String street,
    required String zipCode,
  }

  ):
    _city = city,
    _street = street,
    _zipCode = zipCode;

    String get city => _city;
    String get street => _street;
    String get zipCode => _zipCode;
}



void main() {
  
 var emp0 = Employee.mobileDeveloper("ronan", 40000, address: Address(city: "cairo", street: "khalifa", zipCode: "12345") , yearOfExperience: 5, skills: [Skill.FLUTTER, Skill.DART]);
 var emp1 = Employee.mobileDeveloper("mika", 40000, address: Address(city :"phnompenh",street : "omega",zipCode :  "09876"), yearOfExperience: 2, skills: [Skill.FLUTTER, Skill.DART]);
  emp0.printDetails();
  emp1.printDetails();
  
}