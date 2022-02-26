class Query < ApplicationRecord
  serialize :facts, Array

  enum kind: [:random, :category, :words]
end
