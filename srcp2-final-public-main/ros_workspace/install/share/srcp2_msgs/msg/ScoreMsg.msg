#
# Space Robotics Simulation, Phase 2
# Copyright (c) 2021, NASA-JSC. All Rights Reserved
# Unauthorized copying or distribution of this code is strictly prohibited
#
# 
# This message publishes the current score, and volatile collection state
# for this simulation
#
Header header

# scoring data
float64 score # the current total score for this sim
float64 hauler_volatile_score # the score of all the volatiles currently held in hauler bins (tie-breaker #1)

# collection data (indexes align) -- this is for competitor information and used in tie-breaking
string[] types_collected      # which types have been collected to date?
float64[] masses_collected_kg # how much each type?