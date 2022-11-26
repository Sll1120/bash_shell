
LIDAR = {
    laser_to_robot_pose = {
        x = 0.018,
        y = 0.,
        theta = math.rad(0),
    },
    enable_odom = true,

    -- force save carto.pbstream regardless of MapMeasure process after a run
    enable_force_save_pose_graph = false;

    -- minimum number of inter-trajectory constraints that make relo consideration proceed
    min_num_inter_trajectory_constraints = 3;

    -- maximum allowable variance of translational part of all constraints transforms
    translation_variance_threshold = 0.01;

    -- maximum allowable variance of rotational part of all constraints transforms
    rotation_variance_threshold = 0.01;
}
