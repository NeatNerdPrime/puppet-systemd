# @api private
# @summary This class manages and configures journald.
# @see https://www.freedesktop.org/software/systemd/man/journald.conf.html
class systemd::journald (
) {
  assert_private()
  include systemd
  service { 'systemd-journald':
    ensure => running,
  }
  if $systemd::journald_use_etc_conf {
    $systemd::journald_settings.each |$option, $value| {
      ini_setting {
        $option:
          path    => '/etc/systemd/journald.conf',
          section => 'Journal',
          setting => $option,
          notify  => Service['systemd-journald'],
      }
      if $value =~ Hash {
        Ini_setting[$option] {
          * => $value,
        }
      } else {
        Ini_setting[$option] {
          value => $value,
        }
      }
    }
  }
}
