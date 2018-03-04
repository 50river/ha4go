# coding: utf-8
class ProjectMailer < ApplicationMailer
  add_template_helper(ApplicationHelper)
  default from: "ha4go@#{ENV.fetch('APP_HOST') { 'codeforkanazawa.org' }}"

  def tell_create(mails, project)
    @project = project
    # **TODO** controller support i18n
    mail to: mails, subject: '[Ha4go] 課題が作成されました'
  end

  def tell_update(mails, project_update)
    @project_update = project_update
    # **TODO** controller support i18n
    mail to: mails, subject: '[Ha4go] 課題に更新がありました'
  end

  def tell_skill_match(mails, project, is_new = false)
    @project = project
    subject = '[Ha4go] あなたのスキルにマッチした課題が登録されました' if is_new
    subject = '[Ha4go] あなたのスキルを求めている課題があります'
    mail to: mails, subject: subject
  end

  # test code
  def sendmail_confirm
    @greeting = 'Hi'
    mail to: 'kato@phalanxware.com', subject: 'ActionMailer test'
  end
end
