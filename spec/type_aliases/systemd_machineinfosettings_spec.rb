# frozen_string_literal: true

require 'spec_helper'

describe 'Systemd::MachineInfoSettings' do
  it { is_expected.to allow_value({ 'PRETTY_HOSTNAME' => '' }) }
  it { is_expected.to allow_value({ 'PRETTY_HOSTNAME' => 'example' }) }
  it { is_expected.to allow_value({ 'ICON_NAME' => '' }) }
  it { is_expected.to allow_value({ 'ICON_NAME' => 'computer' }) }
  it { is_expected.to allow_value({ 'CHASSIS' => '' }) }
  it { is_expected.to allow_value({ 'CHASSIS' => 'server' }) }
  it { is_expected.to allow_value({ 'DEPLOYMENT' => '' }) }
  it { is_expected.to allow_value({ 'DEPLOYMENT' => 'production' }) }
  it { is_expected.to allow_value({ 'LOCATION' => '' }) }
  it { is_expected.to allow_value({ 'LOCATION' => 'Home' }) }
  it { is_expected.to allow_value({ 'HARDWARE_MODEL' => '' }) }
  it { is_expected.to allow_value({ 'HARDWARE_MODEL' => 'fake model' }) }
  it { is_expected.to allow_value({ 'HARDWARE_SKU' => '' }) }
  it { is_expected.to allow_value({ 'HARDWARE_SKU' => 'fake sku' }) }
  it { is_expected.to allow_value({ 'HARDWARE_VENDOR' => '' }) }
  it { is_expected.to allow_value({ 'HARDWARE_VENDOR' => 'fake vendor' }) }
  it { is_expected.to allow_value({ 'HARDWARE_VERSION' => '' }) }
  it { is_expected.to allow_value({ 'HARDWARE_VERSION' => 'fake version' }) }
  it { is_expected.to allow_value({ 'TAGS' => '' }) }
  it { is_expected.to allow_value({ 'TAGS' => 'sometag' }) }
  it { is_expected.to allow_value({ 'TAGS' => 'some:tag' }) }
end
