// Generated by gencpp from file srcp2_msgs/SystemPowerSaveSrvRequest.msg
// DO NOT EDIT!


#ifndef SRCP2_MSGS_MESSAGE_SYSTEMPOWERSAVESRVREQUEST_H
#define SRCP2_MSGS_MESSAGE_SYSTEMPOWERSAVESRVREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace srcp2_msgs
{
template <class ContainerAllocator>
struct SystemPowerSaveSrvRequest_
{
  typedef SystemPowerSaveSrvRequest_<ContainerAllocator> Type;

  SystemPowerSaveSrvRequest_()
    : power_save(false)  {
    }
  SystemPowerSaveSrvRequest_(const ContainerAllocator& _alloc)
    : power_save(false)  {
  (void)_alloc;
    }



   typedef uint8_t _power_save_type;
  _power_save_type power_save;





  typedef boost::shared_ptr< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SystemPowerSaveSrvRequest_

typedef ::srcp2_msgs::SystemPowerSaveSrvRequest_<std::allocator<void> > SystemPowerSaveSrvRequest;

typedef boost::shared_ptr< ::srcp2_msgs::SystemPowerSaveSrvRequest > SystemPowerSaveSrvRequestPtr;
typedef boost::shared_ptr< ::srcp2_msgs::SystemPowerSaveSrvRequest const> SystemPowerSaveSrvRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator1> & lhs, const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator2> & rhs)
{
  return lhs.power_save == rhs.power_save;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator1> & lhs, const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace srcp2_msgs

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "998b7585d22f359014b545da29bfc6f2";
  }

  static const char* value(const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x998b7585d22f3590ULL;
  static const uint64_t static_value2 = 0x14b545da29bfc6f2ULL;
};

template<class ContainerAllocator>
struct DataType< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "srcp2_msgs/SystemPowerSaveSrvRequest";
  }

  static const char* value(const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "#\n"
"# Space Robotics Simulation, Phase 2\n"
"# Copyright (c) 2019, NASA-JSC. All Rights Reserved\n"
"# Unauthorized copying or distribution of this code is strictly prohibited\n"
"#\n"
"bool power_save\n"
;
  }

  static const char* value(const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.power_save);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SystemPowerSaveSrvRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::srcp2_msgs::SystemPowerSaveSrvRequest_<ContainerAllocator>& v)
  {
    s << indent << "power_save: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.power_save);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SRCP2_MSGS_MESSAGE_SYSTEMPOWERSAVESRVREQUEST_H
