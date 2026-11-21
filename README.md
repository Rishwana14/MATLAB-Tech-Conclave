# MATLAB-Tech-Conclave
Skidpad Vehicle Dynamics Simulation using MATLAB &amp; Simulink Physics (7DOF), featuring 4EM electric powertrain analysis, battery modeling with SOC monitoring, and ICE powertrain simulation and performance comparison. Developed as part of the MATLAB Tech Conclave – Team 1.
Skidpad Vehicle Dynamics Simulation Using Simulink Physics (7DOF)
MATLAB Tech Conclave -- Team 1
Institution: K.C.G. College of Technology
Project Overview
This project simulates a Formula Student vehicle performing a skidpad
test using the Simulink Physics 7-DOF vehicle model. The skidpad test is
used to study vehicle lateral dynamics, including cornering ability,
stability, and torque-distribution behaviour.

The project explores three powertrain-related tasks within the vehicle
simulation:
1. Four Electric Motor (4EM) powertrain
2. Battery modelling and State of Charge (SOC) behaviour
3. Internal Combustion Engine (ICE) powertrain
Objectives
- Simulate skidpad vehicle dynamics using Simulink Physics.
- Analyse a four-independent-motor electric powertrain.
- Model battery voltage and monitor SOC behaviour.
- Replace the electric powertrain with an ICE powertrain and compare
  their behaviour.
- Study driveline RPM and torque characteristics.
Project Workflow
The overall model follows this flow:

Skidpad Reference → Driver Commands → Formula Student Vehicle →
Visualization
- Skidpad Reference: Generates the skidpad path.
- Driver Commands: Supplies steering and acceleration commands.
- Formula Student Vehicle: Contains the vehicle dynamics and
  selected powertrain model.
- Visualization: Displays the simulated vehicle trajectory and
  related outputs.
Tasks and Implementation
Task 1 -- Four Electric Motor (4EM) Powertrain
The 4EM configuration uses four independent motors and individual torque
distribution. The project uses a MATLAB Function block to distribute
motor torque based on the acceleration command, with steering-based yaw
correction.

Observations reported in the presentation: - Immediate torque
response. - Smooth circular skidpad motion. - High driveline RPM. - No
gear shifting. - Stable trajectory tracking.
Task 2 -- Battery Modelling
A MATLAB Function block is used for battery-voltage modelling. The model
takes TotalBattCurr as an input and provides BattVolt to the mapped
motors. State of Charge (SOC) is monitored using a Scope.

Simulation observations reported in the presentation: - Battery
voltage decreases during acceleration. - SOC reduces during skidpad
motion. - Current peaks during cornering.
Task 3 -- Internal Combustion Engine (ICE) Powertrain
For this task, the 4EM powertrain is replaced with an ICE powertrain.
The model uses a Simple Engine block, an RPM-based torque curve, and a
transmission with gear shifting.

Simulation observations reported in the presentation: - Gear
shifting is observed (the output example shows Gear 6). - Driveline RPM
is lower than in the electric powertrain case. - Torque response is
slower. - Engine and transmission behaviour is represented in the
simulation.
4EM and ICE -- Comparison
  Feature                 4EM                     ICE
  Torque response         Instant                 RPM-dependent

  Gearbox                 Not required            Required

  Efficiency              High (as stated in the  Lower (as stated in the
project presentation)   project presentation)

  Control                 Precise                 Mechanical limits
Complexity              Moderate                High
These are the qualitative comparisons presented in the project slides;
no numerical efficiency or lap-time comparison is provided in the
presentation.
Tools and Technologies
- MATLAB
- Simulink
- Simulink Physics -- 7-DOF vehicle model
- MATLAB Function blocks
- Simulink Scope and vehicle visualization
Results
The presentation includes model screenshots and skidpad simulation
outputs for the 4EM, battery-modelling, and ICE tasks. It reports
successful skidpad-dynamics simulation and demonstrates differences in
the observed powertrain behaviour.
Conclusion
The project demonstrates skidpad vehicle-dynamics simulation using the
Simulink Physics 7-DOF model. The 4EM task examines independent motor
torque distribution, the battery task studies voltage and SOC behaviour,
and the ICE task models engine torque and transmission behaviour.
Together, these tasks provide a basis for comparing electric and
internal-combustion powertrain behaviour in a simulated Formula Student
vehicle.
Future Improvements
The project presentation identifies the following possible extensions:
- Add regenerative braking.
- Improve battery thermal modelling.
- Compare lap-time performance.
- Implement advanced torque vectoring.
- Optimize gear ratios.
Team -- Team 1
- Rohith G
- Sanchay
- Rishwana S
- Shivani
- Akshaya
Repository Contents
The repository is intended to contain the MATLAB scripts, Simulink model
files, project image(s), and presentation PDF for the three tasks.
File note: Check that the original Simulink .slx models are
included before publishing. In the supplied folder screenshot, Task 1
and Task 3 appear as .slxc cache files, while Task 2 appears as an
.slx model. A cache file is not a replacement for the original
model.

Getting Started
1. Clone or download this repository.
2. Open MATLAB.
3. Open the relevant .slx model file in Simulink.
4. Run the model using the MATLAB/Simulink environment and required
   Simulink Physics components.
5. Run the corresponding MATLAB script, if applicable, and inspect the
   simulation outputs.
Note: The exact MATLAB release, required toolbox versions, model
configuration details, and execution instructions are not specified in
the project presentation. Confirm these from the working MATLAB
environment before reproducing the simulations.
