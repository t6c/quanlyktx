
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset='utf-8'>
        <meta http-equiv='X-UA-Compatible' content='IE=edge'>
        <title>Login | Dormitory Management</title>
        <meta name='viewport' content='width=device-width, initial-scale=1'>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="css/admin-css.css">
    </head>

    <body style="background-image: url('https://huge.vn/wp-content/uploads/2021/03/DH-FPT.jpg')">
        <%

            String error = request.getAttribute("error") + "";
            if (error.equals("null")) {
                error = "Sign in with Staff or Student account!";
            }
        %>
        <div class="container" >
            <div class="row">
                <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                    <div class="card border-0 shadow rounded-3 my-5">
                        <div class="card-body p-4 p-sm-5">
                            <img class="text-center img-fluid" src="https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/FPT_Education_logo.svg/2560px-FPT_Education_logo.svg.png" alt="">
                            <div class="alert alert-danger" role="alert">
                                <%=error%>
                            </div>
                            <form action="login" method="post">
                                <input type="hidden" name="action" value="login"/>
                                <div class="form-floating mb-3">
                                    <input type="text" class="form-control" id="floatingInput" placeholder="Username" name="username">
                                    <label for="floatingInput">Username</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input type="password" class="form-control" id="floatingPassword" placeholder="Password" name="password">
                                    <label for="floatingPassword">Password</label>
                                </div>
                                <div class="d-grid">
                                    <button class="btn btn-primary btn-login text-uppercase fw-bold" name="login" type="submit">Sign
                                        in</button>
                                    
                                </div>
                               

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

    </body>
    
<script>
    // Configs
    let liveChatBaseUrl   = document.location.protocol + '//' + 'livechat.fpt.ai/v36/src'
    let LiveChatSocketUrl = 'livechat.fpt.ai:443'
    let FptAppCode        = 'b959102a7ed00f933126885937774d50'
    let FptAppName        = 'Live support'
    // Define custom styles
    let CustomStyles = {
        // header
        headerBackground: 'linear-gradient(86.7deg, #C459F4FF 0.85%, #7E1CAAFF 98.94%)',
        headerTextColor: '#ffffffff',
        headerLogoEnable: true,
        headerLogoLink: 'https://chatbot-tools.fpt.ai/livechat-builder/img/theme/bank/logo.svg',
        headerText: 'Live support',
        // main
        primaryColor: '#9B34C9FF',
        secondaryColor: '#D8D8D8FF',
        primaryTextColor: '#ffffffff',
        secondaryTextColor: '#1F1F1FFF',
        buttonColor: '#9B34C9B3',
        buttonTextColor: '#ffffffff',
        bodyBackgroundEnable: true,
        bodyBackgroundLink: 'https://chatbot-tools.fpt.ai/livechat-builder/img/theme/bank/body.png',
        avatarBot: 'https://chatbot-tools.fpt.ai/livechat-builder/img/theme/bank/bot.svg',
        sendMessagePlaceholder: 'Enter your message here',
        // float button
        floatButtonLogo: 'https://chatbot-tools.fpt.ai/livechat-builder/img/theme/bank/coin.svg',
        floatButtonTooltip: 'Can I help you?',
        floatButtonTooltipEnable: true,
        // start screen
        customerLogo: 'https://chatbot-tools.fpt.ai/livechat-builder/img/theme/bank/logo.svg',
        customerWelcomeText: 'Please input your name',
        customerButtonText: 'Start',
        prefixEnable: false,
        prefixType: 'radio',
        prefixOptions: ["Anh","Chị"],
        prefixPlaceholder: 'Danh xưng',
        // custom css
        css: ''
    }
    // Get bot code from url if FptAppCode is empty
    if (!FptAppCode) {
        let appCodeFromHash = window.location.hash.substr(1)
        if (appCodeFromHash.length === 32) {
            FptAppCode = appCodeFromHash
        }
    }
    // Set Configs
    let FptLiveChatConfigs = {
        appName: FptAppName,
        appCode: FptAppCode,
        themes : '',
        styles : CustomStyles
    }
    // Append Script
    let FptLiveChatScript  = document.createElement('script')
    FptLiveChatScript.id   = 'fpt_ai_livechat_script'
    FptLiveChatScript.src  = liveChatBaseUrl + '/static/fptai-livechat.js'
    document.body.appendChild(FptLiveChatScript)
    // Append Stylesheet
    let FptLiveChatStyles  = document.createElement('link')
    FptLiveChatStyles.id   = 'fpt_ai_livechat_script'
    FptLiveChatStyles.rel  = 'stylesheet'
    FptLiveChatStyles.href = liveChatBaseUrl + '/static/fptai-livechat.css'
    document.body.appendChild(FptLiveChatStyles)
    // Init
    FptLiveChatScript.onload = function () {
        fpt_ai_render_chatbox(FptLiveChatConfigs, liveChatBaseUrl, LiveChatSocketUrl)
    }
</script>

</html>
