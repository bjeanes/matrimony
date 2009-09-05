module GitHelper
  Commit = Struct.new(:sha, :author, :message)
  Commit::Author = Struct.new(:name, :email)
  
  def commit(message = Time.now.to_s, *args)
    args = ["-a"] if args.empty?
    `git commit -m #{message.inspect} #{args.join(' ')}`
    
    commit = *`git log -n 1 --format=format:"%H||%an||%ae||%cn||%ce||%s"`.split('||')
    sha, author_name, author_email, commiter_name, committer_email, message = *commit
    
    Commit.new(sha, Commit::Author.new(author_name, author_email),
               Commit::Author.new(commiter_name, committer_email),
               message)
  end
end