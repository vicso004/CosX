module ApplicationHelper

 def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new #make a new Asset or Goal instance
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder| #make new fields in the form partial
      render(association.to_s.singularize + "_fields", f: builder) # render a new Asset or Goal partial
    end
    link_to(name, '#', class: "add_fields btn", data: {id: id, fields: fields.gsub("\n", "")}) #add link that Jquery listens to, gsub to strip newline characters
  end  
    
end
