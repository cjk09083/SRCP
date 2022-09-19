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

class VolSensorMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.vol_type = null;
      this.distance_to = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('vol_type')) {
        this.vol_type = initObj.vol_type
      }
      else {
        this.vol_type = '';
      }
      if (initObj.hasOwnProperty('distance_to')) {
        this.distance_to = initObj.distance_to
      }
      else {
        this.distance_to = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type VolSensorMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [vol_type]
    bufferOffset = _serializer.string(obj.vol_type, buffer, bufferOffset);
    // Serialize message field [distance_to]
    bufferOffset = _serializer.float32(obj.distance_to, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type VolSensorMsg
    let len;
    let data = new VolSensorMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [vol_type]
    data.vol_type = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [distance_to]
    data.distance_to = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += _getByteLength(object.vol_type);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'srcp2_msgs/VolSensorMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '79d667cc3950eac40bb1e3adee91ec19';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    #
    # Space Robotics Simulation, Phase 2
    # Copyright (c) 2019-2020, NASA-JSC. All Rights Reserved
    # Unauthorized copying or distribution of this code is strictly prohibited
    #
    # Volatile Sensor query message.
    #
    Header      header
    string      vol_type         # the type name string
    float32     distance_to      # absolute distance from sensor to volatile (meters)
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
    const resolved = new VolSensorMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.vol_type !== undefined) {
      resolved.vol_type = msg.vol_type;
    }
    else {
      resolved.vol_type = ''
    }

    if (msg.distance_to !== undefined) {
      resolved.distance_to = msg.distance_to;
    }
    else {
      resolved.distance_to = 0.0
    }

    return resolved;
    }
};

module.exports = VolSensorMsg;
