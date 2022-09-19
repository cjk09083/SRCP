
"use strict";

let BrakeRoverSrv = require('./BrakeRoverSrv.js')
let PidListSrv = require('./PidListSrv.js')
let SpotLightSrv = require('./SpotLightSrv.js')
let ChargingStationSrv = require('./ChargingStationSrv.js')
let StartStopSrv = require('./StartStopSrv.js')
let LocalizationSrv = require('./LocalizationSrv.js')
let SystemPowerSaveSrv = require('./SystemPowerSaveSrv.js')
let PidTuningSrv = require('./PidTuningSrv.js')

module.exports = {
  BrakeRoverSrv: BrakeRoverSrv,
  PidListSrv: PidListSrv,
  SpotLightSrv: SpotLightSrv,
  ChargingStationSrv: ChargingStationSrv,
  StartStopSrv: StartStopSrv,
  LocalizationSrv: LocalizationSrv,
  SystemPowerSaveSrv: SystemPowerSaveSrv,
  PidTuningSrv: PidTuningSrv,
};
