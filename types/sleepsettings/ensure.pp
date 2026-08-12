# @summary Ensure parameter for sleep.conf settings
type Systemd::SleepSettings::Ensure = Struct[
  {
    Optional['ensure'] => Enum['present', 'absent'],
    Optional['value']  => Any,
  }
]
