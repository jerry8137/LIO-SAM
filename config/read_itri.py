#!env python
# -*- coding: utf-8 -*-

import sys

import tf
import os
import cv2
import rospy
import rosbag
from tqdm import tqdm
from tf2_msgs.msg import TFMessage
from datetime import datetime
from std_msgs.msg import Header
from sensor_msgs.msg import PointCloud2, CameraInfo, Imu, PointField, NavSatFix
import sensor_msgs.point_cloud2 as pcl2
from geometry_msgs.msg import TransformStamped, TwistStamped, Transform
from cv_bridge import CvBridge
import numpy as np
import argparse
import ipdb
import ros_numpy

bag = rosbag.Bag('/data/itri/2022-04-14-15-21-13_0.bag')
# bag = rosbag.Bag('/data/sample/campus_small_dataset.bag')
for topic, msg, t in bag.read_messages(topics=['/top_lidar_points']):
# for topic, msg, t in bag.read_messages(topics=['/points_raw']):
    arr = ros_numpy.point_cloud2.pointcloud2_to_array(msg)
    ipdb.set_trace()
