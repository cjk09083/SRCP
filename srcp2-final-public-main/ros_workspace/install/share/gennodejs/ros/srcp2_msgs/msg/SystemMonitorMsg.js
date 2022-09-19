// Auto-generated. Do not edit!

// (in-package srcp2_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SystemMonitorMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.power_health = null;
      this.power_saver = null;
      this.solar_ok = null;
      this.power_demand = null;
      this.battery_mode = null;
      this.power_level = null;
      this.power_rate = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('power_health')) {
        this.power_health = initObj.power_health
      }
      else {
        this.power_health = 0;
      }
      if (initObj.hasOwnProperty('power_saver')) {
        this.power_saver = initObj.power_saver
      }
      else {
        this.power_saver = false;
      }
      if (initObj.hasOwnProperty('solar_ok')) {
        this.solar_ok = initObj.solar_ok
      }
      else {
        this.solar_ok = false;
      }
      if (initObj.hasOwnProperty('power_demand')) {
        this.power_demand = initObj.power_demand
      }
      else {
        this.power_demand = false;
      }
      if (initObj.hasOwnProperty('battery_mode')) {
        this.battery_mode = initObj.battery_mode
      }
      else {
        this.battery_mode = 0;
      }
      if (initObj.hasOwnProperty('power_level')) {
        this.power_level = initObj.power_level
      }
      else {
        this.power_level = 0.0;
      }
      if (initObj.hasOwnProperty('power_rate')) {
        this.power_rate = initObj.power_rate
      }
      else {
        this.power_rate = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SystemMonitorMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [power_health]
    bufferOffset = _serializer.int8(obj.power_health, buffer, bufferOffset);
    // Serialize message field [power_saver]
    bufferOffset = _serializer.bool(obj.power_saver, buffer, bufferOffset);
    // Serialize message field [solar_ok]
    bufferOffset = _serializer.bool(obj.solar_ok, buffer, bufferOffset);
    // Serialize message field [power_demand]
    bufferOffset = _serializer.bool(obj.power_demand, buffer, bufferOffset);
    // Serialize message field [battery_mode]
    bufferOffset = _serializer.int8(obj.battery_mode, buffer, bufferOffset);
    // Serialize message field [power_level]
    bufferOffset = _serializer.float32(obj.power_level, buffer, bufferOffset);
    // Serialize message field [power_rate]
    bufferOffset = _serializer.float32(obj.power_rate, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SystemMonitorMsg
    let len;
    let data = new SystemMonitorMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [power_health]
    data.power_health = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [power_saver]
    data.power_saver = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [solar_ok]
    data.solar_ok = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [power_demand]
    data.power_demand = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [battery_mode]
    data.battery_mode = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [power_level]
    data.power_level = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [power_rate]
    data.power_rate = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'srcp2_msgs/SystemMonitorMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0899aee3520463f46dd413ba6fef2b62';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Space Robotics Simulation, Phase 2
    # Copyright (c) 2019, NASA-JSC. All Rights Reserved
    # Unauthorized copying or distribution of this code is strictly prohibited
    #
    # 
    # This message allows battery of a robot to communicate how much power is left
    #
    
    # Power State Constants
    uint8 POWER_HEALTH_OK        = 0
    uint8 POWER_HEALTH_LOW       = 1
    uint8 POWER_HEALTH_EMERGENCY = 2
    
    # Battery Mode Constants
    uint8 BATTERY_MODE_NO_CHANGE       =0
    uint8 BATTERY_MODE_CHARGE_HIGH     =1
    uint8 BATTERY_MODE_CHARGE_NORMAL   =2
    uint8 BATTERY_MODE_CHARGE_SLOW     =3
    uint8 BATTERY_MODE_DISCHARGE_HIGH  =4
    uint8 BATTERY_MODE_DISCHARGE_NORMAL=5
    uint8 BATTERY_MODE_DISCHARGE_SLOW  =6
    uint8 BATTERY_MODE_DISCHARGE_CONSERVE  =7
    uint8 BATTERY_MODE_FAST_REPAIR     =8
    
    
    #*************** The message **************
    Header  header
    
    int8    power_health    #
    bool    power_saver     #
    bool    solar_ok        #
    bool    power_demand    #
    int8    battery_mode    #
    float32 power_level     #
    float32 power_rate      #
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SystemMonitorMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.power_health !== undefined) {
      resolved.power_health = msg.power_health;
    }
    else {
      resolved.power_health = 0
    }

    if (msg.power_saver !== undefined) {
      resolved.power_saver = msg.power_saver;
    }
    else {
      resolved.power_saver = false
    }

    if (msg.solar_ok !== undefined) {
      resolved.solar_ok = msg.solar_ok;
    }
    else {
      resolved.solar_ok = false
    }

    if (msg.power_demand !== undefined) {
      resolved.power_demand = msg.power_demand;
    }
    else {
      resolved.power_demand = false
    }

    if (msg.battery_mode !== undefined) {
      resolved.battery_mode = msg.battery_mode;
    }
    else {
      resolved.battery_mode = 0
    }

    if (msg.power_level !== undefined) {
      resolved.power_level = msg.power_level;
    }
    else {
      resolved.power_level = 0.0
    }

    if (msg.power_rate !== undefined) {
      resolved.power_rate = msg.power_rate;
    }
    else {
      resolved.power_rate = 0.0
    }

    return resolved;
    }
};

// Constants for message
SystemMonitorMsg.Constants = {
  POWER_HEALTH_OK: 0,
  POWER_HEALTH_LOW: 1,
  POWER_HEALTH_EMERGENCY: 2,
  BATTERY_MODE_NO_CHANGE: 0,
  BATTERY_MODE_CHARGE_HIGH: 1,
  BATTERY_MODE_CHARGE_NORMAL: 2,
  BATTERY_MODE_CHARGE_SLOW: 3,
  BATTERY_MODE_DISCHARGE_HIGH: 4,
  BATTERY_MODE_DISCHARGE_NORMAL: 5,
  BATTERY_MODE_DISCHARGE_SLOW: 6,
  BATTERY_MODE_DISCHARGE_CONSERVE: 7,
  BATTERY_MODE_FAST_REPAIR: 8,
}

module.exports = SystemMonitorMsg;
