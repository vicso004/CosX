module ApplicationHelper
 
 # Generisk metod för att skapa en "lägg till"-knapp i formulär, t.ex för bilder och mål
 def link_to_add_fields(name, f, association)
    new_object = f.object.send(association).klass.new #Skapa en ny instans av associationen
    id = new_object.object_id
    fields = f.fields_for(association, new_object, child_index: id) do |builder| #De fält man vi skapa när man klickar på kanppen
      render(association.to_s.singularize + "_fields", f: builder) # Visa de partial som assiciationen redan har
    end
    link_to(name, '#', class: "add_fields btn", data: {id: id, fields: fields.gsub("\n", "")}) #Skapa den länk som jQuery lyssnar på, gsub tar bort enterslag 
  end  
    
end
