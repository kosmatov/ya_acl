require 'spec_helper'

describe YaAcl::Builder do
  it 'should be add role' do
    acl = YaAcl::Builder.build do
      roles do
        role :admin, :name => 'Administrator'
      end
    end
    
    acl.roles.first.include?(:admin).should be_true
  end

  it 'should be add resource' do
    acl = YaAcl::Builder.build do
      resources do
        resource 'controller_name' do
          index :allow => [:admin]
        end
      end
    end
    acl.check!('controller_name', :index, :admin).should be_true
  end
end