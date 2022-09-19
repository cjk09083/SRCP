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

class BatteryStateMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.max_capacity_watt_hours = null;
      this.max_discharge_rate_watts = null;
      this.current_capacity_watt_hours = null;
      this.current_consumption_watts = null;
      this.safe_mode_avail_frac = null;
      this.safe_mode_percent = null;
      this.shutdown_percent = null;
      this.mode = null;
      this.overload = null;
      this.number_of_connections = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('max_capacity_watt_hours')) {
        this.max_capacity_watt_hours = initObj.max_capacity_watt_hours
      }
      else {
        this.max_capacity_watt_hours = 0.0;
      }
      if (initObj.hasOwnProperty('max_discharge_rate_watts')) {
        this.max_discharge_rate_watts = initObj.max_discharge_rate_watts
      }
      else {
        this.max_discharge_rate_watts = 0.0;
      }
      if (initObj.hasOwnProperty('current_capacity_watt_hours')) {
        this.current_capacity_watt_hours = initObj.current_capacity_watt_hours
      }
      else {
        this.current_capacity_watt_hours = 0.0;
      }
      if (initObj.hasOwnProperty('current_consumption_watts')) {
        this.current_consumption_watts = initObj.current_consumption_watts
      }
      else {
        this.current_consumption_watts = 0.0;
      }
      if (initObj.hasOwnProperty('safe_mode_avail_frac')) {
        this.safe_mode_avail_frac = initObj.safe_mode_avail_frac
      }
      else {
        this.safe_mode_avail_frac = 0.0;
      }
      if (initObj.hasOwnProperty('safe_mode_percent')) {
        this.safe_mode_percent = initObj.safe_mode_percent
      }
      else {
        this.safe_mode_percent = 0.0;
      }
      if (initObj.hasOwnProperty('shutdown_percent')) {
        this.shutdown_percent = initObj.shutdown_percent
      }
      else {
        this.shutdown_percent = 0.0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('overload')) {
        this.overload = initObj.overload
      }
      else {
        this.overload = 0;
      }
      if (initObj.hasOwnProperty('number_of_connections')) {
        this.number_of_connections = initObj.number_of_connections
      }
      else {
        this.number_of_connections = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type BatteryStateMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [max_capacity_watt_hours]
    bufferOffset = _serializer.float32(obj.max_capacity_watt_hours, buffer, bufferOffset);
    // Serialize message field [max_discharge_rate_watts]
    bufferOffset = _serializer.float32(obj.max_discharge_rate_watts, buffer, bufferOffset);
    // Serialize message field [current_capacity_watt_hours]
    bufferOffset = _serializer.float32(obj.current_capacity_watt_hours, buffer, bufferOffset);
    // Serialize message field [current_consumption_watts]
    bufferOffset = _serializer.float32(obj.current_consumption_watts, buffer, bufferOffset);
    // Serialize message field [safe_mode_avail_frac]
    bufferOffset = _serializer.float32(obj.safe_mode_avail_frac, buffer, bufferOffset);
    // Serialize message field [safe_mode_percent]
    bufferOffset = _serializer.float32(obj.safe_mode_percent, buffer, bufferOffset);
    // Serialize message field [shutdown_percent]
    bufferOffset = _serializer.float32(obj.shutdown_percent, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.int32(obj.mode, buffer, bufferOffset);
    // Serialize message field [overload]
    bufferOffset = _serializer.int32(obj.overload, buffer, bufferOffset);
    // Serialize message field [number_of_connections]
    bufferOffset = _serializer.int32(obj.number_of_connections, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type BatteryStateMsg
    let len;
    let data = new BatteryStateMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [max_capacity_watt_hours]
    data.max_capacity_watt_hours = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [max_discharge_rate_watts]
    data.max_discharge_rate_watts = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_capacity_watt_hours]
    data.current_capacity_watt_hours = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [current_consumption_watts]
    data.current_consumption_watts = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [safe_mode_avail_frac]
    data.safe_mode_avail_frac = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [safe_mode_percent]
    data.safe_mode_percent = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [shutdown_percent]
    data.shutdown_percent = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [overload]
    data.overload = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [number_of_connections]
    data.number_of_connections = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'srcp2_msgs/BatteryStateMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '6d06a9dfb08ec8e2eec28de188121f4b';
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
    
    Header  header
    
    float32 max_capacity_watt_hours         # maximum capacity of the battery
    float32 max_discharge_rate_watts        # maximum total number of instantaneous watts available
    float32 current_capacity_watt_hours     # current capacity of the battery
    float32 current_consumption_watts       # current power consumption in watts
    float32 safe_mode_avail_frac            # fraction of power available in safe mode
    float32 safe_mode_percent               # power level at which rover functionality is limited
    float32 shutdown_percent                # power level at which rover functionality is halted
    int32 mode                              # mode of the battery, 0 = fully_operation, 1 = power_saving_mode, 2 = emergency_shutdown
    int32 overload                          # 0 = no overload, 1 = overload
    int32 number_of_connections             # number of consumers
    
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
    const resolved = new BatteryStateMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.max_capacity_watt_hours !== undefined) {
      resolved.max_capacity_watt_hours = msg.max_capacity_watt_hours;
    }
    else {
      resolved.max_capacity_watt_hours = 0.0
    }

    if (msg.max_discharge_rate_watts !== undefined) {
      resolved.max_discharge_rate_watts = msg.max_discharge_rate_watts;
    }
    else {
      resolved.max_discharge_rate_watts = 0.0
    }

    if (msg.current_capacity_watt_hours !== undefined) {
      resolved.current_capacity_watt_hours = msg.current_capacity_watt_hours;
    }
    else {
      resolved.current_capacity_watt_hours = 0.0
    }

    if (msg.current_consumption_watts !== undefined) {
      resolved.current_consumption_watts = msg.current_consumption_watts;
    }
    else {
      resolved.current_consumption_watts = 0.0
    }

    if (msg.safe_mode_avail_frac !== undefined) {
      resolved.safe_mode_avail_frac = msg.safe_mode_avail_frac;
    }
    else {
      resolved.safe_mode_avail_frac = 0.0
    }

    if (msg.safe_mode_percent !== undefined) {
      resolved.safe_mode_percent = msg.safe_mode_percent;
    }
    else {
      resolved.safe_mode_percent = 0.0
    }

    if (msg.shutdown_percent !== undefined) {
      resolved.shutdown_percent = msg.shutdown_percent;
    }
    else {
      resolved.shutdown_percent = 0.0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.overload !== undefined) {
      resolved.overload = msg.overload;
    }
    else {
      resolved.overload = 0
    }

    if (msg.number_of_connections !== undefined) {
      resolved.number_of_connections = msg.number_of_connections;
    }
    else {
      resolved.number_of_connections = 0
    }

    return resolved;
    }
};

module.exports = BatteryStateMsg;
