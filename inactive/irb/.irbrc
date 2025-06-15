# Easily print methods local to an object's class
class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end

Pry.config.hooks.add_hook(:before_session, :rails) do
  if defined?(Rails)
    class ActiveRecord
      def local_methods
        (methods - ActiveRecord.instance_methods).sort
      end
    end
    
    class ActiveModel
      def local_methods
        (methods - ActiveModel.instance_methods).sort
      end
    end
  end
end


alias q exit
