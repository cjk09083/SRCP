#!/usr/bin/env python3

"""
SRCP2 Heightmap Filters
Copyright (c) NASA-JSC 2020. All Rights Reserved
Unauthorized Distribution Strictly Prohibited

This python module contains the functions to create heightmap filters
"""

import numpy as np
import os
import math
from PIL import Image, ImageDraw, ImageFilter, ImageOps
import random

arenaPixelBufferSize = 50
terrainSizeTypes = 6
rockSizeTypes = 3
terrainOutlineMultiplier = 1.25
totalTerrainFeatureAttempts = 100


class HeightmapFilters:
    """
    This class is used to create the heightmap, and contains the randomization
    filters used for runtime heightmap generation
    """

    def __init__(self, resolution, heightmap):
        """
        Initialization of HeightmapFilters
        :param resolution: this is an array that contains the square size of the image
        :param heightmap: this is a 2D numpy array of floats that defines the heightmap
        """
        self._resolution = resolution
        self._filled_map = np.zeros(shape=(resolution, resolution))
        self._heightmap = heightmap
        self._boundary_height = 0
        self._boundary_x_radius = 0
        self._boundary_y_radius = 0
        self._boundary_width = 0
        self._starting_zone_x_position = 0
        self._starting_zone_y_position = 0
        self._starting_zone_x_radius = 0
        self._starting_zone_y_radius = 0
        self._max_hill_height = 0

    def generate_arena_boundary(self, arena_boundary_properties):
        """
        Insertion of crater arena_boundary into heightmap
        :param arena_boundary_properties: this is a dict that contains the arena boundary properties
        """
        randomized_arena_boundary_properties = self._randomize_terrain_properties(
            arena_boundary_properties)
        self._add_arena_boundary(
            randomized_arena_boundary_properties, arena_boundary_properties['width'])
        self._boundary_height = randomized_arena_boundary_properties['height']
        self._boundary_x_radius = randomized_arena_boundary_properties[
            'x_radius']
        self._boundary_y_radius = randomized_arena_boundary_properties[
            'y_radius']
        self._boundary_width = arena_boundary_properties['width']
        self._smooth_terrain(arena_boundary_properties['sigma'])

    def generate_hills(self, hill_properties):
        """
        Insertion of hills into heightmap
        :param hill_properties: this is a dict that contains the hill properties given in the generate heightmap script
        """
        self._max_hill_height = hill_properties['max_height']

        for i in range(0, hill_properties['number_of']):
            new_hill_properties = self._randomize_terrain_properties(
                hill_properties, i)
            self._add_terrain(
                new_hill_properties)

    def generate_craters(self, crater_properties):
        """
        Insertion of craters into heightmap
        :param crater_properties: this is a dict that contains the crater properties given in the generate heightmap script
        """
        for i in range(0, crater_properties['number_of']):
            new_crater = self._randomize_terrain_properties(
                crater_properties, i)
            self._add_terrain(new_crater)

    def smooth_heightmap(self, heightmap_blur_number):
        """
        Smooths heightmap after creating terrain features
        :param heightmap_blur_number: this is the amount of times to blur the image
        """
        for _ in range(0, heightmap_blur_number):
            self._heightmap = self._heightmap.filter(
                ImageFilter.GaussianBlur(radius=4))

    def generate_rocks(self, rock_properties):
        """
        Insertion of rocks into heightmap
        :param rock_properties: this is a dict that contains the hill properties given in the generate heightmap script
        """
        for i in range(0, rock_properties['number_of']):
            new_rock = self._randomize_terrain_properties(
                rock_properties, i % rockSizeTypes)
            self._add_terrain(new_rock, True)
        self._smooth_terrain(1.0)

    def smooth_starting_zone(self, starting_zone_properties):
        """
        Creates a smooth starting location to spawn the rovers initially
        :param starting_zone_properties: this is a dict that contains the starting zone properties given in the generate heightmap script
        """
        self._starting_zone_x_position = starting_zone_properties['x_pixel']
        self._starting_zone_y_position = starting_zone_properties['y_pixel']
        self._starting_zone_x_radius = starting_zone_properties['x_radius']
        self._starting_zone_y_radius = starting_zone_properties['y_radius']

        location = {
            'x_pixel': starting_zone_properties['x_pixel'],
            'y_pixel': starting_zone_properties['y_pixel'],
        }

        self._fill_heightmap(
            location, starting_zone_properties, starting_zone_properties['width'])
        self._set_filled(
            starting_zone_properties['x_pixel'], starting_zone_properties['y_pixel'], starting_zone_properties)

    def get_heightmap(self):
        # self._heightmap = ImageOps.autocontrast(self._heightmap)
        return self._heightmap

    def _randomize_terrain_properties(self, properties, index=0):
        """
        Initialization of terrain features
        :param properties: this dict contains properties of the terrain such as radius and height
        """
        # This adds a multiplier to the terrain size, +1 so that the size multiplier is never 0
        terrain_size_multiplier = (index % terrainSizeTypes) + 1

        # Get the radius range and randomize the size
        x_radius = self._get_random_range(
            properties['min_radius'], properties['max_radius']) * terrain_size_multiplier
        y_radius = self._get_random_range(
            properties['min_radius'], properties['max_radius']) * terrain_size_multiplier

        # Get the height and randomize the size
        height = self._get_random_range(
            properties['min_height'], properties['max_height'])

        width = properties['width'] * terrain_size_multiplier

        terrain_features = {
            'x_radius': x_radius,
            'y_radius': y_radius,
            'height': height,
            'width': width,
        }

        return terrain_features

    def _add_arena_boundary(self, arena_boundary_properties, width):
        """
        Adds bounding crater based off of heightmap size
        :param arena_boundary: this is a dict that contains the randomized arena boundary properties
        :param width: this is the width of the boundary outline used in the image
        """
        draw = ImageDraw.Draw(self._heightmap)
        halfBufferSize = arenaPixelBufferSize//2
        draw.ellipse((halfBufferSize, halfBufferSize, arena_boundary_properties['x_radius'] + halfBufferSize,
                      arena_boundary_properties['y_radius'] + halfBufferSize), outline='white', fill=arena_boundary_properties['height'], width=width)

    def _smooth_terrain(self, sigma):
        """
        Smooths terrain based off of given image in heightmap
        :param sigma: this is the value used to blur the image
        """
        self._heightmap = self._heightmap.filter(
            ImageFilter.GaussianBlur(radius=sigma))

    def _add_terrain(self, terrain_properties, is_rock=False):
        """
        Adds designated terrain at given unfilled location
        :param terrain_properties: this is a dict that contains the randomized terrain properties
        """
        terrain_location = self._get_terrain_location(
            terrain_properties, is_rock)
        # If terrain is a rock then set the height of the rock based off of the current terrain location's height
        if is_rock:
            pixels = self._heightmap.load()
            terrain_properties['height'] += pixels[terrain_location['x_pixel'],
                                                   terrain_location['y_pixel']] - self._boundary_height
        self._fill_heightmap(
            terrain_location, terrain_properties, terrain_properties['width'])

    def _get_random_range(self, min_value, max_value):
        """
        Creates random float from min_value to max_value
        :param min_value: the minimum value to randomize
        :param max_value: the maximum value to randomize
        """
        # If min value == max value for randrange then an error occurs
        if min_value == max_value:
            return min_value
        else:
            return random.randrange(min_value, max_value)

    def _get_terrain_location(self, terrain_properties, is_rock):
        """
        Randomly finds a location that is not occupied by another terrain and returns that unoccupied location
        :param terrain_properties: this is a dict that contains the randomized terrain properties
        """
        location = {
            'x_pixel': -1,
            'y_pixel': -1,
        }
        location_set = False
        pixels = self._heightmap.load()
        attempts = 0

        starting_zone_x_min = self._starting_zone_x_position - self._starting_zone_x_radius
        starting_zone_x_max = self._starting_zone_x_position + self._starting_zone_x_radius
        starting_zone_y_min = self._starting_zone_y_position - self._starting_zone_y_radius
        starting_zone_y_max = self._starting_zone_y_position + self._starting_zone_y_radius

        # Checks to see if the location is filled at x_loc, y_loc
        while not location_set:
            x_loc = self._get_random_range(0, self._boundary_x_radius)
            y_loc = self._get_random_range(0, self._boundary_y_radius)
            attempts += 1
            if attempts > totalTerrainFeatureAttempts:
                raise Exception(f"\t[Heightmap Filters ]: attempts to generate terrain exceeded {totalTerrainFeatureAttempts} attempts. \
                                The terrain parameters are too high for this specific resolution")
            # If the terrain feature is a rock then give a location within the arena boundary and not in the starting zone
            if is_rock:
                if pixels[x_loc, y_loc] <= self._max_hill_height and not (starting_zone_x_min < x_loc < starting_zone_x_max and starting_zone_y_min < y_loc < starting_zone_y_max):
                    location = self._add_location_buffer(
                        x_loc, y_loc, terrain_properties)
                    location_set = True
            # Checks to see if the pixels are within the boundary and not occupied by a crater, hill, or starting zone
            else:
                while pixels[x_loc, y_loc] == self._boundary_height and not self._is_filled(x_loc, y_loc, terrain_properties):
                    self._set_filled(x_loc, y_loc, terrain_properties)
                    location = self._add_location_buffer(
                        x_loc, y_loc, terrain_properties)
                    location_set = True

        return location

    def _fill_heightmap(self, location, terrain_properties, width):
        """
        Fills heightmap with terrain type at given location
        :param location: this is the [x,y] pixel location in the heightmap that is unoccupied
        :param terrain_properties: this is a dict that contains the randomized terrain properties
        :param width: this the width of the outside boundary of the drawn terrain feature
        """
        ellipse_x_min = location['x_pixel'] - \
            math.floor(terrain_properties['x_radius'])
        ellipse_y_min = location['y_pixel'] - \
            math.floor(terrain_properties['y_radius'])
        ellipse_x_max = location['x_pixel'] + \
            math.floor(terrain_properties['x_radius'])
        ellipse_y_max = location['y_pixel'] + \
            math.floor(terrain_properties['y_radius'])

        ellipse_xy = [ellipse_x_min, ellipse_y_min,
                      ellipse_x_max, ellipse_y_max]

        draw = ImageDraw.Draw(self._heightmap)
        draw.ellipse(
            ellipse_xy, outline=math.ceil(terrain_properties['height'] + terrainOutlineMultiplier * self._boundary_height), fill=terrain_properties['height'], width=width)

    def _is_filled(self, x, y, terrain_properties):
        """
        Checks to see if heightmap at certain location is occupied/filled
        :param x: x pixel location in the heightmap where the terrain is drawn
        :param y: y pixel location in the heightmap where the terrain is drawn
        :param terrain_properties: this is a dict that contains the randomized terrain properties
        """
        is_filled = False

        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                if self._filled_map[x+x_radius][y+y_radius]:
                    is_filled = True

        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                if self._filled_map[x-x_radius][y-y_radius]:
                    is_filled = True

        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                if self._filled_map[x+x_radius][y-y_radius]:
                    is_filled = True

        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                if self._filled_map[x-x_radius][y+y_radius]:
                    is_filled = True

        return is_filled

    def _set_filled(self, x, y, terrain_properties):
        """
        Marks location as filled
        :param x: x pixel location in the heightmap where the terrain is drawn
        :param y: y pixel location in the heightmap where the terrain is drawn
        :param terrain_properties: this is a dict that contains the randomized terrain properties
        """
        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                self._filled_map[x+x_radius][y+y_radius] = True

        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                self._filled_map[x-x_radius][y-y_radius] = True

        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                self._filled_map[x+x_radius][y-y_radius] = True

        for x_radius in range(0, terrain_properties['x_radius']):
            for y_radius in range(0, terrain_properties['y_radius']):
                self._filled_map[x-x_radius][y+y_radius] = True

    def _add_location_buffer(self, x, y, terrain_properties):
        """
        Adds a terrain radius sized buffer to the x, y terrain location based off of the image resolution
        :param x: x pixel location in the heightmap where the terrain is drawn
        :param y: y pixel location in the heightmap where the terrain is drawn
        :param terrain_properties: this is a dict that contains the randomized terrain properties
        """
        location = {
            'x_pixel': x,
            'y_pixel': y,
        }

        if x >= self._resolution//2:
            location['x_pixel'] = x - terrain_properties['x_radius']
        else:
            location['x_pixel'] = x + terrain_properties['x_radius']

        if y >= self._resolution//2:
            location['y_pixel'] = y - terrain_properties['y_radius']
        else:
            location['y_pixel'] = y + terrain_properties['y_radius']

        return location
