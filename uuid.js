


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>node-uuid/uuid.js at master · broofa/node-uuid · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="https://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <meta property="og:image" content="https://github.global.ssl.fastly.net/images/modules/logos_page/Octocat.png">
    <meta name="hostname" content="fe4.rs.github.com">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="xhr-socket" href="/_sockets" />
    
    


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" />

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="DiaMvkPnZjddmo7d48jLO7y62EdylNegh5MNVGvT9Kg=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-aa31dccb9df8242dbd5abaea7591ae7f16cc4101.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-ec4f51bae74d4ad5725891dccaecd4cc727d8cdc.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://github.global.ssl.fastly.net/assets/frameworks-e8054ad804a1cf9e9849130fee5a4a5487b663ed.js" type="text/javascript"></script>
      <script src="https://github.global.ssl.fastly.net/assets/github-5aedc81091ebed048bfaed27f559182c9802355b.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="5ec9e4827e4e5ec3a8cfb080a5633b59">

        <link data-pjax-transient rel='permalink' href='/broofa/node-uuid/blob/713951c726cb9d9e8bee71512445e097703a6f1a/uuid.js'>
  <meta property="og:title" content="node-uuid"/>
  <meta property="og:type" content="githubog:gitrepository"/>
  <meta property="og:url" content="https://github.com/broofa/node-uuid"/>
  <meta property="og:image" content="https://github.global.ssl.fastly.net/images/gravatars/gravatar-user-420.png"/>
  <meta property="og:site_name" content="GitHub"/>
  <meta property="og:description" content="node-uuid - Generate RFC-compliant UUIDs in JavaScript"/>

  <meta name="description" content="node-uuid - Generate RFC-compliant UUIDs in JavaScript" />

  <meta content="164050" name="octolytics-dimension-user_id" /><meta content="broofa" name="octolytics-dimension-user_login" /><meta content="1203139" name="octolytics-dimension-repository_id" /><meta content="broofa/node-uuid" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="1203139" name="octolytics-dimension-repository_network_root_id" /><meta content="broofa/node-uuid" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/broofa/node-uuid/commits/master.atom" rel="alternate" title="Recent Commits to node-uuid:master" type="application/atom+xml" />

  </head>


  <body class="logged_out page-blob macintosh vis-public env-production ">

    <div class="wrapper">
      
      
      


      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
        <a class="button primary" href="/signup">Sign up</a>
      <a class="button" href="/login?return_to=%2Fbroofa%2Fnode-uuid%2Fblob%2Fmaster%2Fuuid.js">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">


      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
      data-repo="broofa/node-uuid"
      data-branch="master"
      data-sha="56cec20c52166e5c77e8e545b84a3868bb022796"
  >

    <input type="hidden" name="nwo" value="broofa/node-uuid" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>


      


          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">


  <li>
  <a href="/login?return_to=%2Fbroofa%2Fnode-uuid"
  class="minibutton with-count js-toggler-target star-button entice tooltipped upwards "
  title="You must be signed in to use this feature" rel="nofollow">
  <span class="octicon octicon-star"></span>Star
</a>
<a class="social-count js-social-count" href="/broofa/node-uuid/stargazers">
  707
</a>

  </li>

    <li>
      <a href="/login?return_to=%2Fbroofa%2Fnode-uuid"
        class="minibutton with-count js-toggler-target fork-button entice tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/broofa/node-uuid/network" class="social-count">
        67
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/broofa" class="url fn" itemprop="url" rel="author"><span itemprop="title">broofa</span></a></span
          ><span class="repohead-name-divider">/</span><strong
          ><a href="/broofa/node-uuid" class="js-current-repository js-repo-home-link">node-uuid</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">

      <div class="repository-with-sidebar repo-container ">

        <div class="repository-sidebar">
            

<div class="repo-nav repo-nav-full js-repository-container-pjax js-octicon-loaders">
  <div class="repo-nav-contents">
    <ul class="repo-menu">
      <li class="tooltipped leftwards" title="Code">
        <a href="/broofa/node-uuid" aria-label="Code" class="js-selected-navigation-item selected" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /broofa/node-uuid">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped leftwards" title="Issues">
          <a href="/broofa/node-uuid/issues" aria-label="Issues" class="js-selected-navigation-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /broofa/node-uuid/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>8</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped leftwards" title="Pull Requests"><a href="/broofa/node-uuid/pulls" aria-label="Pull Requests" class="js-selected-navigation-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /broofa/node-uuid/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>4</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


        <li class="tooltipped leftwards" title="Wiki">
          <a href="/broofa/node-uuid/wiki" aria-label="Wiki" class="js-selected-navigation-item " data-pjax="true" data-selected-links="repo_wiki /broofa/node-uuid/wiki">
            <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>


    </ul>
    <div class="repo-menu-separator"></div>
    <ul class="repo-menu">

      <li class="tooltipped leftwards" title="Pulse">
        <a href="/broofa/node-uuid/pulse" aria-label="Pulse" class="js-selected-navigation-item " data-pjax="true" data-selected-links="pulse /broofa/node-uuid/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Graphs">
        <a href="/broofa/node-uuid/graphs" aria-label="Graphs" class="js-selected-navigation-item " data-pjax="true" data-selected-links="repo_graphs repo_contributors /broofa/node-uuid/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped leftwards" title="Network">
        <a href="/broofa/node-uuid/network" aria-label="Network" class="js-selected-navigation-item js-disable-pjax" data-selected-links="repo_network /broofa/node-uuid/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    </ul>

  </div>
</div>

            <div class="only-with-full-nav">
              

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/broofa/node-uuid.git" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/broofa/node-uuid.git" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>

  <input type="text" class="clone js-url-field"
         value="https://github.com/broofa/node-uuid" readonly="readonly">

  <span class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/broofa/node-uuid" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
</div>



<p class="clone-options">You can clone with
    <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>,
    <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>,
  and <a href="https://help.github.com/articles/which-remote-url-should-i-use">other methods.</a>
</p>

  <a href="http://mac.github.com" class="minibutton sidebar-button">
    <span class="octicon octicon-device-desktop"></span>
    Clone in Desktop
  </a>


                <a href="/broofa/node-uuid/archive/master.zip"
                   class="minibutton sidebar-button"
                   title="Download this repository as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
            </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:7cbaa21e03983b14e2870e70067d1d3b -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:7cbaa21e03983b14e2870e70067d1d3b -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/broofa/node-uuid/find/master" data-pjax data-hotkey="t" style="display:none">Show File Finder</a>

<div class="file-navigation">
  


