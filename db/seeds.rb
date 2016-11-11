juliet_project = Project.create(title:'Romeo and Juliet')

OldChunk.create(title: 'Prologue', project_id: juliet_project.id, text: 'Prologue text dummy')
OldChunk.create(title: 'Act I, Scene I', project_id: juliet_project.id, text: 'Act I, Scene I text dummy')
OldChunk.create(title: 'Act I, Scene II', project_id: juliet_project.id, text: 'Act I, Scene II text dummy')