#!/usr/bin/env ruby
#encoding: utf-8

require 'benchmark'

require File.expand_path(File.dirname(__FILE__) + '/../lib/gsm_encoder')


positive_encode = "!\"#¤%&'()*+,-./0123456789:;<=>?¡ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÑÜ§¿abcdefghijklmnopqrstuvwxyzäöñüà^{}\[~]|€"
negative_encode = "!\"#¤%&'()*+,-./0123456789:;<=>?¡ABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÑÜ§¿abcdefghijklmnopqrstuvwxyzäöñüà^{}\[~]|€" + 'привет'
n = 5000

Benchmark.bmbm do |x|
  x.report("positive encode:") { n.times  { GSMEncoder.encode(positive_encode) } }
  x.report("positive can_encode?:") { n.times  { GSMEncoder.can_encode?(positive_encode) } }

  x.report("negative encode:") { n.times  { GSMEncoder.encode(negative_encode) } }
  x.report("negative can_encode?:") { n.times  { GSMEncoder.can_encode?(negative_encode) } }
end