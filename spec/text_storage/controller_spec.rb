RSpec.describe TextStorage::Controller do
  before(:all) {@file_path = File.expand_path('../../lib/text_storage/.text_storage.txt', __dir__)}
  after(:each) do
    if File.exist?(@file_path)
      File.delete(@file_path)
    end
  end

  let(:target) { TextStorage::Controller.new }

  context '初期化' do
    example '' do
      file_path = target.instance_variable_get(:@file_path)
      expect(file_path).to eq @file_path
    end
  end
  context '書き込み' do
    example 'append' do
      target.append('abc')
      expect(File.open(@file_path, 'r').read).to eq "abc\n"
    end
    example 'append_uniq' do
      target.append('abc')
      target.append_uniq('abc')
      expect(File.open(@file_path, 'r').read).to eq "abc\n"
    end
  end

  context '読み込み' do
    example 'read' do
      target.append('abc')
      text_array = target.read
      expect(text_array).to eq ['abc']
    end
    example 'truncate' do
      target.append('abc')
      target.truncate
      res = target.read
      expect(res).to eq []
    end
  end
end
