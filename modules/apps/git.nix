{ config, lib, pkgs, ... }:
let
	cfg = config.git;
in {
	options.git.enable = lib.mkEnableOption "git (a distributed version control system)";

	config = lib.mkIf cfg.enable {
		home = {
      packages = with pkgs; [ git ];
      shellAliases = {
        # TODO: some of these aliases are disabled until helper functions are implemented
        grt=''cd "$(git rev-parse --show-toplevel || echo .)"'';

        #ggpur=''ggu'';
        g=''git'';
        ga=''git add'';
        gaa=''git add --all'';
        gapa=''git add --patch'';
        gau=''git add --update'';
        gav=''git add --verbose'';
        gwip=''git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'';
        gam=''git am'';
        gama=''git am --abort'';
        gamc=''git am --continue'';
        gamscp=''git am --show-current-patch'';
        gams=''git am --skip'';
        gap=''git apply'';
        gapt=''git apply --3way'';
        gbs=''git bisect'';
        gbsb=''git bisect bad'';
        gbsg=''git bisect good'';
        gbsn=''git bisect new'';
        gbso=''git bisect old'';
        gbsr=''git bisect reset'';
        gbss=''git bisect start'';
        gbl=''git blame -w'';
        gb=''git branch'';
        gba=''git branch --all'';
        gbd=''git branch --delete'';
        gbD=''git branch --delete --force'';

        gbgd=''LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -d'';
        gbgD=''LANG=C git branch --no-color -vv | grep ": gone\]" | cut -c 3- | awk '"'"'{print $1}'"'"' | xargs git branch -D'';
        gbm=''git branch --move'';
        gbnm=''git branch --no-merged'';
        gbr=''git branch --remote'';
        #ggsup=''git branch --set-upstream-to=origin/$(git_current_branch)'';
        gbg=''LANG=C git branch -vv | grep ": gone\]"'';
        gco=''git checkout'';
        gcor=''git checkout --recurse-submodules'';
        gcb=''git checkout -b'';
        gcB=''git checkout -B'';
        #gcd=''git checkout $(git_develop_branch)'';
        #gcm=''git checkout $(git_main_branch)'';
        gcp=''git cherry-pick'';
        gcpa=''git cherry-pick --abort'';
        gcpc=''git cherry-pick --continue'';
        gclean=''git clean --interactive -d'';
        gcl=''git clone --recurse-submodules'';
        gclf=''git clone --recursive --shallow-submodules --filter=blob:none --also-filter-submodules'';

        gcam=''git commit --all --message'';
        gcas=''git commit --all --signoff'';
        gcasm=''git commit --all --signoff --message'';
        gcs=''git commit --gpg-sign'';
        gcss=''git commit --gpg-sign --signoff'';
        gcssm=''git commit --gpg-sign --signoff --message'';
        gcmsg=''git commit --message'';
        gcsm=''git commit --signoff --message'';
        gc=''git commit --verbose'';
        gca=''git commit --verbose --all'';
        "gca!"=''git commit --verbose --all --amend'';
        "gcan!"=''git commit --verbose --all --no-edit --amend'';
        "gcans!"=''git commit --verbose --all --signoff --no-edit --amend'';
        "gcann!"=''git commit --verbose --all --date=now --no-edit --amend'';
        "gc!"=''git commit --verbose --amend'';
        gcn=''git commit --verbose --no-edit'';
        "gcn!"=''git commit --verbose --no-edit --amend'';
        gcf=''git config --list'';
        gdct=''git describe --tags $(git rev-list --tags --max-count=1)'';
        gd=''git diff'';
        gdca=''git diff --cached'';
        gdcw=''git diff --cached --word-diff'';
        gds=''git diff --staged'';
        gdw=''git diff --word-diff'';

        gdup=''git diff @{upstream}'';

        gdt=''git diff-tree --no-commit-id --name-only -r'';
        gf=''git fetch'';
        gfa=''git fetch --all --tags --prune --jobs=10'';
        gfo=''git fetch origin'';
        gg=''git gui citool'';
        gga=''git gui citool --amend'';
        ghh=''git help'';
        glgg=''git log --graph'';
        glgga=''git log --graph --decorate --all'';
        glgm=''git log --graph --max-count=10'';
        glods=''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset" --date=short'';
        glod=''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset"'';
        glola=''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --all'';
        glols=''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset" --stat'';
        glol=''git log --graph --pretty="%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset"'';
        glo=''git log --oneline --decorate'';
        glog=''git log --oneline --decorate --graph'';
        gloga=''git log --oneline --decorate --graph --all'';

        #glp=''_git_log_prettily'';
        glg=''git log --stat'';
        glgp=''git log --stat --patch'';
        gignored=''git ls-files -v | grep "^[[:lower:]]"'';
        gfg=''git ls-files | grep'';
        gm=''git merge'';
        gma=''git merge --abort'';
        gmc=''git merge --continue'';
        gms=''git merge --squash'';
        gmff=''git merge --ff-only'';
        #gmom=''git merge origin/$(git_main_branch)'';
        #gmum=''git merge upstream/$(git_main_branch)'';
        gmtl=''git mergetool --no-prompt'';
        gmtlvim=''git mergetool --no-prompt --tool=vimdiff'';

        gl=''git pull'';
        gpr=''git pull --rebase'';
        gprv=''git pull --rebase -v'';
        gpra=''git pull --rebase --autostash'';
        gprav=''git pull --rebase --autostash -v'';


        #gprom=''git pull --rebase origin $(git_main_branch)'';
        #gpromi=''git pull --rebase=interactive origin $(git_main_branch)'';
        #gprum=''git pull --rebase upstream $(git_main_branch)'';
        #gprumi=''git pull --rebase=interactive upstream $(git_main_branch)'';
        #ggpull=''git pull origin "$(git_current_branch)"'';

        #gluc=''git pull upstream $(git_current_branch)'';
        #glum=''git pull upstream $(git_main_branch)'';
        gp=''git push'';
        gpd=''git push --dry-run'';

        "gpf!"=''git push --force'';
        gpf=''git push --force-with-lease --force-if-includes'';

        #gpsup=''git push --set-upstream origin $(git_current_branch)'';
        #gpsupf=''git push --set-upstream origin $(git_current_branch) --force-with-lease --force-if-includes'';'
        gpv=''git push --verbose'';
        gpoat=''git push origin --all && git push origin --tags'';
        gpod=''git push origin --delete'';
        #ggpush=''git push origin "$(git_current_branch)"'';

        gpu=''git push upstream'';
        grb=''git rebase'';
        grba=''git rebase --abort'';
        grbc=''git rebase --continue'';
        grbi=''git rebase --interactive'';
        grbo=''git rebase --onto'';
        grbs=''git rebase --skip'';
        #grbd=''git rebase $(git_develop_branch)'';
        #grbm=''git rebase $(git_main_branch)'';
        #grbom=''git rebase origin/$(git_main_branch)'';
        #grbum=''git rebase upstream/$(git_main_branch)'';
        grf=''git reflog'';
        gr=''git remote'';
        grv=''git remote --verbose'';
        gra=''git remote add'';
        grrm=''git remote remove'';
        grmv=''git remote rename'';
        grset=''git remote set-url'';
        grup=''git remote update'';
        grh=''git reset'';
        gru=''git reset --'';
        grhh=''git reset --hard'';
        grhk=''git reset --keep'';
        grhs=''git reset --soft'';
        gpristine=''git reset --hard && git clean --force -dfx'';
        gwipe=''git reset --hard && git clean --force -df'';
        #groh=''git reset origin/$(git_current_branch) --hard'';'
        grs=''git restore'';
        grss=''git restore --source'';
        grst=''git restore --staged'';
        gunwip=''git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'';
        grev=''git revert'';
        greva=''git revert --abort'';
        grevc=''git revert --continue'';
        grm=''git rm'';
        grmc=''git rm --cached'';
        gcount=''git shortlog --summary --numbered'';
        gsh=''git show'';
        gsps=''git show --pretty=short --show-signature'';
        gstall=''git stash --all'';
        gstaa=''git stash apply'';
        gstc=''git stash clear'';
        gstd=''git stash drop'';
        gstl=''git stash list'';
        gstp=''git stash pop'';
        gsta=''git stash push'';
        gsts=''git stash show --patch'';
        gst=''git status'';
        gss=''git status --short'';
        gsb=''git status --short --branch'';
        gsi=''git submodule init'';
        gsu=''git submodule update'';
        gsd=''git svn dcommit'';
        #git-svn-dcommit-push=''git svn dcommit && git push github $(git_main_branch):svntrunk'';'
        gsr=''git svn rebase'';
        gsw=''git switch'';
        gswc=''git switch --create'';
        #gswd=''git switch $(git_develop_branch)'';
        #gswm=''git switch $(git_main_branch)'';
        gta=''git tag --annotate'';
        gts=''git tag --sign'';
        gtv=''git tag | sort -V'';
        gignore=''git update-index --assume-unchanged'';
        gunignore=''git update-index --no-assume-unchanged'';
        gwch=''git whatchanged -p --abbrev-commit --pretty=medium'';
        gwt=''git worktree'';
        gwta=''git worktree add'';
        gwtls=''git worktree list'';
        gwtmv=''git worktree move'';
        gwtrm=''git worktree remove'';
        gstu=''gsta --include-untracked'';
        # gtl=''gtl(){ git tag --sort=-v:refname -n --list "${1}*" }; noglob gtl'';
        gk=''\gitk --all --branches &!'';
        gke=''\gitk --all $(git log --walk-reflogs --pretty=%h) &!'';
      };
    };

    programs.eza.git = true;

		programs = {
      git = {
        enable = true;
        
        userEmail = "7753727+bearmoth@users.noreply.github.com";
        userName = "Phil Davies";

        aliases = {
          build = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"build\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          chore = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"chore\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          ci = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"ci\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          docs = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"docs\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          feat = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"feat\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          fix = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"fix\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          perf = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"perf\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          refactor = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"refactor\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          rev = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"revert\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          style = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"style\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          test = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"test\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
          wip = "!a() {\nlocal _scope _attention _message\nwhile [ $# -ne 0 ]; do\ncase $1 in\n  -s | --scope )\n    if [ -z $2 ]; then\n      echo \"Missing scope!\"\n      return 1\n    fi\n    _scope=\"$2\"\n    shift 2\n    ;;\n  -a | --attention )\n    _attention=\"!\"\n    shift 1\n    ;;\n  * )\n    _message=\"\${_message} $1\"\n    shift 1\n    ;;\nesac\ndone\ngit commit -m \"wip\${_scope:+(\${_scope})}\${_attention}:\${_message}\"\n}; a";
        };
      };
      
      bash.initExtra = ''
        # functions here
      '';
		};
	};
}
