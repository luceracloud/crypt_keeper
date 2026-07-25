require 'active_record'

require 'crypt_keeper/version'
require 'crypt_keeper/model'
require 'crypt_keeper/helper'
require 'crypt_keeper/provider/base'
require 'crypt_keeper/provider/active_support'
require 'crypt_keeper/provider/mysql_aes_new'
require 'crypt_keeper/provider/postgres_base'
require 'crypt_keeper/provider/postgres_pgp'
require 'crypt_keeper/provider/postgres_pgp_public_key'

module CryptKeeper
  class << self
    attr_accessor :stub_encryption
    alias_method :stub_encryption?, :stub_encryption

    attr_accessor :silence_logs
    alias_method :silence_logs?, :silence_logs

    # True for Active Record 7.1+ (including 8.x). The serialize `coder:` API
    # landed in 7.1; MAJOR/MINOR checks incorrectly fail for 8.0 (MINOR == 0).
    def active_record_7_1?
      ActiveRecord.version >= Gem::Version.new("7.1.0")
    end
  end
end

CryptKeeper.stub_encryption = false
