require 'fileutils'

module DiscourseAtomReceiver
  class AtomFileController < ApplicationController
    skip_before_action :check_xhr

    def self.clear_cached_paths
      @@cached_paths = nil
    end

    def self.cached_paths
      @@cached_paths ||= begin
        Rails.logger.info ">> building cache"
        result = {}
        Discourse.plugins.each do |p|
          Dir.glob("#{File.dirname(p.path)}/**/**.scss") do |f|
            basename = File.basename(f)
            result[basename] ||= []
            result[basename] << f
          end
        end
        result
      end
    end

    def self.touch_changed(file)
      found = AtomFileController.cached_paths[file]
      return false unless found

      found.each do |f|
        FileUtils.touch(f)
      end
      return true
    end

    def index

      file = File.basename(params[:path])
      if file =~ /^[A-Z]:/
        # Windows paths
        file = File.basename(file.sub(/^[^:]:/, '').gsub(/\\/, '/'))
      end

      unless AtomFileController.touch_changed(file)
        # If we couldn't touch it, clear the cache and try again
        AtomFileController.clear_cached_paths
        AtomFileController.touch_changed(file)
      end

      render text: 'OK'
    end
  end
end