<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
            </li>
          </ul>
        </div><!-- /.select-menu-tabs -->
      </div><!-- /.select-menu-filters -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/explicit_time/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="explicit_time" data-skip-pjax="true" rel="nofollow" title="explicit_time">explicit_time</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/gh-pages/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="gh-pages" data-skip-pjax="true" rel="nofollow" title="gh-pages">gh-pages</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/master/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" data-skip-pjax="true" rel="nofollow" title="master">master</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/rng_refactor/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="rng_refactor" data-skip-pjax="true" rel="nofollow" title="rng_refactor">rng_refactor</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.4/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.4" data-skip-pjax="true" rel="nofollow" title="v1.4">v1.4</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1_uuid/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1_uuid" data-skip-pjax="true" rel="nofollow" title="v1_uuid">v1_uuid</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v2.0.0/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v2.0.0" data-skip-pjax="true" rel="nofollow" title="v2.0.0">v2.0.0</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.3.3/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.3.3" data-skip-pjax="true" rel="nofollow" title="v1.3.3">v1.3.3</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.3.2/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.3.2" data-skip-pjax="true" rel="nofollow" title="v1.3.2">v1.3.2</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.3.1/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.3.1" data-skip-pjax="true" rel="nofollow" title="v1.3.1">v1.3.1</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.3/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.3" data-skip-pjax="true" rel="nofollow" title="v1.3">v1.3</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.2/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.2" data-skip-pjax="true" rel="nofollow" title="v1.2">v1.2</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.1/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.1" data-skip-pjax="true" rel="nofollow" title="v1.1">v1.1</a>
            </div> <!-- /.select-menu-item -->
            <div class="select-menu-item js-navigation-item ">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/broofa/node-uuid/blob/v1.0/uuid.js" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="v1.0" data-skip-pjax="true" rel="nofollow" title="v1.0">v1.0</a>
            </div> <!-- /.select-menu-item -->
        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/broofa/node-uuid" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">node-uuid</span></a></span></span><span class="separator"> / </span><strong class="final-path">uuid.js</strong> <span class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="uuid.js" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/f841d8dbee9acd0a1a6cea244f9c276f?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/bwrrp" rel="author">bwrrp</a></span>
    <time class="js-relative-date" datetime="2013-05-16T06:33:37-07:00" title="2013-05-16 06:33:37">May 16, 2013</time>
    <div class="commit-title">
        <a href="/broofa/node-uuid/commit/829ff51076eb47cfb000171bb920b4d91f77bd61" class="message">Allow non-global define in AMD detection</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>8</strong> contributors</a></p>
          <a class="avatar tooltipped downwards" title="broofa" href="/broofa/node-uuid/commits/master/uuid.js?author=broofa"><img height="20" src="https://secure.gravatar.com/avatar/2edce239a83772318425ae41aee4f637?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="ctavan" href="/broofa/node-uuid/commits/master/uuid.js?author=ctavan"><img height="20" src="https://secure.gravatar.com/avatar/4d16b5a5eb1ad9772675f88827711325?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="oatkiller" href="/broofa/node-uuid/commits/master/uuid.js?author=oatkiller"><img height="20" src="https://secure.gravatar.com/avatar/238fe5addf50f2558b0f63b2c1c73156?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="bwrrp" href="/broofa/node-uuid/commits/master/uuid.js?author=bwrrp"><img height="20" src="https://secure.gravatar.com/avatar/f841d8dbee9acd0a1a6cea244f9c276f?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="kenhkan" href="/broofa/node-uuid/commits/master/uuid.js?author=kenhkan"><img height="20" src="https://secure.gravatar.com/avatar/3db61a4a42000b4ff62648c0979e8920?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="JasonWoof" href="/broofa/node-uuid/commits/master/uuid.js?author=JasonWoof"><img height="20" src="https://secure.gravatar.com/avatar/57b8e00c56ecb5b3b68d3fbb7ee061f9?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="sobrinho" href="/broofa/node-uuid/commits/master/uuid.js?author=sobrinho"><img height="20" src="https://secure.gravatar.com/avatar/c2dc9c02ce7a041285725a4fc9e5f6d2?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>
    <a class="avatar tooltipped downwards" title="xavi-" href="/broofa/node-uuid/commits/master/uuid.js?author=xavi-"><img height="20" src="https://secure.gravatar.com/avatar/4df1cfae6e8c7fbdb013818785318aa7?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/2edce239a83772318425ae41aee4f637?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/broofa">broofa</a>
        </li>
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/4d16b5a5eb1ad9772675f88827711325?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/ctavan">ctavan</a>
        </li>
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/238fe5addf50f2558b0f63b2c1c73156?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/oatkiller">oatkiller</a>
        </li>
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/f841d8dbee9acd0a1a6cea244f9c276f?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/bwrrp">bwrrp</a>
        </li>
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/3db61a4a42000b4ff62648c0979e8920?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/kenhkan">kenhkan</a>
        </li>
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/57b8e00c56ecb5b3b68d3fbb7ee061f9?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/JasonWoof">JasonWoof</a>
        </li>
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/c2dc9c02ce7a041285725a4fc9e5f6d2?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/sobrinho">sobrinho</a>
        </li>
        <li class="facebox-user-list-item">
          <img height="24" src="https://secure.gravatar.com/avatar/4df1cfae6e8c7fbdb013818785318aa7?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/xavi-">xavi-</a>
        </li>
      </ul>
    </div>
  </div>


<div id="files" class="bubble">
  <div class="file">
    <div class="meta">
      <div class="info">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
          <span>246 lines (198 sloc)</span>
        <span>7.207 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
              <a class="minibutton js-entice" href=""
                 data-entice="You must be signed in and on a branch to make or propose changes">Edit</a>
          <a href="/broofa/node-uuid/raw/master/uuid.js" class="button minibutton " id="raw-url">Raw</a>
            <a href="/broofa/node-uuid/blame/master/uuid.js" class="button minibutton ">Blame</a>
          <a href="/broofa/node-uuid/commits/master/uuid.js" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
            <a class="minibutton danger empty-icon js-entice" href=""
               data-entice="You must be signed in and on a branch to make or propose changes">
            Delete
          </a>
      </div><!-- /.actions -->

    </div>
        <div class="blob-wrapper data type-javascript js-blob-data">
      <table class="file-code file-diff">
        <tr class="file-code-line">
          <td class="blob-line-nums">
            <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>
