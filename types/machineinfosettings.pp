# Matches Systemd machine-info (hostnamectl) file Struct
type Systemd::MachineInfoSettings = Struct[
  {
    Optional['PRETTY_HOSTNAME']  => String,
    Optional['ICON_NAME']        => String,
    Optional['CHASSIS']          => String,
    Optional['DEPLOYMENT']       => String,
    Optional['LOCATION']         => String,
    Optional['HARDWARE_MODEL']   => String,
    Optional['HARDWARE_SKU']     => String,
    Optional['HARDWARE_VENDOR']  => String,
    Optional['HARDWARE_VERSION'] => String,
    Optional['TAGS']             => String,
  }
]
