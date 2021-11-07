namespace :get_github_info do
  desc 'issueのコメントを取ってくるやつ'
  task issue: :environment do
    # repository一覧を取得
    orgs = "kansai-lovers"
    repos_infos = []
    response_reposes = JSON.parse(Net::HTTP.get(URI("https://api.github.com/orgs/#{orgs}/repos")))
    response_reposes.each do |response_repos|
      repos_infos.push({
        :repos_name => response_repos["name"],
        :repos_owner => response_repos["owner"]["login"]
      })
    end

    # issue一覧を取得
    issue_numbers = []
    repos_infos.each do |repos_info|
      owner = repos_info[:repos_owner]
      repos = repos_info[:repos_name]
      response_issues = JSON.parse(Net::HTTP.get(URI("https://api.github.com/repos/#{owner}/#{repos}/issues?state=all")))
      response_issues.each do |response_issue|
        issue_numbers.push response_issue["number"]
        member = Member.find_by(github_name: response_issue["user"]["login"])
        message = Message.find_by(id: response_issue["id"])
        if message.nil?
          Message.create!(id: response_issue["id"], members_id: member.id, repositories_id: 1, text: response_issue["body"]|| "", url: response_issue["html_url"], good_count: response_issue["reactions"]["+1"], bad_count: response_issue["reactions"]["-1"],laugh_count: response_issue["reactions"]["laugh"],hooray_count: response_issue["reactions"]["hooray"],confuse_count: response_issue["reactions"]["confused"], heart_count: response_issue["reactions"]["heart"], rocket_count: response_issue["reactions"]["rocket"], eyes_count: response_issue["reactions"]["eyes"])
        end
      end

      issue_numbers.each do |issue_number|
        response = JSON.parse(Net::HTTP.get(URI("https://api.github.com/repos/#{owner}/#{repos}/issues/#{issue_number}/comments")))
        response.each do |comment|
          p comment
          member = Member.find_by(github_name: comment["user"]["login"])
          message = Message.find_by(id: comment["id"])
          if message.nil?
            Message.create!(id: comment["id"], members_id: member.id, repositories_id: 1, text: comment["body"]|| "", url: comment["html_url"], good_count: comment["reactions"]["+1"], bad_count: comment["reactions"]["-1"],laugh_count: comment["reactions"]["laugh"],hooray_count: comment["reactions"]["hooray"],confuse_count: comment["reactions"]["confused"], heart_count: comment["reactions"]["heart"], rocket_count: comment["reactions"]["rocket"], eyes_count: comment["reactions"]["eyes"])
          end
        end
      end
    end
  end
end
