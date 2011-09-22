module MongoMapper
  module AcceptsNestedAttributes
    extend ActiveSupport::Concern

    module ClassMethods
      def accepts_nested_attributes_for(*associations)
        (associations||[]).each do |association|
          # should do a fake nested attributes
          define_method :"#{association}_attributes=" do |*args|
            self.send :"#{association}=", *args
          end
        end
      end
    end
  end
end