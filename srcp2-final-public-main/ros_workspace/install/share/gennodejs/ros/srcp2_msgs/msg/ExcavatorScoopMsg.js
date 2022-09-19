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

class ExcavatorScoopMsg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.volatile_clod_mass = null;
      this.regolith_clod_mass = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('volatile_clod_mass')) {
        this.volatile_clod_mass = initObj.volatile_clod_mass
      }
      else {
        this.volatile_clod_mass = false;
      }
      if (initObj.hasOwnProperty('regolith_clod_mass')) {
        this.regolith_clod_mass = initObj.regolith_clod_mass
      }
      else {
        this.regolith_clod_mass = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ExcavatorScoopMsg
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [volatile_clod_mass]
    bufferOffset = _serializer.bool(obj.volatile_clod_mass, buffer, bufferOffset);
    // Serialize message field [regolith_clod_mass]
    bufferOffset = _serializer.bool(obj.regolith_clod_mass, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ExcavatorScoopMsg
    let len;
    let data = new ExcavatorScoopMsg(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [volatile_clod_mass]
    data.volatile_clod_mass = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [regolith_clod_mass]
    data.regolith_clod_mass = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    return length + 2;
  }

  static datatype() {
    // Returns string type for a message object
    return 'srcp2_msgs/ExcavatorScoopMsg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '218c9d9ac34cff7d7bc66c14b96e45df';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    
    # scoop data
    bool volatile_clod_mass # is volatile mass in scoop
    bool regolith_clod_mass # is regolith mass in scoop
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
    const resolved = new ExcavatorScoopMsg(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.volatile_clod_mass !== undefined) {
      resolved.volatile_clod_mass = msg.volatile_clod_mass;
    }
    else {
      resolved.volatile_clod_mass = false
    }

    if (msg.regolith_clod_mass !== undefined) {
      resolved.regolith_clod_mass = msg.regolith_clod_mass;
    }
    else {
      resolved.regolith_clod_mass = false
    }

    return resolved;
    }
};

module.exports = ExcavatorScoopMsg;
