#!/usr/bin/env python3

"""
SRCP2 Terrain Heightmap Generation
Copyright (c) NASA-JSC 2020. All Rights Reserved
Unauthorized Distribution Strictly Prohibited

This python script generates an image used for the lunar terrain heightmap
"""

import numpy as np
import argparse
import os
import sys
import random
import math

from PIL import Image, ImageDraw

from heightmap_filters import HeightmapFilters

defaultHeightmapPath = "/tmp/srcp2/"
defaultHeightmapFolder = "heightmap_images/"
defaultImageFileName = "heightmap.png"

arenaPixelBufferSize = 50
totalMetersOfHeightmapRadius = 200
totalMetersOfHeightmapHeight = 3
maxGrayscaleNumber = 255
arenaBoundaryDefaultHeight = maxGrayscaleNumber//2 - 35
outsideArenaBoundaryDefaultMeters = maxGrayscaleNumber


def create_base_heightmap(resolution, height_scaling):
    """
    Creates heightmap matrix and intializes matricies values as 0.0
    :param resolution: this is the square resolution of the image array
    """
    initial_array = np.zeros(shape=(resolution, resolution))
    initial_heightmap = Image.fromarray(initial_array, mode='L')

    outside_arena_boundary_height = math.floor(
        outsideArenaBoundaryDefaultMeters*height_scaling)

    draw = ImageDraw.Draw(initial_heightmap)
    draw.rectangle((0, 0, resolution,
                    resolution), fill=outside_arena_boundary_height)

    return initial_heightmap


def save_heightmap(heightmap, image_path):
    """
    Saves heightmap as a image given by the input parameter image_path
    :param heightmap: this is a 2D numpy array of floats that defines the heightmap
    :param image_path: this is the path to the image created
    """
    if not os.path.isdir(os.path.dirname(image_path)):
        raise Exception(
            'save_heightmap function: Image name for heightmap does not exist')
    heightmap.save(image_path, mode='L')


def pixel_conversion(conversion_ratio, terrain_meters):
    return math.floor(terrain_meters / conversion_ratio)


