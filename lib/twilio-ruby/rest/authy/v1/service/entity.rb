##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /
#
# frozen_string_literal: true

module Twilio
  module REST
    class Authy < Domain
      class V1 < Version
        class ServiceContext < InstanceContext
          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EntityList < ListResource
            ##
            # Initialize the EntityList
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @return [EntityList] EntityList
            def initialize(version, service_sid: nil)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid}
              @uri = "/Services/#{@solution[:service_sid]}/Entities"
            end

            ##
            # Retrieve a single page of EntityInstance records from the API.
            # Request is executed immediately.
            # @param [String] identity Customer unique identity for the Entity of the Service
            # @return [EntityInstance] Newly created EntityInstance
            def create(identity: nil)
              data = Twilio::Values.of({'Identity' => identity, })

              payload = @version.create(
                  'POST',
                  @uri,
                  data: data
              )

              EntityInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Lists EntityInstance records from the API as a list.
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
            # Streams EntityInstance records from the API as an Enumerable.
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
            # When passed a block, yields EntityInstance records from the API.
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
            # Retrieve a single page of EntityInstance records from the API.
            # Request is executed immediately.
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of EntityInstance
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
              EntityPage.new(@version, response, @solution)
            end

            ##
            # Retrieve a single page of EntityInstance records from the API.
            # Request is executed immediately.
            # @param [String] target_url API-generated URL for the requested results page
            # @return [Page] Page of EntityInstance
            def get_page(target_url)
              response = @version.domain.request(
                  'GET',
                  target_url
              )
              EntityPage.new(@version, response, @solution)
            end

            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Authy.V1.EntityList>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EntityPage < Page
            ##
            # Initialize the EntityPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @return [EntityPage] EntityPage
            def initialize(version, response, solution)
              super(version, response)

              # Path Solution
              @solution = solution
            end

            ##
            # Build an instance of EntityInstance
            # @param [Hash] payload Payload response from the API
            # @return [EntityInstance] EntityInstance
            def get_instance(payload)
              EntityInstance.new(@version, payload, service_sid: @solution[:service_sid], )
            end

            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Authy.V1.EntityPage>'
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EntityContext < InstanceContext
            ##
            # Initialize the EntityContext
            # @param [Version] version Version that contains the resource
            # @param [String] service_sid The unique SID identifier of the Service.
            # @param [String] identity Customer unique identity for the Entity of the Service
            # @return [EntityContext] EntityContext
            def initialize(version, service_sid, identity)
              super(version)

              # Path Solution
              @solution = {service_sid: service_sid, identity: identity, }
              @uri = "/Services/#{@solution[:service_sid]}/Entities/#{@solution[:identity]}"

              # Dependents
              @factors = nil
            end

            ##
            # Deletes the EntityInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              @version.delete('delete', @uri)
            end

            ##
            # Fetch a EntityInstance
            # @return [EntityInstance] Fetched EntityInstance
            def fetch
              params = Twilio::Values.of({})

              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )

              EntityInstance.new(
                  @version,
                  payload,
                  service_sid: @solution[:service_sid],
                  identity: @solution[:identity],
              )
            end

            ##
            # Access the factors
            # @return [FactorList]
            # @return [FactorContext] if sid was passed.
            def factors(sid=:unset)
              raise ArgumentError, 'sid cannot be nil' if sid.nil?

              if sid != :unset
                return FactorContext.new(@version, @solution[:service_sid], @solution[:identity], sid, )
              end

              unless @factors
                @factors = FactorList.new(
                    @version,
                    service_sid: @solution[:service_sid],
                    identity: @solution[:identity],
                )
              end

              @factors
            end

            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Authy.V1.EntityContext #{context}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Authy.V1.EntityContext #{context}>"
            end
          end

          ##
          # PLEASE NOTE that this class contains preview products that are subject to change. Use them with caution. If you currently do not have developer preview access, please contact help@twilio.com.
          class EntityInstance < InstanceResource
            ##
            # Initialize the EntityInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] service_sid The unique SID identifier of the Service.
            # @param [String] identity Customer unique identity for the Entity of the Service
            # @return [EntityInstance] EntityInstance
            def initialize(version, payload, service_sid: nil, identity: nil)
              super(version)

              # Marshaled Properties
              @properties = {
                  'sid' => payload['sid'],
                  'identity' => payload['identity'],
                  'account_sid' => payload['account_sid'],
                  'service_sid' => payload['service_sid'],
                  'date_created' => Twilio.deserialize_iso8601_datetime(payload['date_created']),
                  'date_updated' => Twilio.deserialize_iso8601_datetime(payload['date_updated']),
                  'url' => payload['url'],
                  'links' => payload['links'],
              }

              # Context
              @instance_context = nil
              @params = {'service_sid' => service_sid, 'identity' => identity || @properties['identity'], }
            end

            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @return [EntityContext] EntityContext for this EntityInstance
            def context
              unless @instance_context
                @instance_context = EntityContext.new(@version, @params['service_sid'], @params['identity'], )
              end
              @instance_context
            end

            ##
            # @return [String] A string that uniquely identifies this Entity.
            def sid
              @properties['sid']
            end

            ##
            # @return [String] Unique identity of the Entity
            def identity
              @properties['identity']
            end

            ##
            # @return [String] Account Sid.
            def account_sid
              @properties['account_sid']
            end

            ##
            # @return [String] Service Sid.
            def service_sid
              @properties['service_sid']
            end

            ##
            # @return [Time] The date this Entity was created
            def date_created
              @properties['date_created']
            end

            ##
            # @return [Time] The date this Entity was updated
            def date_updated
              @properties['date_updated']
            end

            ##
            # @return [String] The URL of this resource.
            def url
              @properties['url']
            end

            ##
            # @return [String] Nested resource URLs.
            def links
              @properties['links']
            end

            ##
            # Deletes the EntityInstance
            # @return [Boolean] true if delete succeeds, false otherwise
            def delete
              context.delete
            end

            ##
            # Fetch a EntityInstance
            # @return [EntityInstance] Fetched EntityInstance
            def fetch
              context.fetch
            end

            ##
            # Access the factors
            # @return [factors] factors
            def factors
              context.factors
            end

            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Authy.V1.EntityInstance #{values}>"
            end

            ##
            # Provide a detailed, user friendly representation
            def inspect
              values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Authy.V1.EntityInstance #{values}>"
            end
          end
        end
      end
    end
  end
end