debug = false

marked.setOptions({
  # renderer: new marked.Renderer(),
  gfm: true,
  tables: true,
  breaks: false,
  pedantic: false,
  sanitize: true,
  smartLists: true,
  smartypants: false
});

get_random_issue = (callback, options = {}) ->
  params =
    sort: "updated"
    per_page: 1
    page: Math.floor(Math.random() * 1000) + 1
    type: "issue"

  q = ["state:open"]
  q.push("language:#{options.language}") if options.language?
  params.q = q.join(" ")

  if debug
    callback({"meta":{"X-RateLimit-Limit":"5","X-RateLimit-Remaining":"4","X-RateLimit-Reset":"1389134561","X-GitHub-Media-Type":"github.beta","Link":[["https://api.github.com/search/issues?sort=updated&per_page=1&page=621&type=…3Aopen&callback=jQuery1102034126031142659485_1389134500525&_=1389134500526",{"rel":"next"}],["https://api.github.com/search/issues?sort=updated&per_page=1&page=1000&type…3Aopen&callback=jQuery1102034126031142659485_1389134500525&_=1389134500526",{"rel":"last"}],["https://api.github.com/search/issues?sort=updated&per_page=1&page=1&type=is…3Aopen&callback=jQuery1102034126031142659485_1389134500525&_=1389134500526",{"rel":"first"}],["https://api.github.com/search/issues?sort=updated&per_page=1&page=619&type=…3Aopen&callback=jQuery1102034126031142659485_1389134500525&_=1389134500526",{"rel":"prev"}]],"status":200},"data":{"total_count":1733735,"items":[{"url":"https://api.github.com/repos/reefdog/nprviz/issues/3","labels_url":"https://api.github.com/repos/reefdog/nprviz/issues/3/labels{/name}","comments_url":"https://api.github.com/repos/reefdog/nprviz/issues/3/comments","events_url":"https://api.github.com/repos/reefdog/nprviz/issues/3/events","html_url":"https://github.com/reefdog/nprviz/issues/3","id":25202002,"number":3,"title":"Add big picture of face","user":{"login":"reefdog","id":4731,"avatar_url":"https://gravatar.com/avatar/45891f6dabca10f050ab81561509886b?d=https%3A%2F%2Fidenticons.github.com%2F096ffc299200f51751b08da6d865ae95.png&r=x","gravatar_id":"45891f6dabca10f050ab81561509886b","url":"https://api.github.com/users/reefdog","html_url":"https://github.com/reefdog","followers_url":"https://api.github.com/users/reefdog/followers","following_url":"https://api.github.com/users/reefdog/following{/other_user}","gists_url":"https://api.github.com/users/reefdog/gists{/gist_id}","starred_url":"https://api.github.com/users/reefdog/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/reefdog/subscriptions","organizations_url":"https://api.github.com/users/reefdog/orgs","repos_url":"https://api.github.com/users/reefdog/repos","events_url":"https://api.github.com/users/reefdog/events{/privacy}","received_events_url":"https://api.github.com/users/reefdog/received_events","type":"User","site_admin":false},"labels":[{"url":"https://api.github.com/repos/reefdog/nprviz/labels/enhancement","name":"enhancement","color":"84b6eb"}],"state":"open","assignee":{"login":"reefdog","id":4731,"avatar_url":"https://gravatar.com/avatar/45891f6dabca10f050ab81561509886b?d=https%3A%2F%2Fidenticons.github.com%2F096ffc299200f51751b08da6d865ae95.png&r=x","gravatar_id":"45891f6dabca10f050ab81561509886b","url":"https://api.github.com/users/reefdog","html_url":"https://github.com/reefdog","followers_url":"https://api.github.com/users/reefdog/followers","following_url":"https://api.github.com/users/reefdog/following{/other_user}","gists_url":"https://api.github.com/users/reefdog/gists{/gist_id}","starred_url":"https://api.github.com/users/reefdog/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/reefdog/subscriptions","organizations_url":"https://api.github.com/users/reefdog/orgs","repos_url":"https://api.github.com/users/reefdog/repos","events_url":"https://api.github.com/users/reefdog/events{/privacy}","received_events_url":"https://api.github.com/users/reefdog/received_events","type":"User","site_admin":false},"milestone":null,"comments":0,"created_at":"2014-01-07T22:23:42Z","updated_at":"2014-01-07T22:23:42Z","closed_at":null,"pull_request":{"html_url":null,"diff_url":null,"patch_url":null},"body":"They need a face to the name. Hire someone to take some great shots (glamour shots?) and add to the application. Sets you apart from the other applicants. Maybe wearing cowboy stuff?","score":1}]}})
  else
    request = $.ajax({
      url: "https://api.github.com/search/issues?#{$.param(params)}"
      dataType: "jsonp"
    })

    request.done (data) ->
      callback(data)

