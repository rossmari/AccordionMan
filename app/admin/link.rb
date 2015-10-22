ActiveAdmin.register Link do

  index do
    id_column
    column :id
    column :url
    column :href do |link|
      link_to 'Fast link =>', link.url
    end
    column :hits
    column :created_at
    column :updated_at

    actions name: 'Действия'
  end



end