Return-Path: <SRS0=/NdJ=M2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35236C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CFBBC60F41
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 21:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CFBBC60F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A29CB6061A;
	Tue,  3 Aug 2021 21:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f8qJiC5HtJ0m; Tue,  3 Aug 2021 21:20:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id B6B2C60590;
	Tue,  3 Aug 2021 21:20:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F854C001A;
	Tue,  3 Aug 2021 21:20:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C0CFC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48221605E0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:20:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UON2TFvRgmUI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:20:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8774560590
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 21:20:15 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 t7-20020a17090a5d87b029017807007f23so2565820pji.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 14:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=M/M1OI82++wDMxHst+Lp3XlOX/hAUMXD6p/ipUV4ml4=;
 b=l/qfJnsyTiPvU11wsLMorzW4m/OzcPx+oJDgzozM448F8LweaS7C4FnfVo6rcmH95O
 wdr+g/zMP6Wo+42HodMItBdGk/t4ag9FUNCm1NtQvRg4OCUMDNGo+n/CXw6xYRM2r8cY
 SyBXAQFjKUqEiukw+GbsM/ELuRoZKjJhJZdjHQDvbC79rrwuTfwM2gvPJeAqYPaPDWgZ
 3s9PiHcNtRgFld3MtLzBWD9DRs4bqu6d9+b3meIsqo62wxMxY19fPnENiW1nyP+Oroqw
 BdaaPy6A1CcWFwwZ+0irKp9dNn1jPVHXWgqugiF8kcM5c+Fw4rIobjlik8+eL+xSuhJF
 TF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=M/M1OI82++wDMxHst+Lp3XlOX/hAUMXD6p/ipUV4ml4=;
 b=O0bs3ozx7DCVj4NBu9zO0GafCbVOzXh24YarwyPVHH4MOm0nOkCmjQrZUsHMKPuX8P
 +xDqKPC9fUNMRPYA1zNhwgFulu4z2YkXkdOl/08DGoUGY/RMjw1cggDRsmP2BUeEzBIR
 T/jQgJyOf5/wflKwDmppaBvqUlxk5u1+WERhhVrmmBoOt0WPTv+20BUCrR5K6YAa9j+7
 CBDlz67qIO3rbl6IMCBUq0VF5O23Zx8+peFsAnJiGww1sjbV4eqBOiGoSI2fHulYqe+B
 goN6Xwx3pT8tbG5gMg/OHfpp/WrhalAG0u9z2mwTqtDQt0NpZEgALVAZ9rPKyIPLcou0
 hMhg==
X-Gm-Message-State: AOAM5309dp2N3vtgnCvFUeC12MA+I0xUvMX0Fuj3NulV5U/Rhdpjh6IS
 PcI6csKJBkDhwsAzY+uQtRU=
X-Google-Smtp-Source: ABdhPJwkq/KEYqR74CIZKUmxnR/VmPbxUccu3Ad6mcI7zIw5egnU2yPFTwazWj5xSL26Kjl3J/yoZw==
X-Received: by 2002:a17:903:192:b029:12c:bf13:ab28 with SMTP id
 z18-20020a1709030192b029012cbf13ab28mr7869225plg.17.1628025614724; 
 Tue, 03 Aug 2021 14:20:14 -0700 (PDT)
Received: from localhost.localdomain ([47.9.154.212])
 by smtp.googlemail.com with ESMTPSA id b15sm12594pgj.60.2021.08.03.14.20.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 14:20:14 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH v2] Documentation: checkpatch: Add TRAILING_SEMICOLON message
Date: Wed,  4 Aug 2021 02:49:41 +0530
Message-Id: <20210803211941.3646-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CABJPP5CpoFXgZ0WkCJSd-6oiS5D1zyw4irEP049Wr5ANTUgHCA@mail.gmail.com>
References: <CABJPP5CpoFXgZ0WkCJSd-6oiS5D1zyw4irEP049Wr5ANTUgHCA@mail.gmail.com>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: <linux-kernel-mentees.lists.linuxfoundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/linux-kernel-mentees/>
List-Post: <mailto:linux-kernel-mentees@lists.linuxfoundation.org>
List-Help: <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees>, 
 <mailto:linux-kernel-mentees-request@lists.linuxfoundation.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Add a new message type TRAILING_SEMICOLON for the macro definitions
that conclude with a semicolon.

Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..f2ef998ba 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -845,6 +845,27 @@ Macros, Attributes and Symbols
     Use the `fallthrough;` pseudo keyword instead of
     `/* fallthrough */` like comments.
 
+  **TRAILING_SEMICOLON**
+    Macro definition should not conclude with a semicolon. The macro
+    invocation should be consistent with the function call. So the macro
+    invocation must conclude with a semicolon. Suppose if a macro MAC is
+    defined::
+
+      #define MAC do_something;
+
+    If this macro is used within a if else statement, like::
+
+      if (some_condition)
+              MAC;
+      else
+              do_something;
+
+    Then there would be a compilation error, because when the macro is
+    expanded there are two trailing semicolons, so the else branch gets
+    orphaned.
+
+    See: https://lore.kernel.org/lkml/1399671106.2912.21.camel@joe-AO725/
+
   **WEAK_DECLARATION**
     Using weak declarations like __attribute__((weak)) or __weak
     can have unintended link defects.  Avoid using them.
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
