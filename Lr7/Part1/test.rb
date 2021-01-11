# frozen_string_literal: true

require './source'
require 'minitest/autorun'

class FilesTest < Minitest::Test
  def setup
    @input_file_name = 'F_test.txt'
    @output_file_name = 'G_test.txt'
    @lines = ['one two three', 'RANdOM StrinG', 'UNIT Test']

    create_input_file(input_file_name, lines)
  end

  def test_several_lines
    write_to_output_file(input_file_name, output_file_name, lines)
    assert(File.exist?(input_file_name))
    assert(File.exist?(output_file_name))
    assert_equal(File.size(input_file_name), File.size(output_file_name))
    assert_equal(File.open(output_file_name).readlines, File.open(input_file_name).readlines.map(&:downcase))
  end

  def teardown
    File.delete(input_file_name) if File.exist?(input_file_name)
    File.delete(output_file_name) if File.exist?(output_file_name)
  end

  private
  attr_reader :input_file_name, :output_file_name, :lines
end
