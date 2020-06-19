seed_file = Rails.root.join('db/seeds/seeds.yml')
config = YAML::load_file(seed_file)

config['projects'].each do |project_attrs|
  FactoryBot.create(:project, project_attrs.except('todos')) do |project|
    project_attrs['todos'].each do |todo_attrs|
      FactoryBot.create(:todo, todo_attrs.merge(project: project))
    end
  end
end
