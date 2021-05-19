module Minitest
  def self.plugin_hyperbolic_init(options)
    Minitest.reporter.reporters.clear
    Minitest.reporter << Reporters::HyperbolicReporter.new(options[:io], options)
  end
end
