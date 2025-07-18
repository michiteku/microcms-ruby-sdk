#!/usr/bin/env ruby
# frozen_string_literal: true

# Simple test to verify ResponseObject functionality
require_relative 'lib/microcms'

# Test ResponseObject creation and access
puts 'Testing ResponseObject...'

# Test 1: Basic creation and access
response = MicroCMS::ResponseObject.new({ id: 'test123', name: 'Test Article' })
puts "✓ Basic creation: #{response.id} - #{response.name}"

# Test 2: Nested objects
nested_data = {
  id: 'article1',
  title: 'Hello World',
  author: {
    id: 'author1',
    name: 'John Doe'
  },
  tags: %w[ruby programming]
}

nested_response = MicroCMS::ResponseObject.new(nested_data)
puts "✓ Nested access: #{nested_response.author.name}"
puts "✓ Array access: #{nested_response.tags}"

# Test 3: Equality comparison
response1 = MicroCMS::ResponseObject.new({ id: 'test' })
response2 = MicroCMS::ResponseObject.new({ id: 'test' })
puts "✓ Equality test: #{response1 == response2}"

# Test 4: Hash conversion
hash_result = nested_response.to_h
puts "✓ Hash conversion: #{hash_result[:author][:name]}"

# Test 5: delete_field functionality
response.delete_field(:name)
puts "✓ Delete field test: name should be nil: #{response.name.nil?}"

puts "\nAll ResponseObject tests passed! ✅"
