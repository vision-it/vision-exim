require 'spec_helper_acceptance'

describe 'vision_exim' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-FILE
        class { 'vision_exim':
         catch_all_alias => 'foo_bar',
         catch_all_email => 'for@bar.de',
         mailserver      => 'localhost',
        }
      FILE

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_failures: true)
    end
  end

  context 'services' do
    describe service('exim4') do
      it { should be_running }
    end
  end

  context 'provisioned files' do
    describe file('/etc/exim4/conf.d/router/160_exim4-config_vision') do
      it { is_expected.to contain 'This file is managed by puppet' }
      it { is_expected.to be_file }
    end

    describe file('/etc/exim4/update-exim4.conf.conf') do
      it { is_expected.to contain 'This file is managed by puppet' }
      it { is_expected.to be_file }
    end

    describe file('/etc/mailname') do
      it { is_expected.to be_file }
    end
  end
end
