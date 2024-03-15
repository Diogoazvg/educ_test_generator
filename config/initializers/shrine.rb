# frozen_string_literal: true

require 'shrine'
require 'shrine/storage/memory'
require 'shrine/storage/s3'

if Rails.env.test?
  Shrine.storages = {
    cache: Shrine.storages[:store] = Shrine::Storage::Memory.new(prefix: 'cache'),
    store: Shrine.storages[:store] = Shrine::Storage::Memory.new
  }
else
  s3_options = {
    endpoint: ENV.fetch('AWS_ENDPOINT', 'http://localhost:9000'),
    access_key_id: ENV.fetch('AWS_KEY_ID', 'uO9eKLOI8CUanhxfhK8k'),
    secret_access_key: ENV.fetch('AWS_SECRET_KEY', 'hoZbPVLdrzkgfhDA2skbGAdK30ldwD0EzE2SvR6b'),
    bucket: ENV.fetch('S3_BUCKET', 'educ-generator-dev'),
    region: ENV.fetch('AWS_REGION', 'us-east-1'),
    force_path_style: true
  }.compact

  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: 'cache', **s3_options), # temporary
    store: Shrine::Storage::S3.new(**s3_options) # permanent
  }
end

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data # for retaining the cached file across form redisplays
Shrine.plugin :derivatives
Shrine.plugin :instrumentation, notifications: ActiveSupport::Notifications unless Rails.env.test?
Shrine.plugin :remove_invalid
Shrine.plugin :restore_cached_data # re-extract metadata when attaching a cached file
Shrine.plugin :signature
Shrine.plugin :validation
Shrine.plugin :validation_helpers
