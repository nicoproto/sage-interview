class Query < ApplicationRecord
  serialize :facts, Array

  enum kind: [:random, :category, :words]

  validates_presence_of :kind
end
