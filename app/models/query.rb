class Query < ApplicationRecord
  serialize :facts, Array

  enum kind: [:random, :category, :words]

  validates_presence_of :kind
  validates_length_of :input, minimum: 3
end
