#repositories
[
  { name: 'kansai-lovers-api', owner_name: 'SoshiNaito'},
].each do |args|
  repository = Repository.find_by(name: args[:name])
  if repository.nil?
    repository = Repository.create!(name: args[:name], owner_name: args[:owner_name])
  end
end

#members
[
  { name: '内藤綜志', role: 'Server Engineer', join_date:'2021.04〜now', github_name: "SoshiNaito", github_url: 'https://github.com/SoshiNaito', avatar_url: "https://avatars.githubusercontent.com/u/93771634?v=4"},
  { name: '近藤大暉', role: 'Front Engineer', join_date:'2021.04〜now', github_name: "hirokikondo86", github_url: 'https://github.com/hirokikondo86', avatar_url: "https://avatars.githubusercontent.com/u/93771634?v=4"},
].each do |args|
  member = Member.find_by(name: args[:name])
  if member.nil?
    member = Member.create!(name: args[:name], role: args[:role], join_date: args[:join_date], url: args[:github_url], avatar_url: args[:avatar_url])
  end

  Chip.create!(members_id: member.id, value:"front end", color:"#DD2C01")

  #github_accounts
  github_account = GithubAccount.find_by(members_id: member.id)
  if github_account.nil?
    GithubAccount.create!(members_id: member.id, name: args[:github_name], url: args[:github_url])
  end
end

#messages
[
  { members_id: 1, repositories_id: 1, text: "こんな感じで行くよー！", url: 'https://github.com/kansai-lovers/kansai-lovers-api/issues/4#issuecomment-962419925', good_count: 1, bad_count: 0, laugh_count: 4, hooray_count: 5, confuse_count: 3, heart_count: 5, rocket_count: 12, eyes_count: 1},
  { members_id: 1, repositories_id: 1, text: "テストテスト", url: 'https://github.com/kansai-lovers/kansai-lovers-api/issues/4#issuecomment-962419925', good_count: 1, bad_count: 0, laugh_count: 4, hooray_count: 5, confuse_count: 3, heart_count: 5, rocket_count: 1, eyes_count: 10},
  { members_id: 1, repositories_id: 1, text: "あいうえお", url: 'https://github.com/kansai-lovers/kansai-lovers-api/issues/4#issuecomment-962419925', good_count: 1, bad_count: 0, laugh_count: 4, hooray_count: 5, confuse_count: 3, heart_count: 15, rocket_count: 1, eyes_count: 2},
  { members_id: 2, repositories_id: 1, text: "かきくけこ", url: 'https://github.com/kansai-lovers/kansai-lovers-api/issues/4#issuecomment-962419925', good_count: 3, bad_count: 1, laugh_count: 14, hooray_count: 5, confuse_count: 0, heart_count: 4, rocket_count: 10, eyes_count: 11},
  { members_id: 2, repositories_id: 1, text: "さしすせそ", url: 'https://github.com/kansai-lovers/kansai-lovers-api/issues/4#issuecomment-962419925', good_count: 0, bad_count: 0, laugh_count: 0, hooray_count: 0, confuse_count: 0, heart_count: 10, rocket_count: 0, eyes_count: 0},
  { members_id: 2, repositories_id: 1, text: "たちつてと", url: 'https://github.com/kansai-lovers/kansai-lovers-api/issues/4#issuecomment-962419925', good_count: 1, bad_count: 0, laugh_count: 0, hooray_count: 0, confuse_count: 3, heart_count: 15, rocket_count: 15, eyes_count: 2},
].each do |args|
  message = Message.find_by(text: args[:text])
  if message.nil?
    Message.create!(members_id: args[:members_id], repositories_id: args[:repositories_id], text: args[:text], url: args[:url], good_count: args[:good_count], bad_count: args[:bad_count],laugh_count: args[:laugh_count],hooray_count: args[:hooray_count],confuse_count: args[:confuse_count], heart_count: args[:heart_count], rocket_count: args[:rocket_count], eyes_count: args[:eyes_count])
  end
end
