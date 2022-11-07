module Closeable
  extend ActiveSupport::Concern

  def close
    self.update(access_token: nil)
    self.closed!
  end
end
