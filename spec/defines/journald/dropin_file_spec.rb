# frozen_string_literal: true

require 'spec_helper'

describe 'systemd::journald::dropin_file' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) { facts }
        let(:title) { 'test.conf' }
        let(:params) do
          {
            content: <<~EOF,
              [Journal]
              Storage=persistent
            EOF
          }
        end

        it { is_expected.to compile.with_all_deps }

        it {
          is_expected.to contain_file('/etc/systemd/journald.conf.d')
            .with_ensure('directory')
            .with_recurse(false)
            .with_purge(false)
            .with_selinux_ignore_defaults(false)
        }

        it {
          is_expected.to contain_file('/etc/systemd/journald.conf.d/test.conf')
            .with_content(%r{\[Journal\]\nStorage=persistent})
        }

        it {
          is_expected.to contain_service('systemd-journald')
            .that_subscribes_to('File[/etc/systemd/journald.conf.d/test.conf]')
        }

        context 'with owner defined' do
          let(:params) { super().merge(owner: 'testuser') }

          it {
            is_expected.to contain_file('/etc/systemd/journald.conf.d/test.conf')
              .with_owner('testuser')
          }
        end

        context 'with group defined' do
          let(:params) { super().merge(group: 'testgroup') }

          it {
            is_expected.to contain_file('/etc/systemd/journald.conf.d/test.conf')
              .with_group('testgroup')
          }
        end

        context 'with mode defined' do
          let(:params) { super().merge(mode: '0644') }

          it { is_expected.to contain_file('/etc/systemd/journald.conf.d/test.conf').with_mode('0644') }
        end

        context 'with notify_journald set to false' do
          let(:params) { super().merge(notify_journald: false) }

          it {
            is_expected.not_to contain_service('systemd-journald')
              .that_subscribes_to('File[/etc/systemd/journald.conf.d/test.conf]')
          }
        end

        context 'with purge_dropin_dirs set to true' do
          let(:pre_condition) { 'class { "systemd": journald_purge_dropin_dirs => true }' }

          it {
            is_expected.to contain_file('/etc/systemd/journald.conf.d/')
              .with_purge(true)
              .with_recurse(true)
          }
        end

        context 'with ensure set to absent' do
          let(:params) { super().merge(ensure: 'absent') }

          it { is_expected.to contain_file('/etc/systemd/journald.conf.d/test.conf').with_ensure('absent') }
        end

        context 'with systemd::manage_journald set to false' do
          let(:pre_condition) { 'class { "systemd": manage_journald => false }' }

          it { is_expected.to compile.and_raise_error(%r{systemd::journald::dropin_file is disabled because systemd::manage_journald is set to false}) }
        end
      end
    end
  end
end
