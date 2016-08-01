class ProjectMailer < ActionMailer::Base
  default from: "from@example.com" ,to: "sherry@TT.com"
  def project_create_mail project
    mail(subject: "Project #{project.name} is created")
  end
  def project_update_mail project
    mail(subject: "Project #{project.name} is updated")
  end
end
