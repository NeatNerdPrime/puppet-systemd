# frozen_string_literal: true

require 'spec_helper'

describe 'Systemd::Timespan' do
  it { is_expected.to allow_value('') }
  it { is_expected.to allow_value('infinity') }
  it { is_expected.to allow_value(10) }
  it { is_expected.to allow_value('5m') }

  it { is_expected.not_to allow_value('daily') }
  it { is_expected.not_to allow_value(-1) }
end
