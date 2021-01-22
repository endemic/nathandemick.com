module Jekyll
  module EpochTimestampFilter
    def epoch_timestamp(timestamp)
      timestamp.to_i
    end
  end
end

Liquid::Template.register_filter(Jekyll::EpochTimestampFilter)
