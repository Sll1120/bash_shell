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

TRAJECTORY_BUILDER_2D = {
  use_imu_data = true,

  -- (Zihan)
  -- whether use odom interpolation for part of range data
  use_interpolation = false,
  -- latest range ray time minus latest imu/odom data time in seconds
  -- range data with time diff larger than this will not be extrapolated
  max_range_data_leading_time = 1e6, -- disabled for now

  min_range = 0.2,
  max_range = 5.,
  min_z = -0.8,
  max_z = 2.0,
  missing_data_ray_length = 5.,
  num_accumulated_range_data = 8,
  voxel_filter_size = 0.03,

  adaptive_voxel_filter = {
    max_length = 0.6,
    min_num_points = 200,
    max_range = 50.,
  },

  loop_closure_adaptive_voxel_filter = {
    max_length = 1,
    min_num_points = 120,
    max_range = 50.,
  },

  use_online_correlative_scan_matching = false,
  real_time_correlative_scan_matcher = {
    -- wuch
    -- if we lose 2.0s data, the robot will move 0.5m, we set 0.6 makes it robust
    linear_search_window  = 0.25, 
    angular_search_window = math.rad(20.),
    translation_delta_cost_weight = 1e-1,
    rotation_delta_cost_weight = 1e-1,
  },

  ceres_scan_matcher = {
    occupied_space_weight = 1.,
    translation_weight = 2,
    rotation_weight = 50,
    ceres_solver_options = {
      use_nonmonotonic_steps = false,
      max_num_iterations = 10,
      num_threads = 1,
    },
    sliding_window_size = 4,
    match_method_switch_condition = 90,
  },

  motion_filter = {
    max_time_seconds = 5.,
    max_distance_meters = 0.20,
    max_angle_radians = math.rad(90.),
  },

  imu_gravity_time_constant = 10.,

  -- (Zihan)
  time_threshold_for_multi_step_integration = 0.8,

  submaps = {
    num_range_data = 90,
    grid_options_2d = {
      grid_type = "PROBABILITY_GRID",
      resolution = 0.06,
    },
    range_data_inserter = {
      range_data_inserter_type = "PROBABILITY_GRID_INSERTER_2D",
      probability_grid_range_data_inserter = {
        insert_free_space = true,
        hit_probability = 0.58,
        miss_probability = 0.49,
      },
    },
  },

  match_score_low = 0.3,
  match_score_high = 0.75,
  match_lost_thres = 10,
}
