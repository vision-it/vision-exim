require 'spec_helper_acceptance'

describe 'vision_exim::client' do
  context 'with defaults' do
    it 'idempotentlies run' do
      pp = <<-FILE
        class { 'vision_exim::client':
        }
      FILE

      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end
  end

  context 'services running' do
    describe service('exim4') do
      it { should be_running }
    end
  end

  context 'provisioned files' do
    describe file('/etc/exim4/update-exim4.conf.conf') do
      it { is_expected.to be_file }
      its(:content) { is_expected.to match 'Puppet' }
      its(:content) { is_expected.to match 'mail.service' }
    end

    describe file('/etc/mailname') do
      it { is_expected.to be_file }
      its(:content) { is_expected.to match 'debian' }
    end
  end
end
