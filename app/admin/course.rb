ActiveAdmin.register Course do
  index do
    column :name
    column :price
    column "Teacher" do |course|
      begin
        teacher = User.find(course.teacher)
        "#{teacher.encrypted_first_name} #{teacher.encrypted_last_name} (#{teacher.id})"
      rescue
        "Unknown"
      end
    end
    default_actions
  end

  show do
    attributes_table do
      row :name
      row :price
      row "Teacher" do |course|
        begin
          teacher = User.find(course.teacher)
          teacher.courses << course
          link_to "#{teacher.encrypted_first_name} #{teacher.encrypted_last_name}", "/admin/users/#{teacher.id}"
        rescue
          "Unknown"
        end
      end
    end
  end

  filter :name
  #filter :teacher, :collection => User.all.map { |x| ["#{x.first_name} #{x.last_name}", x.id] }

  form do |f|
    f.inputs "Course Details" do
      f.input :name
      f.input :price
      f.input :description
      f.input :teacher, :collection => User.all.map { |x| ["#{x.encrypted_first_name} #{x.encrypted_last_name}", x.id] }
    end
    f.actions
  end
end
