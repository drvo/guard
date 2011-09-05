require 'spec_helper'

describe "Travis CI" do
  let(:file) { @fixture_path.join("test.txt") }

  after do
    File.delete(file)
  end

  it "runs the ctime test" do
    FileUtils.touch(file)
    puts "File created. ctime: #{ File.ctime(file).to_i }, mtime: #{ File.mtime(file).to_i }"

    sleep 2

    FileUtils.touch(file)
    puts "File touched. ctime: #{ File.ctime(file).to_i }, mtime: #{ File.mtime(file).to_i }"

    sleep 2

    File.open(file, 'w') do |file|
      file.write('test')
    end
    puts "File content changed. ctime: #{ File.ctime(file).to_i }, mtime: #{ File.mtime(file).to_i }"
  end

end
