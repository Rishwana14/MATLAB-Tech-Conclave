open_system('vdynblksskidpad')
powertrainType = 'EV4EM';
finalDriveType = 'Direct';

set_param('vdynblksskidpad/Formula Student Vehicle/Simulink Physics - 7DOF/Powertrain & Driveline/Powertrain','LabelModeActiveChoice',powertrainType);

set_param('vdynblksskidpad/Formula Student Vehicle/Simulink Physics - 7DOF/Powertrain & Driveline/Final Drive','LabelModeActiveChoice',finalDriveType);
