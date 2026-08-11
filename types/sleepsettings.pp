# @summary Configurations for sleep.conf
# @see https://www.freedesktop.org/software/systemd/man/systemd-sleep.conf.html
#
type Systemd::SleepSettings = Struct[
  {
    Optional['AllowSuspend']               => Variant[Enum['yes','no',''],Systemd::SleepSettings::Ensure],
    Optional['AllowHibernation']           => Variant[Enum['yes','no',''],Systemd::SleepSettings::Ensure],
    Optional['AllowHybridSleep']           => Variant[Enum['yes','no',''],Systemd::SleepSettings::Ensure],
    Optional['AllowSuspendThenHibernate']  => Variant[Enum['yes','no',''],Systemd::SleepSettings::Ensure],
    Optional['SuspendState']               => Variant[String,Systemd::SleepSettings::Ensure],
    Optional['HibernateMode']              => Variant[String,Systemd::SleepSettings::Ensure],
    Optional['MemorySleepMode']            => Variant[String,Systemd::SleepSettings::Ensure],
    Optional['HibernateDelaySec']          => Variant[Systemd::Unit::Timespan,Systemd::SleepSettings::Ensure],
    Optional['HibernateOnACPower']         => Variant[Enum['yes','no',''],Systemd::SleepSettings::Ensure],
    Optional['SuspendEstimationSec']       => Variant[Systemd::Unit::Timespan,Systemd::SleepSettings::Ensure],
  }
]
