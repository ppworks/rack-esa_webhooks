require 'rack/esa_webhooks/version'
require 'openssl'
require 'json'

module Rack
  class EsaWebhooks
    class Signature
      HMAC_DIGEST = OpenSSL::Digest.new('sha256')

      def initialize(secret, signature_in_header, payload_body)
        @secret = secret
        @signature_in_header = signature_in_header
        @signature = "sha256=#{OpenSSL::HMAC.hexdigest(HMAC_DIGEST, secret, payload_body)}"
      end

      def valid?
        return true unless @secret
        return false unless @signature_in_header
        Rack::Utils.secure_compare(@signature, @signature_in_header)
      end
    end

    def initialize(app, opts = {})
      @app = app
      @secret = opts[:secret]
    end

    def call(env)
      rewind_body(env)
      signature = Signature.new(
        @secret,
        env['HTTP_X_ESA_SIGNATURE'],
        env['rack.input'].read
      )
      return [400, {}, ["Signatures didn't match!"]] unless signature.valid?

      rewind_body(env)
      @app.call(env)
    end

    private

    def rewind_body(env)
      env['rack.input'].rewind if env['rack.input'].respond_to?(:rewind)
    rescue Errno::ESPIPE
    end
  end
end
