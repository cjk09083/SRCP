Instruction for using the robot controller <hongik>

Update the master.launch for the number of robots present
Sample for scout_1, excavator_1 and hauler_1 already present
Update the robot name param and ns value based on the robot used


robot_controller.py 
This code contains the primary controller. It accepts a list of waypoints and move the robot along the path
Publish ros nav_msgs:Path message to <<robot_name>/path
The robot will start tracing the path
Refer to main_controller.py for publishing path sample

State 0: The robots follows a global predefine path. The scout follows one waypoint after another and the other two robots follows the scout. Once the scout finds a resource all the robots stop and State goes to 1.

State 1: The scout moves in small circle around the point where it stopped. And finds the points where the distance to the resource was the shortest. Once the shortest distance point is found, scout moves in that direction until it is very close to the resource. The state swictches to 2 when the distance to resource is less than 0.2 m

State 2: The scout moves away slightly away from the resource. The excavator and the hauler coordinates to collect the resource. Once the scout tells there is no resource near by (implies the resource was excavated completely), state goes to 0 and the scout keeps following the global path. If the bin of the hauler is full goto state State 3.

State 3: The robots return to the process station to drop the resource.