<span id="L79" rel="#L79">79</span>
<span id="L80" rel="#L80">80</span>
<span id="L81" rel="#L81">81</span>
<span id="L82" rel="#L82">82</span>
<span id="L83" rel="#L83">83</span>
<span id="L84" rel="#L84">84</span>
<span id="L85" rel="#L85">85</span>
<span id="L86" rel="#L86">86</span>
<span id="L87" rel="#L87">87</span>
<span id="L88" rel="#L88">88</span>
<span id="L89" rel="#L89">89</span>
<span id="L90" rel="#L90">90</span>
<span id="L91" rel="#L91">91</span>
<span id="L92" rel="#L92">92</span>
<span id="L93" rel="#L93">93</span>
<span id="L94" rel="#L94">94</span>
<span id="L95" rel="#L95">95</span>
<span id="L96" rel="#L96">96</span>
<span id="L97" rel="#L97">97</span>
<span id="L98" rel="#L98">98</span>
<span id="L99" rel="#L99">99</span>
<span id="L100" rel="#L100">100</span>
<span id="L101" rel="#L101">101</span>
<span id="L102" rel="#L102">102</span>
<span id="L103" rel="#L103">103</span>
<span id="L104" rel="#L104">104</span>
<span id="L105" rel="#L105">105</span>
<span id="L106" rel="#L106">106</span>
<span id="L107" rel="#L107">107</span>
<span id="L108" rel="#L108">108</span>
<span id="L109" rel="#L109">109</span>
<span id="L110" rel="#L110">110</span>
<span id="L111" rel="#L111">111</span>
<span id="L112" rel="#L112">112</span>
<span id="L113" rel="#L113">113</span>
<span id="L114" rel="#L114">114</span>
<span id="L115" rel="#L115">115</span>
<span id="L116" rel="#L116">116</span>
<span id="L117" rel="#L117">117</span>
<span id="L118" rel="#L118">118</span>
<span id="L119" rel="#L119">119</span>
<span id="L120" rel="#L120">120</span>
<span id="L121" rel="#L121">121</span>
<span id="L122" rel="#L122">122</span>
<span id="L123" rel="#L123">123</span>
<span id="L124" rel="#L124">124</span>
<span id="L125" rel="#L125">125</span>
<span id="L126" rel="#L126">126</span>
<span id="L127" rel="#L127">127</span>
<span id="L128" rel="#L128">128</span>
<span id="L129" rel="#L129">129</span>
<span id="L130" rel="#L130">130</span>
<span id="L131" rel="#L131">131</span>
<span id="L132" rel="#L132">132</span>
<span id="L133" rel="#L133">133</span>
<span id="L134" rel="#L134">134</span>
<span id="L135" rel="#L135">135</span>
<span id="L136" rel="#L136">136</span>
<span id="L137" rel="#L137">137</span>
<span id="L138" rel="#L138">138</span>
<span id="L139" rel="#L139">139</span>
<span id="L140" rel="#L140">140</span>
<span id="L141" rel="#L141">141</span>
<span id="L142" rel="#L142">142</span>
<span id="L143" rel="#L143">143</span>
<span id="L144" rel="#L144">144</span>
<span id="L145" rel="#L145">145</span>
<span id="L146" rel="#L146">146</span>
<span id="L147" rel="#L147">147</span>
<span id="L148" rel="#L148">148</span>
<span id="L149" rel="#L149">149</span>
<span id="L150" rel="#L150">150</span>
<span id="L151" rel="#L151">151</span>
<span id="L152" rel="#L152">152</span>
<span id="L153" rel="#L153">153</span>
<span id="L154" rel="#L154">154</span>
<span id="L155" rel="#L155">155</span>
<span id="L156" rel="#L156">156</span>
<span id="L157" rel="#L157">157</span>
<span id="L158" rel="#L158">158</span>
<span id="L159" rel="#L159">159</span>
<span id="L160" rel="#L160">160</span>
<span id="L161" rel="#L161">161</span>
<span id="L162" rel="#L162">162</span>
<span id="L163" rel="#L163">163</span>
<span id="L164" rel="#L164">164</span>
<span id="L165" rel="#L165">165</span>
<span id="L166" rel="#L166">166</span>
<span id="L167" rel="#L167">167</span>
<span id="L168" rel="#L168">168</span>
<span id="L169" rel="#L169">169</span>
<span id="L170" rel="#L170">170</span>
<span id="L171" rel="#L171">171</span>
<span id="L172" rel="#L172">172</span>
<span id="L173" rel="#L173">173</span>
<span id="L174" rel="#L174">174</span>
<span id="L175" rel="#L175">175</span>
<span id="L176" rel="#L176">176</span>
<span id="L177" rel="#L177">177</span>
<span id="L178" rel="#L178">178</span>
<span id="L179" rel="#L179">179</span>
<span id="L180" rel="#L180">180</span>
<span id="L181" rel="#L181">181</span>
<span id="L182" rel="#L182">182</span>
<span id="L183" rel="#L183">183</span>
<span id="L184" rel="#L184">184</span>
<span id="L185" rel="#L185">185</span>
<span id="L186" rel="#L186">186</span>
<span id="L187" rel="#L187">187</span>
<span id="L188" rel="#L188">188</span>
<span id="L189" rel="#L189">189</span>
<span id="L190" rel="#L190">190</span>
<span id="L191" rel="#L191">191</span>
<span id="L192" rel="#L192">192</span>
<span id="L193" rel="#L193">193</span>
<span id="L194" rel="#L194">194</span>
<span id="L195" rel="#L195">195</span>
<span id="L196" rel="#L196">196</span>
<span id="L197" rel="#L197">197</span>
<span id="L198" rel="#L198">198</span>
<span id="L199" rel="#L199">199</span>
<span id="L200" rel="#L200">200</span>
<span id="L201" rel="#L201">201</span>
<span id="L202" rel="#L202">202</span>
<span id="L203" rel="#L203">203</span>
<span id="L204" rel="#L204">204</span>
<span id="L205" rel="#L205">205</span>
<span id="L206" rel="#L206">206</span>
<span id="L207" rel="#L207">207</span>
<span id="L208" rel="#L208">208</span>
<span id="L209" rel="#L209">209</span>
<span id="L210" rel="#L210">210</span>
<span id="L211" rel="#L211">211</span>
<span id="L212" rel="#L212">212</span>
<span id="L213" rel="#L213">213</span>
<span id="L214" rel="#L214">214</span>
<span id="L215" rel="#L215">215</span>
<span id="L216" rel="#L216">216</span>
<span id="L217" rel="#L217">217</span>
<span id="L218" rel="#L218">218</span>
<span id="L219" rel="#L219">219</span>
<span id="L220" rel="#L220">220</span>
<span id="L221" rel="#L221">221</span>
<span id="L222" rel="#L222">222</span>
<span id="L223" rel="#L223">223</span>
<span id="L224" rel="#L224">224</span>
<span id="L225" rel="#L225">225</span>
<span id="L226" rel="#L226">226</span>
<span id="L227" rel="#L227">227</span>
<span id="L228" rel="#L228">228</span>
<span id="L229" rel="#L229">229</span>
<span id="L230" rel="#L230">230</span>
<span id="L231" rel="#L231">231</span>
<span id="L232" rel="#L232">232</span>
<span id="L233" rel="#L233">233</span>
<span id="L234" rel="#L234">234</span>
<span id="L235" rel="#L235">235</span>
<span id="L236" rel="#L236">236</span>
<span id="L237" rel="#L237">237</span>
<span id="L238" rel="#L238">238</span>
<span id="L239" rel="#L239">239</span>
<span id="L240" rel="#L240">240</span>
<span id="L241" rel="#L241">241</span>
<span id="L242" rel="#L242">242</span>
<span id="L243" rel="#L243">243</span>
<span id="L244" rel="#L244">244</span>
<span id="L245" rel="#L245">245</span>

          </td>
          <td class="blob-line-code">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="c1">//     uuid.js</span></div><div class='line' id='LC2'><span class="c1">//</span></div><div class='line' id='LC3'><span class="c1">//     Copyright (c) 2010-2012 Robert Kieffer</span></div><div class='line' id='LC4'><span class="c1">//     MIT License - http://opensource.org/licenses/mit-license.php</span></div><div class='line' id='LC5'><br/></div><div class='line' id='LC6'><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC7'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_global</span> <span class="o">=</span> <span class="k">this</span><span class="p">;</span></div><div class='line' id='LC8'><br/></div><div class='line' id='LC9'>&nbsp;&nbsp;<span class="c1">// Unique ID creation requires a high quality random # generator.  We feature</span></div><div class='line' id='LC10'>&nbsp;&nbsp;<span class="c1">// detect to determine the best RNG source, normalizing to a function that</span></div><div class='line' id='LC11'>&nbsp;&nbsp;<span class="c1">// returns 128-bits of randomness, since that&#39;s what&#39;s usually required</span></div><div class='line' id='LC12'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_rng</span><span class="p">;</span></div><div class='line' id='LC13'><br/></div><div class='line' id='LC14'>&nbsp;&nbsp;<span class="c1">// Node.js crypto-based RNG - http://nodejs.org/docs/v0.6.2/api/crypto.html</span></div><div class='line' id='LC15'>&nbsp;&nbsp;<span class="c1">//</span></div><div class='line' id='LC16'>&nbsp;&nbsp;<span class="c1">// Moderately fast, high quality</span></div><div class='line' id='LC17'>&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="k">typeof</span><span class="p">(</span><span class="nx">require</span><span class="p">)</span> <span class="o">==</span> <span class="s1">&#39;function&#39;</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC18'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">try</span> <span class="p">{</span></div><div class='line' id='LC19'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_rb</span> <span class="o">=</span> <span class="nx">require</span><span class="p">(</span><span class="s1">&#39;crypto&#39;</span><span class="p">).</span><span class="nx">randomBytes</span><span class="p">;</span></div><div class='line' id='LC20'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_rng</span> <span class="o">=</span> <span class="nx">_rb</span> <span class="o">&amp;&amp;</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span><span class="k">return</span> <span class="nx">_rb</span><span class="p">(</span><span class="mi">16</span><span class="p">);};</span></div><div class='line' id='LC21'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span> <span class="k">catch</span><span class="p">(</span><span class="nx">e</span><span class="p">)</span> <span class="p">{}</span></div><div class='line' id='LC22'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC23'><br/></div><div class='line' id='LC24'>&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">_rng</span> <span class="o">&amp;&amp;</span> <span class="nx">_global</span><span class="p">.</span><span class="nx">crypto</span> <span class="o">&amp;&amp;</span> <span class="nx">crypto</span><span class="p">.</span><span class="nx">getRandomValues</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC25'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// WHATWG crypto-based RNG - http://wiki.whatwg.org/wiki/Crypto</span></div><div class='line' id='LC26'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">//</span></div><div class='line' id='LC27'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Moderately fast, high quality</span></div><div class='line' id='LC28'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_rnds8</span> <span class="o">=</span> <span class="k">new</span> <span class="nx">Uint8Array</span><span class="p">(</span><span class="mi">16</span><span class="p">);</span></div><div class='line' id='LC29'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_rng</span> <span class="o">=</span> <span class="kd">function</span> <span class="nx">whatwgRNG</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC30'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">crypto</span><span class="p">.</span><span class="nx">getRandomValues</span><span class="p">(</span><span class="nx">_rnds8</span><span class="p">);</span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="nx">_rnds8</span><span class="p">;</span></div><div class='line' id='LC32'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC33'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC34'><br/></div><div class='line' id='LC35'>&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="o">!</span><span class="nx">_rng</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC36'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Math.random()-based (RNG)</span></div><div class='line' id='LC37'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">//</span></div><div class='line' id='LC38'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// If all else fails, use Math.random().  It&#39;s fast, but is of unspecified</span></div><div class='line' id='LC39'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// quality.</span></div><div class='line' id='LC40'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span>  <span class="nx">_rnds</span> <span class="o">=</span> <span class="k">new</span> <span class="nb">Array</span><span class="p">(</span><span class="mi">16</span><span class="p">);</span></div><div class='line' id='LC41'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_rng</span> <span class="o">=</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC42'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="mi">0</span><span class="p">,</span> <span class="nx">r</span><span class="p">;</span> <span class="nx">i</span> <span class="o">&lt;</span> <span class="mi">16</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC43'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">((</span><span class="nx">i</span> <span class="o">&amp;</span> <span class="mh">0x03</span><span class="p">)</span> <span class="o">===</span> <span class="mi">0</span><span class="p">)</span> <span class="nx">r</span> <span class="o">=</span> <span class="nb">Math</span><span class="p">.</span><span class="nx">random</span><span class="p">()</span> <span class="o">*</span> <span class="mh">0x100000000</span><span class="p">;</span></div><div class='line' id='LC44'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_rnds</span><span class="p">[</span><span class="nx">i</span><span class="p">]</span> <span class="o">=</span> <span class="nx">r</span> <span class="o">&gt;&gt;&gt;</span> <span class="p">((</span><span class="nx">i</span> <span class="o">&amp;</span> <span class="mh">0x03</span><span class="p">)</span> <span class="o">&lt;&lt;</span> <span class="mi">3</span><span class="p">)</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC45'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC46'><br/></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="nx">_rnds</span><span class="p">;</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC49'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC50'><br/></div><div class='line' id='LC51'>&nbsp;&nbsp;<span class="c1">// Buffer class to use</span></div><div class='line' id='LC52'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">BufferClass</span> <span class="o">=</span> <span class="k">typeof</span><span class="p">(</span><span class="nx">Buffer</span><span class="p">)</span> <span class="o">==</span> <span class="s1">&#39;function&#39;</span> <span class="o">?</span> <span class="nx">Buffer</span> <span class="o">:</span> <span class="nb">Array</span><span class="p">;</span></div><div class='line' id='LC53'><br/></div><div class='line' id='LC54'>&nbsp;&nbsp;<span class="c1">// Maps for number &lt;-&gt; hex string conversion</span></div><div class='line' id='LC55'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_byteToHex</span> <span class="o">=</span> <span class="p">[];</span></div><div class='line' id='LC56'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_hexToByte</span> <span class="o">=</span> <span class="p">{};</span></div><div class='line' id='LC57'>&nbsp;&nbsp;<span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="nx">i</span> <span class="o">&lt;</span> <span class="mi">256</span><span class="p">;</span> <span class="nx">i</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC58'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_byteToHex</span><span class="p">[</span><span class="nx">i</span><span class="p">]</span> <span class="o">=</span> <span class="p">(</span><span class="nx">i</span> <span class="o">+</span> <span class="mh">0x100</span><span class="p">).</span><span class="nx">toString</span><span class="p">(</span><span class="mi">16</span><span class="p">).</span><span class="nx">substr</span><span class="p">(</span><span class="mi">1</span><span class="p">);</span></div><div class='line' id='LC59'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_hexToByte</span><span class="p">[</span><span class="nx">_byteToHex</span><span class="p">[</span><span class="nx">i</span><span class="p">]]</span> <span class="o">=</span> <span class="nx">i</span><span class="p">;</span></div><div class='line' id='LC60'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC61'><br/></div><div class='line' id='LC62'>&nbsp;&nbsp;<span class="c1">// **`parse()` - Parse a UUID into it&#39;s component bytes**</span></div><div class='line' id='LC63'>&nbsp;&nbsp;<span class="kd">function</span> <span class="nx">parse</span><span class="p">(</span><span class="nx">s</span><span class="p">,</span> <span class="nx">buf</span><span class="p">,</span> <span class="nx">offset</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="p">(</span><span class="nx">buf</span> <span class="o">&amp;&amp;</span> <span class="nx">offset</span><span class="p">)</span> <span class="o">||</span> <span class="mi">0</span><span class="p">,</span> <span class="nx">ii</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span></div><div class='line' id='LC65'><br/></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">buf</span> <span class="o">=</span> <span class="nx">buf</span> <span class="o">||</span> <span class="p">[];</span></div><div class='line' id='LC67'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">s</span><span class="p">.</span><span class="nx">toLowerCase</span><span class="p">().</span><span class="nx">replace</span><span class="p">(</span><span class="sr">/[0-9a-f]{2}/g</span><span class="p">,</span> <span class="kd">function</span><span class="p">(</span><span class="nx">oct</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC68'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">ii</span> <span class="o">&lt;</span> <span class="mi">16</span><span class="p">)</span> <span class="p">{</span> <span class="c1">// Don&#39;t overflow!</span></div><div class='line' id='LC69'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">buf</span><span class="p">[</span><span class="nx">i</span> <span class="o">+</span> <span class="nx">ii</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">_hexToByte</span><span class="p">[</span><span class="nx">oct</span><span class="p">];</span></div><div class='line' id='LC70'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC71'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">});</span></div><div class='line' id='LC72'><br/></div><div class='line' id='LC73'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Zero out remaining bytes if string was short</span></div><div class='line' id='LC74'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">while</span> <span class="p">(</span><span class="nx">ii</span> <span class="o">&lt;</span> <span class="mi">16</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC75'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">buf</span><span class="p">[</span><span class="nx">i</span> <span class="o">+</span> <span class="nx">ii</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span></div><div class='line' id='LC76'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC77'><br/></div><div class='line' id='LC78'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="nx">buf</span><span class="p">;</span></div><div class='line' id='LC79'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC80'><br/></div><div class='line' id='LC81'>&nbsp;&nbsp;<span class="c1">// **`unparse()` - Convert UUID byte array (ala parse()) into a string**</span></div><div class='line' id='LC82'>&nbsp;&nbsp;<span class="kd">function</span> <span class="nx">unparse</span><span class="p">(</span><span class="nx">buf</span><span class="p">,</span> <span class="nx">offset</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC83'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="nx">offset</span> <span class="o">||</span> <span class="mi">0</span><span class="p">,</span> <span class="nx">bth</span> <span class="o">=</span> <span class="nx">_byteToHex</span><span class="p">;</span></div><div class='line' id='LC84'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span>  <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span></div><div class='line' id='LC85'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="s1">&#39;-&#39;</span> <span class="o">+</span></div><div class='line' id='LC86'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="s1">&#39;-&#39;</span> <span class="o">+</span></div><div class='line' id='LC87'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="s1">&#39;-&#39;</span> <span class="o">+</span></div><div class='line' id='LC88'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="s1">&#39;-&#39;</span> <span class="o">+</span></div><div class='line' id='LC89'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span></div><div class='line' id='LC90'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span></div><div class='line' id='LC91'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]]</span> <span class="o">+</span> <span class="nx">bth</span><span class="p">[</span><span class="nx">buf</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]];</span></div><div class='line' id='LC92'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC93'><br/></div><div class='line' id='LC94'>&nbsp;&nbsp;<span class="c1">// **`v1()` - Generate time-based UUID**</span></div><div class='line' id='LC95'>&nbsp;&nbsp;<span class="c1">//</span></div><div class='line' id='LC96'>&nbsp;&nbsp;<span class="c1">// Inspired by https://github.com/LiosK/UUID.js</span></div><div class='line' id='LC97'>&nbsp;&nbsp;<span class="c1">// and http://docs.python.org/library/uuid.html</span></div><div class='line' id='LC98'><br/></div><div class='line' id='LC99'>&nbsp;&nbsp;<span class="c1">// random #&#39;s we need to init node and clockseq</span></div><div class='line' id='LC100'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_seedBytes</span> <span class="o">=</span> <span class="nx">_rng</span><span class="p">();</span></div><div class='line' id='LC101'><br/></div><div class='line' id='LC102'>&nbsp;&nbsp;<span class="c1">// Per 4.5, create and 48-bit node id, (47 random bits + multicast bit = 1)</span></div><div class='line' id='LC103'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_nodeId</span> <span class="o">=</span> <span class="p">[</span></div><div class='line' id='LC104'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">0</span><span class="p">]</span> <span class="o">|</span> <span class="mh">0x01</span><span class="p">,</span></div><div class='line' id='LC105'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">1</span><span class="p">],</span> <span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">2</span><span class="p">],</span> <span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">3</span><span class="p">],</span> <span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">4</span><span class="p">],</span> <span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">5</span><span class="p">]</span></div><div class='line' id='LC106'>&nbsp;&nbsp;<span class="p">];</span></div><div class='line' id='LC107'><br/></div><div class='line' id='LC108'>&nbsp;&nbsp;<span class="c1">// Per 4.2.2, randomize (14 bit) clockseq</span></div><div class='line' id='LC109'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_clockseq</span> <span class="o">=</span> <span class="p">(</span><span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">6</span><span class="p">]</span> <span class="o">&lt;&lt;</span> <span class="mi">8</span> <span class="o">|</span> <span class="nx">_seedBytes</span><span class="p">[</span><span class="mi">7</span><span class="p">])</span> <span class="o">&amp;</span> <span class="mh">0x3fff</span><span class="p">;</span></div><div class='line' id='LC110'><br/></div><div class='line' id='LC111'>&nbsp;&nbsp;<span class="c1">// Previous uuid creation time</span></div><div class='line' id='LC112'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_lastMSecs</span> <span class="o">=</span> <span class="mi">0</span><span class="p">,</span> <span class="nx">_lastNSecs</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span></div><div class='line' id='LC113'><br/></div><div class='line' id='LC114'>&nbsp;&nbsp;<span class="c1">// See https://github.com/broofa/node-uuid for API details</span></div><div class='line' id='LC115'>&nbsp;&nbsp;<span class="kd">function</span> <span class="nx">v1</span><span class="p">(</span><span class="nx">options</span><span class="p">,</span> <span class="nx">buf</span><span class="p">,</span> <span class="nx">offset</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC116'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="nx">buf</span> <span class="o">&amp;&amp;</span> <span class="nx">offset</span> <span class="o">||</span> <span class="mi">0</span><span class="p">;</span></div><div class='line' id='LC117'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">b</span> <span class="o">=</span> <span class="nx">buf</span> <span class="o">||</span> <span class="p">[];</span></div><div class='line' id='LC118'><br/></div><div class='line' id='LC119'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span> <span class="o">=</span> <span class="nx">options</span> <span class="o">||</span> <span class="p">{};</span></div><div class='line' id='LC120'><br/></div><div class='line' id='LC121'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">clockseq</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">clockseq</span> <span class="o">!=</span> <span class="kc">null</span> <span class="o">?</span> <span class="nx">options</span><span class="p">.</span><span class="nx">clockseq</span> <span class="o">:</span> <span class="nx">_clockseq</span><span class="p">;</span></div><div class='line' id='LC122'><br/></div><div class='line' id='LC123'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// UUID timestamps are 100 nano-second units since the Gregorian epoch,</span></div><div class='line' id='LC124'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// (1582-10-15 00:00).  JSNumbers aren&#39;t precise enough for this, so</span></div><div class='line' id='LC125'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// time is handled internally as &#39;msecs&#39; (integer milliseconds) and &#39;nsecs&#39;</span></div><div class='line' id='LC126'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// (100-nanoseconds offset from msecs) since unix epoch, 1970-01-01 00:00.</span></div><div class='line' id='LC127'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">msecs</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">msecs</span> <span class="o">!=</span> <span class="kc">null</span> <span class="o">?</span> <span class="nx">options</span><span class="p">.</span><span class="nx">msecs</span> <span class="o">:</span> <span class="k">new</span> <span class="nb">Date</span><span class="p">().</span><span class="nx">getTime</span><span class="p">();</span></div><div class='line' id='LC128'><br/></div><div class='line' id='LC129'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Per 4.2.1.2, use count of uuid&#39;s generated during the current clock</span></div><div class='line' id='LC130'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// cycle to simulate higher resolution clock</span></div><div class='line' id='LC131'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">nsecs</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">nsecs</span> <span class="o">!=</span> <span class="kc">null</span> <span class="o">?</span> <span class="nx">options</span><span class="p">.</span><span class="nx">nsecs</span> <span class="o">:</span> <span class="nx">_lastNSecs</span> <span class="o">+</span> <span class="mi">1</span><span class="p">;</span></div><div class='line' id='LC132'><br/></div><div class='line' id='LC133'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Time since last uuid creation (in msecs)</span></div><div class='line' id='LC134'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">dt</span> <span class="o">=</span> <span class="p">(</span><span class="nx">msecs</span> <span class="o">-</span> <span class="nx">_lastMSecs</span><span class="p">)</span> <span class="o">+</span> <span class="p">(</span><span class="nx">nsecs</span> <span class="o">-</span> <span class="nx">_lastNSecs</span><span class="p">)</span><span class="o">/</span><span class="mi">10000</span><span class="p">;</span></div><div class='line' id='LC135'><br/></div><div class='line' id='LC136'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Per 4.2.1.2, Bump clockseq on clock regression</span></div><div class='line' id='LC137'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">dt</span> <span class="o">&lt;</span> <span class="mi">0</span> <span class="o">&amp;&amp;</span> <span class="nx">options</span><span class="p">.</span><span class="nx">clockseq</span> <span class="o">==</span> <span class="kc">null</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC138'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">clockseq</span> <span class="o">=</span> <span class="nx">clockseq</span> <span class="o">+</span> <span class="mi">1</span> <span class="o">&amp;</span> <span class="mh">0x3fff</span><span class="p">;</span></div><div class='line' id='LC139'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC140'><br/></div><div class='line' id='LC141'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Reset nsecs if clock regresses (new clockseq) or we&#39;ve moved onto a new</span></div><div class='line' id='LC142'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// time interval</span></div><div class='line' id='LC143'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">((</span><span class="nx">dt</span> <span class="o">&lt;</span> <span class="mi">0</span> <span class="o">||</span> <span class="nx">msecs</span> <span class="o">&gt;</span> <span class="nx">_lastMSecs</span><span class="p">)</span> <span class="o">&amp;&amp;</span> <span class="nx">options</span><span class="p">.</span><span class="nx">nsecs</span> <span class="o">==</span> <span class="kc">null</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC144'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">nsecs</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span></div><div class='line' id='LC145'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC146'><br/></div><div class='line' id='LC147'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Per 4.2.1.2 Throw error if too many uuids are requested</span></div><div class='line' id='LC148'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">nsecs</span> <span class="o">&gt;=</span> <span class="mi">10000</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC149'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">throw</span> <span class="k">new</span> <span class="nb">Error</span><span class="p">(</span><span class="s1">&#39;uuid.v1(): Can\&#39;t create more than 10M uuids/sec&#39;</span><span class="p">);</span></div><div class='line' id='LC150'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC151'><br/></div><div class='line' id='LC152'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_lastMSecs</span> <span class="o">=</span> <span class="nx">msecs</span><span class="p">;</span></div><div class='line' id='LC153'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_lastNSecs</span> <span class="o">=</span> <span class="nx">nsecs</span><span class="p">;</span></div><div class='line' id='LC154'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_clockseq</span> <span class="o">=</span> <span class="nx">clockseq</span><span class="p">;</span></div><div class='line' id='LC155'><br/></div><div class='line' id='LC156'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Per 4.1.4 - Convert from unix epoch to Gregorian epoch</span></div><div class='line' id='LC157'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">msecs</span> <span class="o">+=</span> <span class="mi">12219292800000</span><span class="p">;</span></div><div class='line' id='LC158'><br/></div><div class='line' id='LC159'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// `time_low`</span></div><div class='line' id='LC160'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">tl</span> <span class="o">=</span> <span class="p">((</span><span class="nx">msecs</span> <span class="o">&amp;</span> <span class="mh">0xfffffff</span><span class="p">)</span> <span class="o">*</span> <span class="mi">10000</span> <span class="o">+</span> <span class="nx">nsecs</span><span class="p">)</span> <span class="o">%</span> <span class="mh">0x100000000</span><span class="p">;</span></div><div class='line' id='LC161'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tl</span> <span class="o">&gt;&gt;&gt;</span> <span class="mi">24</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC162'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tl</span> <span class="o">&gt;&gt;&gt;</span> <span class="mi">16</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC163'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tl</span> <span class="o">&gt;&gt;&gt;</span> <span class="mi">8</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC164'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tl</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC165'><br/></div><div class='line' id='LC166'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// `time_mid`</span></div><div class='line' id='LC167'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">tmh</span> <span class="o">=</span> <span class="p">(</span><span class="nx">msecs</span> <span class="o">/</span> <span class="mh">0x100000000</span> <span class="o">*</span> <span class="mi">10000</span><span class="p">)</span> <span class="o">&amp;</span> <span class="mh">0xfffffff</span><span class="p">;</span></div><div class='line' id='LC168'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tmh</span> <span class="o">&gt;&gt;&gt;</span> <span class="mi">8</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC169'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tmh</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC170'><br/></div><div class='line' id='LC171'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// `time_high_and_version`</span></div><div class='line' id='LC172'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tmh</span> <span class="o">&gt;&gt;&gt;</span> <span class="mi">24</span> <span class="o">&amp;</span> <span class="mh">0xf</span> <span class="o">|</span> <span class="mh">0x10</span><span class="p">;</span> <span class="c1">// include version</span></div><div class='line' id='LC173'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">tmh</span> <span class="o">&gt;&gt;&gt;</span> <span class="mi">16</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC174'><br/></div><div class='line' id='LC175'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// `clock_seq_hi_and_reserved` (Per 4.2.2 - include variant)</span></div><div class='line' id='LC176'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">clockseq</span> <span class="o">&gt;&gt;&gt;</span> <span class="mi">8</span> <span class="o">|</span> <span class="mh">0x80</span><span class="p">;</span></div><div class='line' id='LC177'><br/></div><div class='line' id='LC178'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// `clock_seq_low`</span></div><div class='line' id='LC179'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span><span class="o">++</span><span class="p">]</span> <span class="o">=</span> <span class="nx">clockseq</span> <span class="o">&amp;</span> <span class="mh">0xff</span><span class="p">;</span></div><div class='line' id='LC180'><br/></div><div class='line' id='LC181'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// `node`</span></div><div class='line' id='LC182'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">node</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">node</span> <span class="o">||</span> <span class="nx">_nodeId</span><span class="p">;</span></div><div class='line' id='LC183'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">n</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="nx">n</span> <span class="o">&lt;</span> <span class="mi">6</span><span class="p">;</span> <span class="nx">n</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC184'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">b</span><span class="p">[</span><span class="nx">i</span> <span class="o">+</span> <span class="nx">n</span><span class="p">]</span> <span class="o">=</span> <span class="nx">node</span><span class="p">[</span><span class="nx">n</span><span class="p">];</span></div><div class='line' id='LC185'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC186'><br/></div><div class='line' id='LC187'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="nx">buf</span> <span class="o">?</span> <span class="nx">buf</span> <span class="o">:</span> <span class="nx">unparse</span><span class="p">(</span><span class="nx">b</span><span class="p">);</span></div><div class='line' id='LC188'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC189'><br/></div><div class='line' id='LC190'>&nbsp;&nbsp;<span class="c1">// **`v4()` - Generate random UUID**</span></div><div class='line' id='LC191'><br/></div><div class='line' id='LC192'>&nbsp;&nbsp;<span class="c1">// See https://github.com/broofa/node-uuid for API details</span></div><div class='line' id='LC193'>&nbsp;&nbsp;<span class="kd">function</span> <span class="nx">v4</span><span class="p">(</span><span class="nx">options</span><span class="p">,</span> <span class="nx">buf</span><span class="p">,</span> <span class="nx">offset</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC194'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Deprecated - &#39;format&#39; argument, as supported in v1.2</span></div><div class='line' id='LC195'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">i</span> <span class="o">=</span> <span class="nx">buf</span> <span class="o">&amp;&amp;</span> <span class="nx">offset</span> <span class="o">||</span> <span class="mi">0</span><span class="p">;</span></div><div class='line' id='LC196'><br/></div><div class='line' id='LC197'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="k">typeof</span><span class="p">(</span><span class="nx">options</span><span class="p">)</span> <span class="o">==</span> <span class="s1">&#39;string&#39;</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC198'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">buf</span> <span class="o">=</span> <span class="nx">options</span> <span class="o">==</span> <span class="s1">&#39;binary&#39;</span> <span class="o">?</span> <span class="k">new</span> <span class="nx">BufferClass</span><span class="p">(</span><span class="mi">16</span><span class="p">)</span> <span class="o">:</span> <span class="kc">null</span><span class="p">;</span></div><div class='line' id='LC199'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span> <span class="o">=</span> <span class="kc">null</span><span class="p">;</span></div><div class='line' id='LC200'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC201'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">options</span> <span class="o">=</span> <span class="nx">options</span> <span class="o">||</span> <span class="p">{};</span></div><div class='line' id='LC202'><br/></div><div class='line' id='LC203'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">rnds</span> <span class="o">=</span> <span class="nx">options</span><span class="p">.</span><span class="nx">random</span> <span class="o">||</span> <span class="p">(</span><span class="nx">options</span><span class="p">.</span><span class="nx">rng</span> <span class="o">||</span> <span class="nx">_rng</span><span class="p">)();</span></div><div class='line' id='LC204'><br/></div><div class='line' id='LC205'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Per 4.4, set bits for version and `clock_seq_hi_and_reserved`</span></div><div class='line' id='LC206'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">rnds</span><span class="p">[</span><span class="mi">6</span><span class="p">]</span> <span class="o">=</span> <span class="p">(</span><span class="nx">rnds</span><span class="p">[</span><span class="mi">6</span><span class="p">]</span> <span class="o">&amp;</span> <span class="mh">0x0f</span><span class="p">)</span> <span class="o">|</span> <span class="mh">0x40</span><span class="p">;</span></div><div class='line' id='LC207'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">rnds</span><span class="p">[</span><span class="mi">8</span><span class="p">]</span> <span class="o">=</span> <span class="p">(</span><span class="nx">rnds</span><span class="p">[</span><span class="mi">8</span><span class="p">]</span> <span class="o">&amp;</span> <span class="mh">0x3f</span><span class="p">)</span> <span class="o">|</span> <span class="mh">0x80</span><span class="p">;</span></div><div class='line' id='LC208'><br/></div><div class='line' id='LC209'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Copy bytes to buffer, if provided</span></div><div class='line' id='LC210'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="nx">buf</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC211'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">for</span> <span class="p">(</span><span class="kd">var</span> <span class="nx">ii</span> <span class="o">=</span> <span class="mi">0</span><span class="p">;</span> <span class="nx">ii</span> <span class="o">&lt;</span> <span class="mi">16</span><span class="p">;</span> <span class="nx">ii</span><span class="o">++</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC212'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">buf</span><span class="p">[</span><span class="nx">i</span> <span class="o">+</span> <span class="nx">ii</span><span class="p">]</span> <span class="o">=</span> <span class="nx">rnds</span><span class="p">[</span><span class="nx">ii</span><span class="p">];</span></div><div class='line' id='LC213'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC214'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC215'><br/></div><div class='line' id='LC216'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="nx">buf</span> <span class="o">||</span> <span class="nx">unparse</span><span class="p">(</span><span class="nx">rnds</span><span class="p">);</span></div><div class='line' id='LC217'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC218'><br/></div><div class='line' id='LC219'>&nbsp;&nbsp;<span class="c1">// Export public API</span></div><div class='line' id='LC220'>&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">uuid</span> <span class="o">=</span> <span class="nx">v4</span><span class="p">;</span></div><div class='line' id='LC221'>&nbsp;&nbsp;<span class="nx">uuid</span><span class="p">.</span><span class="nx">v1</span> <span class="o">=</span> <span class="nx">v1</span><span class="p">;</span></div><div class='line' id='LC222'>&nbsp;&nbsp;<span class="nx">uuid</span><span class="p">.</span><span class="nx">v4</span> <span class="o">=</span> <span class="nx">v4</span><span class="p">;</span></div><div class='line' id='LC223'>&nbsp;&nbsp;<span class="nx">uuid</span><span class="p">.</span><span class="nx">parse</span> <span class="o">=</span> <span class="nx">parse</span><span class="p">;</span></div><div class='line' id='LC224'>&nbsp;&nbsp;<span class="nx">uuid</span><span class="p">.</span><span class="nx">unparse</span> <span class="o">=</span> <span class="nx">unparse</span><span class="p">;</span></div><div class='line' id='LC225'>&nbsp;&nbsp;<span class="nx">uuid</span><span class="p">.</span><span class="nx">BufferClass</span> <span class="o">=</span> <span class="nx">BufferClass</span><span class="p">;</span></div><div class='line' id='LC226'><br/></div><div class='line' id='LC227'>&nbsp;&nbsp;<span class="k">if</span> <span class="p">(</span><span class="k">typeof</span> <span class="nx">define</span> <span class="o">===</span> <span class="s1">&#39;function&#39;</span> <span class="o">&amp;&amp;</span> <span class="nx">define</span><span class="p">.</span><span class="nx">amd</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC228'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Publish as AMD module</span></div><div class='line' id='LC229'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">define</span><span class="p">(</span><span class="kd">function</span><span class="p">()</span> <span class="p">{</span><span class="k">return</span> <span class="nx">uuid</span><span class="p">;});</span></div><div class='line' id='LC230'>&nbsp;&nbsp;<span class="p">}</span> <span class="k">else</span> <span class="k">if</span> <span class="p">(</span><span class="k">typeof</span><span class="p">(</span><span class="nx">module</span><span class="p">)</span> <span class="o">!=</span> <span class="s1">&#39;undefined&#39;</span> <span class="o">&amp;&amp;</span> <span class="nx">module</span><span class="p">.</span><span class="nx">exports</span><span class="p">)</span> <span class="p">{</span></div><div class='line' id='LC231'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Publish as node.js module</span></div><div class='line' id='LC232'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">module</span><span class="p">.</span><span class="nx">exports</span> <span class="o">=</span> <span class="nx">uuid</span><span class="p">;</span></div><div class='line' id='LC233'>&nbsp;&nbsp;<span class="p">}</span> <span class="k">else</span> <span class="p">{</span></div><div class='line' id='LC234'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// Publish as global (in browsers)</span></div><div class='line' id='LC235'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="kd">var</span> <span class="nx">_previousRoot</span> <span class="o">=</span> <span class="nx">_global</span><span class="p">.</span><span class="nx">uuid</span><span class="p">;</span></div><div class='line' id='LC236'><br/></div><div class='line' id='LC237'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="c1">// **`noConflict()` - (browser only) to reset global &#39;uuid&#39; var**</span></div><div class='line' id='LC238'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">uuid</span><span class="p">.</span><span class="nx">noConflict</span> <span class="o">=</span> <span class="kd">function</span><span class="p">()</span> <span class="p">{</span></div><div class='line' id='LC239'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_global</span><span class="p">.</span><span class="nx">uuid</span> <span class="o">=</span> <span class="nx">_previousRoot</span><span class="p">;</span></div><div class='line' id='LC240'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="k">return</span> <span class="nx">uuid</span><span class="p">;</span></div><div class='line' id='LC241'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">};</span></div><div class='line' id='LC242'><br/></div><div class='line' id='LC243'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nx">_global</span><span class="p">.</span><span class="nx">uuid</span> <span class="o">=</span> <span class="nx">uuid</span><span class="p">;</span></div><div class='line' id='LC244'>&nbsp;&nbsp;<span class="p">}</span></div><div class='line' id='LC245'><span class="p">}).</span><span class="nx">call</span><span class="p">(</span><span class="k">this</span><span class="p">);</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2013 <span title="0.04568s from fe4.rs.github.com">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/broofa/node-uuid/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

    
  </body>
</html>

