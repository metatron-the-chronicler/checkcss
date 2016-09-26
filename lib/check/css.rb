require 'check/css/version'
require 'bundler/setup'
require 'mini_magick'
require 'pathname'
class CheckCss
=begin rdoc
     @param standard [String] the exemplar to use for the test.
     @param current [String] the current image being checked.
     @param destination [String] the place to save the diff.
=end
 def initialize(standard,current,destination)
   @standard=Pathname.new(standard)
   @current=Pathname.new(current)
   @diff_destination=Pathname.new(destination)
   @compare = MiniMagick::Tool::Compare.new
 end
 def check
   @compare.metric 'RMSE'
   @compare << @standard.realpath.to_s
   @compare << @current.realpath.to_s
   @compare << @diff_destination.realdirpath.to_s
   @compare.call
 end
end
