# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from srcp2_msgs/SystemMonitorMsg.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class SystemMonitorMsg(genpy.Message):
  _md5sum = "0899aee3520463f46dd413ba6fef2b62"
  _type = "srcp2_msgs/SystemMonitorMsg"
  _has_header = True  # flag to mark the presence of a Header object
  _full_text = """#
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
"""
  # Pseudo-constants
  POWER_HEALTH_OK = 0
  POWER_HEALTH_LOW = 1
  POWER_HEALTH_EMERGENCY = 2
  BATTERY_MODE_NO_CHANGE = 0
  BATTERY_MODE_CHARGE_HIGH = 1
  BATTERY_MODE_CHARGE_NORMAL = 2
  BATTERY_MODE_CHARGE_SLOW = 3
  BATTERY_MODE_DISCHARGE_HIGH = 4
  BATTERY_MODE_DISCHARGE_NORMAL = 5
  BATTERY_MODE_DISCHARGE_SLOW = 6
  BATTERY_MODE_DISCHARGE_CONSERVE = 7
  BATTERY_MODE_FAST_REPAIR = 8

  __slots__ = ['header','power_health','power_saver','solar_ok','power_demand','battery_mode','power_level','power_rate']
  _slot_types = ['std_msgs/Header','int8','bool','bool','bool','int8','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,power_health,power_saver,solar_ok,power_demand,battery_mode,power_level,power_rate

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(SystemMonitorMsg, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.power_health is None:
        self.power_health = 0
      if self.power_saver is None:
        self.power_saver = False
      if self.solar_ok is None:
        self.solar_ok = False
      if self.power_demand is None:
        self.power_demand = False
      if self.battery_mode is None:
        self.battery_mode = 0
      if self.power_level is None:
        self.power_level = 0.
      if self.power_rate is None:
        self.power_rate = 0.
    else:
      self.header = std_msgs.msg.Header()
      self.power_health = 0
      self.power_saver = False
      self.solar_ok = False
      self.power_demand = False
      self.battery_mode = 0
      self.power_level = 0.
      self.power_rate = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_b3Bb2f().pack(_x.power_health, _x.power_saver, _x.solar_ok, _x.power_demand, _x.battery_mode, _x.power_level, _x.power_rate))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 13
      (_x.power_health, _x.power_saver, _x.solar_ok, _x.power_demand, _x.battery_mode, _x.power_level, _x.power_rate,) = _get_struct_b3Bb2f().unpack(str[start:end])
      self.power_saver = bool(self.power_saver)
      self.solar_ok = bool(self.solar_ok)
      self.power_demand = bool(self.power_demand)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_3I().pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      buff.write(struct.Struct('<I%ss'%length).pack(length, _x))
      _x = self
      buff.write(_get_struct_b3Bb2f().pack(_x.power_health, _x.power_saver, _x.solar_ok, _x.power_demand, _x.battery_mode, _x.power_level, _x.power_rate))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _get_struct_3I().unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8', 'rosmsg')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 13
      (_x.power_health, _x.power_saver, _x.solar_ok, _x.power_demand, _x.battery_mode, _x.power_level, _x.power_rate,) = _get_struct_b3Bb2f().unpack(str[start:end])
      self.power_saver = bool(self.power_saver)
      self.solar_ok = bool(self.solar_ok)
      self.power_demand = bool(self.power_demand)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_3I = None
def _get_struct_3I():
    global _struct_3I
    if _struct_3I is None:
        _struct_3I = struct.Struct("<3I")
    return _struct_3I
_struct_b3Bb2f = None
def _get_struct_b3Bb2f():
    global _struct_b3Bb2f
    if _struct_b3Bb2f is None:
        _struct_b3Bb2f = struct.Struct("<b3Bb2f")
    return _struct_b3Bb2f
