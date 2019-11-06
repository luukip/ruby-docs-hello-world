##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Conversations < Domain
      class V1 < Version
        class ConversationContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class MessageList < ListResource
            ##
            # Initialize the MessageList
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this message.
            # @return [MessageList] MessageList
            def initialize(version, conversation_sid: nil)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid}
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Messages"
            end

            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] author The channel specific identifier of the message's author.
            #   Defaults to `system`.
            # @param [String] body The content of the message, can be up to 1,600 characters
            #   long.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated. `null`
            #   if the message has not been edited.
            # @param [String] attributes A string metadata field you can use to store any data
            #   you wish. The string value must contain structurally valid JSON if specified.
            #   **Note** that if the attributes are not set "{}" will be returned.
            # @param [String] media_sid The Media Sid to be attached to the new Message.
            # @return [MessageInstance] Newly created MessageInstance
            def create(author: :unset, body: :unset, date_created: :unset, date_updated: :unset, attributes: :unset, media_sid: :unset)
              data = Twilio::Values.of({
                  'Author' => author,
                  'Body' => body,
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                  'Attributes' => attributes,
                  'MediaSid' => media_sid,
              })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              MessageInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Lists MessageInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records.  If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(limit: nil, page_size: nil)
              self.stream(limit: limit, page_size: page_size).entries
            end

            ##
            # Streams MessageInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #    guarantees to never return more than limit. Default is no limit.
            # @param [Integer] page_size Number of records to fetch per request, when
            #    not set will use the default value of 50 records. If no page_size is defined
            #    but a limit is defined, stream() will attempt to read the limit with the most
            #    efficient page size, i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
            end

            ##
            # When passed a block, yields MessageInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            def each
              limits = @version.read_limits

              page = self.page(page_size: limits[:page_size], )

              @version.stream(page,
                              limit: limits[:limit],
                              page_limit: limits[:page_limit]).each {|x| yield x}
            end

            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of MessageInstance
            def page(page_token: :unset, page_number: :unset, page_size: :unset)
              params = Twilio::Values.of({
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              })
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              MessagePage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of MessageInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of MessageInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              MessagePage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Conversations.V1.MessageList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class MessagePage < Page
            ##
            # Initialize the MessagePage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [MessagePage] MessagePage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of MessageInstance
            # @param [Hash] payload Payload response from the API
            # @return [MessageInstance] MessageInstance
            def get_instance(payload)
              MessageInstance.new(@version, payload, conversation_sid: @solution[:conversation_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Conversations.V1.MessagePage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class MessageContext < InstanceContext
            ##
            # Initialize the MessageContext
            # @param [Version] version Version that contains the resource
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this message.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [MessageContext] MessageContext
            def initialize(version, conversation_sid, sid)
              super(version)

              # Path Solution
              @solution = {conversation_sid: conversation_sid, sid: sid, }
              @uri = "/Conversations/#{@solution[:conversation_sid]}/Messages/#{@solution[:sid]}"
            end

            ##
            # Update the MessageInstance
            # @param [String] author The channel specific identifier of the message's author.
            #   Defaults to `system`.
            # @param [String] body The content of the message, can be up to 1,600 characters
            #   long.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated. `null`
            #   if the message has not been edited.
            # @param [String] attributes A string metadata field you can use to store any data
            #   you wish. The string value must contain structurally valid JSON if specified.
            #   **Note** that if the attributes are not set "{}" will be returned.
            # @return [MessageInstance] Updated MessageInstance
            def update(author: :unset, body: :unset, date_created: :unset, date_updated: :unset, attributes: :unset)
              data = Twilio::Values.of({
                  'Author' => author,
                  'Body' => body,
                  'DateCreated' => Twilio.serialize_iso8601_datetime(date_created),
                  'DateUpdated' => Twilio.serialize_iso8601_datetime(date_updated),
                  'Attributes' => attributes,
              })

              payload = @version.update(
                  'POST',
                  @uri,
                  data: data,
              )

              MessageInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Deletes the MessageInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              MessageInstance.new(
                  @version,
                  payload,
                  conversation_sid: @solution[:conversation_sid],
                  sid: @solution[:sid],
              )
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.MessageContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Conversations.V1.MessageContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains beta products that are subject to change. Use them with caution.
          class MessageInstance < InstanceResource
            ##
            # Initialize the MessageInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] conversation_sid The unique id of the
            #   [Conversation](https://www.twilio.com/docs/conversations/api/conversation-resource) for this message.
            # @param [String] sid A 34 character string that uniquely identifies this
            #   resource.
            # @return [MessageInstance] MessageInstance
            def initialize(version, payload, conversation_sid: nil, sid: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'conversation_sid' => payload['conversation_sid'],
                  'sid' => payload['sid'],
                  'index' => payload['index'].to_i,
                  'author' => payload['author'],
                  'body' => payload['body'],
                  'media' => payload['media'],
                  'attributes' => payload['attributes'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
              }

              # Context
              @instance_context = nil
              @params = {'conversation_sid' => conversation_sid, 'sid' => sid || @properties['sid'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [MessageContext] MessageContext for this MessageInstance
            def context
              unless @instance_context
                @instance_context = MessageContext.new(@version, @params['conversation_sid'], @params['sid'], )
              end
              @instance_context
            end

            ##
            # @return [String] The unique id of the Account responsible for this message.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] The unique id of the Conversation for this message.
            def conversation_sid
              @properties['conversation_sid']
            end

            ##
            # @return [String] A 34 character string that uniquely identifies this resource.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] The index of the message within the Conversation.
            def index
              @properties['index']
            end

            ##
            # @return [String] The channel specific identifier of the message's author.
            def author
              @properties['author']
            end

            ##
            # @return [String] The content of the message.
            def body
              @properties['body']
            end

            ##
            # @return [Hash] An array of objects that describe the Message's media if attached, otherwise, null.
            def media
              @properties['media']
            end

            ##
            # @return [String] A string metadata field you can use to store any data you wish.
            def attributes
              @properties['attributes']
            end

            ##
            # @return [Time] The date that this resource was created.
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date that this resource was last updated.
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] An absolute URL for this message.
            def url
              @properties['url']
            end

            ##
            # Update the MessageInstance
            # @param [String] author The channel specific identifier of the message's author.
            #   Defaults to `system`.
            # @param [String] body The content of the message, can be up to 1,600 characters
            #   long.
            # @param [Time] date_created The date that this resource was created.
            # @param [Time] date_updated The date that this resource was last updated. `null`
            #   if the message has not been edited.
            # @param [String] attributes A string metadata field you can use to store any data
            #   you wish. The string value must contain structurally valid JSON if specified.
            #   **Note** that if the attributes are not set "{}" will be returned.
            # @return [MessageInstance] Updated MessageInstance
            def update(author: :unset, body: :unset, date_created: :unset, date_updated: :unset, attributes: :unset)
              context.update(
                  author: author,
                  body: body,
                  date_created: date_created,
                  date_updated: date_updated,
                  attributes: attributes,
              )
            end

            ##
            # Deletes the MessageInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a MessageInstance
            # @return [MessageInstance] Fetched MessageInstance
            def fetch
              context.fetch
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.MessageInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Conversations.V1.MessageInstance #{values}>"
            end
          end
        end
      end
    end
  end
end