def main():
    """
    This is the main method for when this module is used as an executable
    """
    # Default values (changable with command line parse)
    resolution = 1025
    seed = None
    display = False
    heightmap_blur_number = 2
    height_scaling = 1.0
    min_boundary_height = math.ceil(totalMetersOfHeightmapHeight * 0.1)
    verbose = False

    arena_boundary_properties = {
        'max_radius': 1025,
        'min_radius': 1025,
        'max_height': arenaBoundaryDefaultHeight,
        'min_height': arenaBoundaryDefaultHeight,
        'width': 0,
        'sigma': 3.0,
    }

    hill_properties = {
        'number_of': 45,
        'max_radius': 8,
        'min_radius': 6,
        'max_height': 2*arenaBoundaryDefaultHeight//3,
        'min_height': arenaBoundaryDefaultHeight//2,
        'width': 0,
    }

    crater_properties = {
        'number_of': 45,
        'max_radius': 7,
        'min_radius': 5,
        'max_height': -arenaBoundaryDefaultHeight//2,
        'min_height': -2*arenaBoundaryDefaultHeight//3,
        'width': 2,
    }

    rock_properties = {
        'number_of': 300,
        'max_radius': 2,
        'min_radius': 1,
        'max_height': arenaBoundaryDefaultHeight//2,
        'min_height': arenaBoundaryDefaultHeight//3,
        'width': 0,
    }

    # Starting Zone Properties
    starting_zone_properties = {
        'x_radius': 100,
        'y_radius': 100,
        'height': 0,
        'width': 0,
        'x_pixel': 0,
        'y_pixel': 0,
    }

    if not os.path.isdir(os.path.dirname(defaultHeightmapPath)):
        os.mkdir(defaultHeightmapPath)

    folder_path = defaultHeightmapPath + defaultHeightmapFolder

    if not os.path.isdir(os.path.dirname(folder_path)):
        os.mkdir(folder_path)

    image_path = folder_path + defaultImageFileName

    parser = argparse.ArgumentParser()
    parser.add_argument(
        '--resolution', help="square resolution of heightmap image this is also used for the arena boundary radius", type=int)
    parser.add_argument(
        '--display', help="displays the heightmap image", action='store_true')
    parser.add_argument(
        '--arena-boundary-height', help="height of arena boundary in meters", type=float)
    parser.add_argument(
        '--arena-boundary-width', help="width of the outside line around the arena boundary in meters", type=float)
    parser.add_argument(
        '--arena-boundary-sigma', help="gaussian sigma value used for smoothing arena boundary", type=float)
    parser.add_argument(
        '--number-of-hills', help="number of hills in the generated heightmap", type=int)
    parser.add_argument(
        '--hill-radius-min', help="minimum radius in meters of hills", type=float)
    parser.add_argument(
        '--hill-radius-max', help="maximum radius in meters of hills", type=float)
    parser.add_argument(
        '--hill-height-min', help="minimum height of hills in meters", type=float)
    parser.add_argument(
        '--hill-height-max', help="maximum height of hills in meters", type=float)
    parser.add_argument(
        '--number-of-craters', help="number of hills in the generated heightmap", type=int)
    parser.add_argument(
        '--crater-radius-min', help="minimum radius in meters of craters (negative value)", type=float)
    parser.add_argument(
        '--crater-radius-max', help="maximum radius in meters of craters (negative value)", type=float)
    parser.add_argument(
        '--crater-height-min', help="minimum height of craters in meters", type=float)
    parser.add_argument(
        '--crater-height-max', help="maximum height of craters in meters", type=float)
    parser.add_argument(
        '--heightmap-blur-number', help="blur number for heightmap used to blur heightmap before rocks and starting area are added", type=int)
    parser.add_argument(
        '--number-of-rocks', help="number of rocks in the generated heightmap", type=int)
    parser.add_argument(
        '--rock-radius-min', help="minimum radius in meters of rocks", type=float)
    parser.add_argument(
        '--rock-radius-max', help="maximum radius in meters of rocks", type=float)
    parser.add_argument(
        '--rock-height-min', help="minimum height of rocks in meters", type=float)
    parser.add_argument(
        '--rock-height-max', help="maximum height of rocks in meters", type=float)
    parser.add_argument(
        '--starting-zone-radius', help="radius in meters of starting zone", type=float)
    parser.add_argument(
        '--starting-zone-height', help="height of starting zone in meters", type=float)
    parser.add_argument(
        '--starting-zone-x-location', help="sets the x location in pixels of the starting location (note the starting location mid point is resolution/2, resolution/2)", type=int)
    parser.add_argument(
        '--starting-zone-y-location', help="sets the y location in pixels of the starting location (note the starting location mid point is resolution/2, resolution/2)", type=int)
    parser.add_argument(
        '--seed', help="sets the seed number for random terrain generation", type=int)
    parser.add_argument(
        '--file-path', help="sets heightmap file path", type=str)
    parser.add_argument(
        '--verbose', help="prints to the console the terrain settings used for heightmap generation", action='store_true')
    args = parser.parse_args()

    if args.resolution:
        resolution = args.resolution

    # Sets starting zone x pixel, y pixel location
    starting_zone_properties['x_pixel'] = resolution//2 + \
        (resolution//1025)
    starting_zone_properties['y_pixel'] = resolution//2 + \
        (resolution//1025)

    meters_per_pixel_xy = totalMetersOfHeightmapRadius/resolution
    meters_per_grayscale_z = totalMetersOfHeightmapHeight/maxGrayscaleNumber

    if resolution % 2 != 1:
        raise Exception(f"\t[ Generate Heightmap ]: Resolution must be (2^n+1) by (2^n+1) pixels for Gazebo to spawn heightmap, resolution is set at {resolution}.")

    if args.display:
        display = args.display

    arena_boundary_properties['max_radius'] = resolution - \
        arenaPixelBufferSize
    arena_boundary_properties['min_radius'] = resolution - \
        arenaPixelBufferSize
    if arena_boundary_properties['min_radius'] > arena_boundary_properties['max_radius']:
        raise Exception(f"\t[ Generate Heightmap ]: arena radius range minimum of {arena_boundary_properties['min_radius']} is \
            greater than arena radius range maximum of {arena_boundary_properties['max_radius']}")
    if arena_boundary_properties['min_radius'] < meters_per_pixel_xy:
        raise Exception(f"\t[ Generate Heightmap ]: arena radius range minimum of {arena_boundary_properties['min_radius']} is \
        less than 1 pixel size on image")

    if args.arena_boundary_height:
        if not min_boundary_height < args.arena_boundary_height < totalMetersOfHeightmapHeight:
            raise Exception(f"\t[ Generate Heightmap ]: arena boundary height must be within range {min_boundary_height} to {totalMetersOfHeightmapHeight} meters")
        height_scaling *= pixel_conversion(meters_per_grayscale_z,
                                           args.arena_boundary_height) / arena_boundary_properties['max_height']
        arena_boundary_properties['max_height'] = pixel_conversion(
            meters_per_grayscale_z, args.arena_boundary_height)
        arena_boundary_properties['min_height'] = pixel_conversion(
            meters_per_grayscale_z, args.arena_boundary_height)

    if arena_boundary_properties['min_height'] > arena_boundary_properties['max_height']:
        raise Exception(f"\t[ Generate Heightmap ]: arena boundary height range minimum of {arena_boundary_properties['min_height']} is \
            greater than arena boundary height range maximum of {arena_boundary_properties['max_height']}")
    if args.arena_boundary_width:
        arena_boundary_properties['width'] = pixel_conversion(
            meters_per_pixel_xy, args.arena_boundary_width)
    if args.arena_boundary_sigma:
        arena_boundary_properties['sigma'] = args.arena_boundary_sigma

    if args.number_of_hills:
        hill_properties['number_of'] = args.number_of_hills
    if args.hill_radius_min:
        hill_properties['min_radius'] = pixel_conversion(
            meters_per_pixel_xy, args.hill_radius_min)
    if args.hill_radius_max:
        hill_properties['max_radius'] = pixel_conversion(
            meters_per_pixel_xy, args.hill_radius_max)
    if hill_properties['min_radius'] > hill_properties['max_radius']:
        raise Exception(f"\t[ Generate Heightmap ]: hill radius range minimum of {hill_properties['min_radius']} is \
            greater than hill radius range maximum of {hill_properties['max_radius']}")
    if hill_properties['min_radius'] < meters_per_pixel_xy:
        raise Exception(f"\t[ Generate Heightmap ]: hill radius range minimum of {hill_properties['min_radius']} is \
        less than 1 pixel size on image")

    if args.hill_height_min:
        hill_properties['min_height'] = pixel_conversion(
            meters_per_grayscale_z, args.hill_height_min)
    if args.hill_height_max:
        hill_properties['max_height'] = pixel_conversion(
            meters_per_grayscale_z, args.hill_height_max)
    if hill_properties['min_height'] > hill_properties['max_height']:
        raise Exception(f"\t[ Generate Heightmap ]: hill height range minimum of {hill_properties['min_height']} is \
            greater than hill height range maximum of {hill_properties['max_height']}")

    if args.number_of_craters:
        crater_properties['number_of'] = args.number_of_craters
    if args.crater_radius_min:
        crater_properties['min_radius'] = pixel_conversion(
            meters_per_pixel_xy, args.crater_radius_min)
    if args.crater_radius_max:
        crater_properties['max_radius'] = pixel_conversion(
            meters_per_pixel_xy, args.crater_radius_max)
    if crater_properties['min_radius'] > crater_properties['max_radius']:
        raise Exception(f"\t[ Generate Heightmap ]: crater radius range minimum of {crater_properties['min_radius']} is \
            greater than crater radius range maximum of {crater_properties['max_radius']}")
    if crater_properties['min_radius'] < meters_per_pixel_xy:
        raise Exception(f"\t[ Generate Heightmap ]: crater radius range minimum of {crater_properties['min_radius']} is \
        less than 1 pixel size on image")

    if args.crater_height_min:
        crater_properties['min_height'] = pixel_conversion(
            meters_per_grayscale_z, args.crater_height_min)
    if args.crater_height_max:
        crater_properties['max_height'] = pixel_conversion(
            meters_per_grayscale_z, args.crater_height_max)
    if crater_properties['min_height'] > crater_properties['max_height']:
        raise Exception(f"\t[ Generate Heightmap ]: crater radius range minimum of {crater_properties['min_height']} is \
            greater than crater radius range maximum of {crater_properties['max_height']}")

    if args.heightmap_blur_number:
        heightmap_blur_number = args.heightmap_blur_number

    if args.number_of_rocks:
        rock_properties['number_of'] = args.number_of_rocks
    if args.rock_radius_min:
        rock_properties['min_radius'] = pixel_conversion(
            meters_per_pixel_xy, args.rock_radius_min)
    if args.rock_radius_max:
        rock_properties['max_radius'] = pixel_conversion(
            meters_per_pixel_xy, args.rock_radius_max)
    if rock_properties['min_radius'] > rock_properties['max_radius']:
        raise Exception(f"\t[ Generate Heightmap ]: rock radius range minimum of {rock_properties['min_radius']} is \
            greater than rock radius range maximum of {rock_properties['max_radius']}")
    if rock_properties['min_radius'] < meters_per_pixel_xy:
        raise Exception(f"\t[ Generate Heightmap ]: rock radius range minimum of {rock_properties['min_radius']} is \
        less than 1 pixel size on image")

    if args.rock_height_min:
        rock_properties['min_height'] = pixel_conversion(
            meters_per_grayscale_z, args.rock_height_min)
    if args.rock_height_max:
        rock_properties['max_height'] = pixel_conversion(
            meters_per_grayscale_z, args.rock_height_max)
    if rock_properties['min_height'] > rock_properties['max_height']:
        raise Exception(f"\t[ Generate Heightmap ]: rock height range minimum of {rock_properties['min_height']} is \
            greater than rock height range maximum of {rock_properties['max_height']}")

    if args.starting_zone_radius:
        starting_zone_properties['radius'] = pixel_conversion(
            meters_per_pixel_xy, args.starting_zone_radius)
    if args.starting_zone_height:
        starting_zone_properties['height'] = pixel_conversion(
            meters_per_grayscale_z, args.starting_zone_height)

    if args.starting_zone_x_location:
        starting_zone_properties['x_pixel'] = args.starting_zone_x_location + resolution//2
    if args.starting_zone_y_location:
        starting_zone_properties['y_pixel'] = args.starting_zone_y_location + resolution//2

    if args.verbose:
        verbose = args.verbose

    starting_zone_properties['height'] = math.floor(
        starting_zone_properties['height'] * height_scaling) + arena_boundary_properties['max_height']
    hill_properties['min_height'] = math.floor(
        hill_properties['min_height'] * height_scaling) + arena_boundary_properties['max_height']
    hill_properties['max_height'] = math.floor(
        hill_properties['max_height'] * height_scaling) + arena_boundary_properties['max_height']
    crater_properties['min_height'] = abs(math.floor(
        crater_properties['min_height'] * height_scaling) + arena_boundary_properties['max_height'])
    crater_properties['max_height'] = abs(math.floor(
        crater_properties['max_height'] * height_scaling) + arena_boundary_properties['max_height'])
    rock_properties['min_height'] = math.floor(
        rock_properties['min_height'] * height_scaling) + arena_boundary_properties['max_height']
    rock_properties['max_height'] = math.floor(
        rock_properties['max_height'] * height_scaling) + arena_boundary_properties['max_height']

    starting_zone_properties['width'] = math.floor(
        starting_zone_properties['width'] * height_scaling)
    hill_properties['width'] = math.floor(
        hill_properties['width'] * height_scaling)
    crater_properties['width'] = math.floor(
        crater_properties['width'] * height_scaling)
    rock_properties['width'] = math.floor(
        rock_properties['width'] * height_scaling)

    if args.seed:
        seed = args.seed
        random.seed(seed)
    else:
        seed = random.seed()

    if args.file_path:
        image_path = args.file_path

    # Initialize the heightmap
    initial_heightmap = create_base_heightmap(
        resolution, height_scaling)

    # Create the heightmap's terrain
    heightmap_filters_node = HeightmapFilters(resolution, initial_heightmap)
    heightmap_filters_node.generate_arena_boundary(arena_boundary_properties)
    heightmap_filters_node.smooth_starting_zone(starting_zone_properties)
    heightmap_filters_node.generate_hills(hill_properties)
    heightmap_filters_node.generate_craters(crater_properties)
    heightmap_filters_node.smooth_heightmap(heightmap_blur_number)
    heightmap_filters_node.generate_rocks(rock_properties)
    final_heightmap = heightmap_filters_node.get_heightmap()

    # Save and display the heightmap
    save_heightmap(final_heightmap, image_path)
    if display:
        final_heightmap.show()

    if verbose:
        print(f"\nTerrain settings used in current heightmap:\n")
        print(f"-----------------------------------------------------------------------\n")
        print(f"Resolution:\n {resolution}x{resolution} pixels\n")
        print(f"Total x,y map size:\n {totalMetersOfHeightmapRadius}x{totalMetersOfHeightmapRadius} meters\n")
        print(f"Total z map size:\n {totalMetersOfHeightmapHeight} meters\n")
        print(f"Arena boundary properties:\n {arena_boundary_properties}\n")
        print(f"Starting zone properties:\n {starting_zone_properties}\n")
        print(f"Hill properties:\n {hill_properties}\n")
        print(f"Crater properties:\n {crater_properties}\n")
        print(f"Rock properties:\n {rock_properties}\n")
        print(f"Outside arena boundary height:\n {outsideArenaBoundaryDefaultMeters} grayscale\n")
        print(f"Height scaling multiplier:\n {height_scaling}\n")
        print(f"Heightmap blur amount:\n {heightmap_blur_number} blurs\n")
        print(f"Current seed:\n {seed}\n")
        print(f"Meters per pixel (x,y):\n {meters_per_pixel_xy}\n")
        print(f"Meters per grayscale integer (z):\n {meters_per_grayscale_z}\n")
        print(f"Heightmap saved in location:\n {image_path}\n")
        print(f"-----------------------------------------------------------------------\n")

    return 0


if __name__ == '__main__':
    ret = 0
    try:
        ret = main()
    except Exception as e:
        print(e)
    sys.exit(ret)
