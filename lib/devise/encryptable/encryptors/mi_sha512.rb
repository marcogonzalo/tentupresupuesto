# lib/devise/encryptable/encryptors/sha512.rb
require "digest/sha2"

module Devise
  module Encryptable
    module Encryptors
      # = Sha512
      # Uses the Sha512 hash algorithm to encrypt passwords.
      class MiSha512 < Base
        # Generates a default password digest based on salt, pepper and the
        # incoming password.
        def self.digest(password, stretches, salt, pepper)
          digest = salt
          stretches.times { digest = self.secure_digest(salt, password, digest, pepper) }
          digest
        end

      private

        # Generate a Sha512 digest joining args. Generated token is something like
        #   --arg1--arg2--arg3--argN--
        def self.secure_digest(*tokens)
          ::Digest::SHA512.hexdigest('##' << tokens.flatten.join('::') << '##')
        end
      end
    end
  end
end