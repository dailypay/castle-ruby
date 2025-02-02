# frozen_string_literal: true

module Castle
  module Commands
    # builder for impersonate command
    class EndImpersonation
      class << self
        # @param options [Hash]
        # @return [Castle::Command]
        def build(options = {})
          Castle::Validators::Present.call(options, %i[user_id headers])
          context = Castle::Context::Sanitize.call(options[:context])

          Castle::Command.new(
            'impersonate',
            options.merge(context: context, sent_at: Castle::Utils::GetTimestamp.call),
            :delete
          )
        end
      end
    end
  end
end