extract_owner_and_repo = (str) ->
  parts = str.replace(/https?:\/\/github\.com\//, "").split("/")
  {owner: parts[0], repo: parts[1]}

get_repo_for_issue = (issue_data, callback) ->
  # https://github.com/reefdog/nprviz/issues/3
  info = extract_owner_and_repo(issue_data.html_url)

  if debug
    callback({"meta":{"X-RateLimit-Limit":"60","X-RateLimit-Remaining":"55","X-RateLimit-Reset":"1389144134","Cache-Control":"public, max-age=60, s-maxage=60","Last-Modified":"Tue, 07 Jan 2014 22:14:35 GMT","Vary":"Accept","ETag":"\"c8d54e94b5000a8e19a85bb969cab327\"","X-GitHub-Media-Type":"github.beta","status":200},"data":{"id":15717353,"name":"nprviz","full_name":"reefdog/nprviz","owner":{"login":"reefdog","id":4731,"avatar_url":"https://gravatar.com/avatar/45891f6dabca10f050ab81561509886b?d=https%3A%2F%2Fidenticons.github.com%2F096ffc299200f51751b08da6d865ae95.png&r=x","gravatar_id":"45891f6dabca10f050ab81561509886b","url":"https://api.github.com/users/reefdog","html_url":"https://github.com/reefdog","followers_url":"https://api.github.com/users/reefdog/followers","following_url":"https://api.github.com/users/reefdog/following{/other_user}","gists_url":"https://api.github.com/users/reefdog/gists{/gist_id}","starred_url":"https://api.github.com/users/reefdog/starred{/owner}{/repo}","subscriptions_url":"https://api.github.com/users/reefdog/subscriptions","organizations_url":"https://api.github.com/users/reefdog/orgs","repos_url":"https://api.github.com/users/reefdog/repos","events_url":"https://api.github.com/users/reefdog/events{/privacy}","received_events_url":"https://api.github.com/users/reefdog/received_events","type":"User","site_admin":false},"private":false,"html_url":"https://github.com/reefdog/nprviz","description":"Application letter for the NPR Visuals web development position","fork":false,"url":"https://api.github.com/repos/reefdog/nprviz","forks_url":"https://api.github.com/repos/reefdog/nprviz/forks","keys_url":"https://api.github.com/repos/reefdog/nprviz/keys{/key_id}","collaborators_url":"https://api.github.com/repos/reefdog/nprviz/collaborators{/collaborator}","teams_url":"https://api.github.com/repos/reefdog/nprviz/teams","hooks_url":"https://api.github.com/repos/reefdog/nprviz/hooks","issue_events_url":"https://api.github.com/repos/reefdog/nprviz/issues/events{/number}","events_url":"https://api.github.com/repos/reefdog/nprviz/events","assignees_url":"https://api.github.com/repos/reefdog/nprviz/assignees{/user}","branches_url":"https://api.github.com/repos/reefdog/nprviz/branches{/branch}","tags_url":"https://api.github.com/repos/reefdog/nprviz/tags","blobs_url":"https://api.github.com/repos/reefdog/nprviz/git/blobs{/sha}","git_tags_url":"https://api.github.com/repos/reefdog/nprviz/git/tags{/sha}","git_refs_url":"https://api.github.com/repos/reefdog/nprviz/git/refs{/sha}","trees_url":"https://api.github.com/repos/reefdog/nprviz/git/trees{/sha}","statuses_url":"https://api.github.com/repos/reefdog/nprviz/statuses/{sha}","languages_url":"https://api.github.com/repos/reefdog/nprviz/languages","stargazers_url":"https://api.github.com/repos/reefdog/nprviz/stargazers","contributors_url":"https://api.github.com/repos/reefdog/nprviz/contributors","subscribers_url":"https://api.github.com/repos/reefdog/nprviz/subscribers","subscription_url":"https://api.github.com/repos/reefdog/nprviz/subscription","commits_url":"https://api.github.com/repos/reefdog/nprviz/commits{/sha}","git_commits_url":"https://api.github.com/repos/reefdog/nprviz/git/commits{/sha}","comments_url":"https://api.github.com/repos/reefdog/nprviz/comments{/number}","issue_comment_url":"https://api.github.com/repos/reefdog/nprviz/issues/comments/{number}","contents_url":"https://api.github.com/repos/reefdog/nprviz/contents/{+path}","compare_url":"https://api.github.com/repos/reefdog/nprviz/compare/{base}...{head}","merges_url":"https://api.github.com/repos/reefdog/nprviz/merges","archive_url":"https://api.github.com/repos/reefdog/nprviz/{archive_format}{/ref}","downloads_url":"https://api.github.com/repos/reefdog/nprviz/downloads","issues_url":"https://api.github.com/repos/reefdog/nprviz/issues{/number}","pulls_url":"https://api.github.com/repos/reefdog/nprviz/pulls{/number}","milestones_url":"https://api.github.com/repos/reefdog/nprviz/milestones{/number}","notifications_url":"https://api.github.com/repos/reefdog/nprviz/notifications{?since,all,participating}","labels_url":"https://api.github.com/repos/reefdog/nprviz/labels{/name}","releases_url":"https://api.github.com/repos/reefdog/nprviz/releases{/id}","created_at":"2014-01-07T21:32:42Z","updated_at":"2014-01-07T22:14:35Z","pushed_at":"2014-01-07T22:10:31Z","git_url":"git://github.com/reefdog/nprviz.git","ssh_url":"git@github.com:reefdog/nprviz.git","clone_url":"https://github.com/reefdog/nprviz.git","svn_url":"https://github.com/reefdog/nprviz","homepage":null,"size":0,"stargazers_count":0,"watchers_count":0,"language":null,"has_issues":true,"has_downloads":true,"has_wiki":false,"forks_count":0,"mirror_url":null,"open_issues_count":4,"forks":0,"open_issues":4,"watchers":0,"default_branch":"master","master_branch":"master","network_count":0,"subscribers_count":1}})
  else
    request = $.ajax({
      url: "https://api.github.com/repos/#{info.owner}/#{info.repo}"
      dataType: "jsonp"
    })

    request.done (data) ->
      callback(data)

issue_template = '''
  <div class="issue">
    <div class="avatar">
      <img src="{{user.avatar_url}}" />
    </div>
    <div class="contents">
      Submitted by <strong>{{user.login}}</strong> {{created_at_timespan}}
      <h3 class="title">{{title}}</h3>
      <p>{{body_markdown}}</p>
      <div class="comments icon">
        <span class="glyphicon glyphicon-comment"></span>{{comments}} {{comments_plural}}
      </div>
    </div>
  </div>
'''

repo_template = '''
  <div class="repo">
    <div class="header">
      <h3 class="name">{{owner.login}} / <strong>{{name}}</strong></h3>
      <div class="forks icon">
        <span class="glyphicon glyphicon-edit"></span>{{forks_count}} {{forks_plural}}
      </div>
      <div class="watchers icon">
        <span class="glyphicon glyphicon-star"></span>{{watchers_count}} {{watchers_plural}}
      </div>
    </div>
    <p class="description markdown">{{description}}</p>
    <hr>
  </div>
'''

render_template = (template, data, data_methods) ->
  template.replace(/\{\{([\w\.]+)\}\}/g, (match) ->
    match = match.slice(2, match.length - 2)
    fragment = data
    for step in match.split(".")
      if fragment?
        fragment = fragment[step]

    if fragment?
      fragment
    else
      data_methods[match]()
  )

render_issue = (issue_data) ->
  render_template(issue_template, issue_data, {
    created_at_timespan: ->
      timestamp = Date.parse(issue_data.created_at) / 1000
      now = Math.round(Date.now() / 1000)
      formatter = new TwitterCldr.TimespanFormatter()
      formatter.format(timestamp - now)
    comments_plural: ->
      if issue_data.comments == 1 then "comment" else "comments"
    body_markdown: ->
      marked(issue_data.body)
  })

render_repo = (repo_data) ->
  render_template(repo_template, repo_data, {
    forks_plural: ->
      if repo_data.forks_count == 1 then "fork" else "forks"
    watchers_plural: ->
      if repo_data.watchers_count == 1 then "watcher" else "watchers"
  })

$(document).ready ->
  load_new_issue = ->
    show_spinner()

    get_random_issue (issue) ->
      issue_data = issue.data.items[0]

      get_repo_for_issue(issue_data, (repo) ->
        repo_data = repo.data

        $(".found_issue .found_repo").html(
          render_repo(repo_data)
        )

        $(".found_issue .contents").html(
          render_issue(issue_data)
        )

        $(".btn.choose").attr("href", issue_data.html_url)
        hide_spinner()
      )

  show_spinner = ->
    $(".everything").hide()
    $(".spinner").show()

  hide_spinner = ->
    $(".everything").show()
    $(".spinner").hide()

  load_new_issue()

  $(".btn.another").click ->
    load_new_issue()
