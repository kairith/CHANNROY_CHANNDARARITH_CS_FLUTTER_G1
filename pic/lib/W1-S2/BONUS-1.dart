enum Direction { north, east, south, west }
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  
  for (var instructions in instructions.split("")) {
      if(instructions == "R"){
        direction = Direction.values[(direction.index + 1) % 4];
      }else if(instructions == "L"){
        direction = Direction.values[(direction.index - 1) % 4];
      }else if(instructions == "A"){
        switch(direction){
          case Direction.north:
          y++;
          break;
          case Direction.west:
          y--;
          break;
          case Direction.south:
          x--;
          break;
          case Direction.east:
          x++;
          break;
        }
      }

      }
  // Print the final position and direction
  print("Final position: x = $x y = $y ${direction.toString().split('.').last}");
  
}
