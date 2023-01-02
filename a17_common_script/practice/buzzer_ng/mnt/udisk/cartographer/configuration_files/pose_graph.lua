-- Copyright 2016 The Cartographer Authors
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--      http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

POSE_GRAPH = {
  optimize_every_n_nodes = 90,

  max_submap_num = 100,

  -- (Zihan) should be set to false ONLY when optimize_every_n_nodes is set to 0
  -- to totally disable back-end of cartographer
  enable_inter_submap_constraints_computation = true,

  constraint_builder = {
    sampling_ratio = 0.005,
    max_constraint_distance = 5.,
    min_score = 0.75,
    -- (wuch) a little low because we want more relocal
    global_localization_min_score = 0.5,

    -- (Zihan) min number of points of the accumulated, gravity_aligned and filtered range data
    -- that can be used to compute inter-submap constraints to decrease false constraint rate
    min_num_gravity_aligned_filtered_range = 100,

    loop_closure_translation_weight = 1.1e4,
    loop_closure_rotation_weight = 1e5,
    log_matches = true,

    fast_correlative_scan_matcher = {
      linear_search_window = 5.,
      angular_search_window = math.rad(20.),
      branch_and_bound_depth = 7,
    },
    ceres_scan_matcher = {
      occupied_space_weight = 20.,
      translation_weight = 10.,
      rotation_weight = 1.,
      ceres_solver_options = {
        use_nonmonotonic_steps = true,
        max_num_iterations = 10,
        num_threads = 1,
      },
      sliding_window_size = 0,
      match_method_switch_condition = 0,
    },
  },
  matcher_translation_weight = 5e2,
  matcher_rotation_weight = 1.6e3,
  odom_translation_weight = 1.1e4,
  odom_rotation_weight = 1e5,

  optimization_problem = {
    huber_scale = 1e2,
    acceleration_weight = 1e3,
    rotation_weight = 3e5,
    local_slam_pose_translation_weight = 1e5,
    local_slam_pose_rotation_weight = 1e1,
    odometry_translation_weight = 1e3,
    odometry_rotation_weight = 1e3,
    fixed_frame_pose_translation_weight = 0,
    fixed_frame_pose_rotation_weight = 0,
    log_solver_summary = false,
    use_online_imu_extrinsics_in_3d = false,
    fix_z_in_3d = false,
    ceres_solver_options = {
      use_nonmonotonic_steps = false,
      max_num_iterations = 50,
      num_threads = 1,
    },

    -- (Zihan) whether to cache sensor data in the optimization problem
    -- currently odometry data can be interpolated to build additional edges to punish the constraints edges
    -- but still could be disabled OR lowered down of its odometry_translation_weight and odometry_rotation_weight
    -- if odometry source can be unreliable or scan-submap-matched edges are reliable enough
    -- imu data and cloud data are only needed to be cached if want to save dataset for replay
    cache_all_imu_data = false,
    cache_all_odometry_data = false;
    cache_all_cloud_data = false;
    save_all_sensor_dataset = false;
  },
  max_num_final_iterations = 200,

  -- (Zihan)
  initial_submaps_number_to_relocalize = 1,
  initial_global_sampling_ratio = 1,

  local_sampling_ratio = 0.01,

  -- should be bigger than PM nums
  max_loop_every_node = 2.0,
  global_sampling_ratio = 0.005,
  log_residual_histograms = true,
  global_constraint_search_after_n_seconds = 10.,
  
  overlapping_submaps_trimmer_2d = {
    fresh_submaps_count = 2,
    min_covered_area = 0.5,
    min_added_submaps_count = 1e6, -- disabled for now
  },

  -- (Zihan) enter into node deletion process once newly added nodes exceeds min_added_fresh_nodes,
  -- judge if the nodes number inside every voxel_side_length-by-voxel_side_length square exceeds
  -- max_nodes_remained_per_voxel, then try to remove the nodes with odd indexes, in the meantime
  -- make sure the remaining nodes number in each voxel not less than min_nodes_remained_per_voxel,
  -- and the remaining nodes number in each submap not less than min_nodes_remained_per_submap.
  voxel_nodes_trimmer_2d = {
    voxel_side_length = 1.,
    keep_every_n_nodes = 2,
    max_nodes_remained_per_voxel = 10,
    min_nodes_remained_per_voxel = 3,
    min_nodes_remained_per_submap = 5,
    min_added_fresh_nodes = 1e6, -- disabled for now
  },

  -- (wuch)
  kmeans_theta_threshold = math.rad(20.),
  kmeans_distance_threshold = 1.00,
  kmeans_theta_weight = 10,
  kmeans_distance_weight = 1,
  kmeans_inlier_threshold = 5,

  relocal_every_n_nodes = 10,
  -- (wuch) theortically, 60 second will generate 60 node, 6 constraint will be built with 0.1 ratio sampler.
  relocal_continuous_time_threshold = 60,
  relocal_continuous_count_threshold = 3,
  relocal_time_limit = 2*60, 

  update_handle_every_n_nodes = 30,
  update_handle_finish_thresh = 3,

  relocal_frequency = 1./60,
}
