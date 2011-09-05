require 'spec_helper'

describe "Travis CI" do
  let(:file) { @fixture_path.join("test.txt") }

  after do
    File.delete(file)
  end

  it "moves ctime and mtime when working with the file" do
    FileUtils.touch(file)

    ctime = File.ctime(file).to_i
    mtime = File.mtime(file).to_i
    puts "File created. ctime: #{ ctime }, mtime: #{ mtime }"

    ctime.should eql mtime

    sleep 2

    FileUtils.touch(file)

    ctime = File.ctime(file).to_i
    mtime = File.mtime(file).to_i
    puts "File touched. ctime: #{ File.ctime(file).to_i }, mtime: #{ File.mtime(file).to_i }"

    ctime.should eql mtime

    sleep 2

    File.open(file, 'w') do |file|
      file.write('test')
    end

    ctime = File.ctime(file).to_i
    mtime = File.mtime(file).to_i
    puts "File changed. ctime: #{ File.ctime(file).to_i }, mtime: #{ File.mtime(file).to_i }"

    ctime.should eql mtime
  end

end
