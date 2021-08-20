Return-Path: <SRS0=59bo=NL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD0AC4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 19:54:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920666113B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 20 Aug 2021 19:54:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 920666113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B2A8606CF;
	Fri, 20 Aug 2021 19:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UGXYzMvv3NXl; Fri, 20 Aug 2021 19:54:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5DC7B605CF;
	Fri, 20 Aug 2021 19:54:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37B78C001A;
	Fri, 20 Aug 2021 19:54:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id AFB6BC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F1B940716
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:53:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7K8l7bbnEbHC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:53:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A9E7940714
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 19:53:58 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id l11so6567562plk.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 20 Aug 2021 12:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ukBIaMty4WZd3I9qfNc7jLY56HgltptCfYuA3krBHyw=;
 b=TJse9XX8dUebVRc8kZK8ZsNWlvTKd5fO/Bqe4lEdMqhs5fWMsZJkQa9heeHufNSYjQ
 k8BNkqqSQDrrAJg/3YRILd5Y/mjEaa8mTpnztoR3EY2sVCRCYyz0nqLQCCdshDKApwPQ
 MOsNtCEa9t6xqAtip7Vphr2mtPGwKWjpeer/ZE9nPCCAqrO3+zozZigYygzH5BmjaL10
 ig3r/YmCEUolNwHgPcl3efEcjVnCFUqIiBSwAd1W9fsKXliRteXuBXuYLZK7ZrVn3xQJ
 t4nkHG4bAJoUiZfVgKiGxilNaSrcVieoaHcLx3WCz2zNiOQp8AgqsdwY//87PwhCLGiS
 R9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ukBIaMty4WZd3I9qfNc7jLY56HgltptCfYuA3krBHyw=;
 b=oNSL4Auq1i016HYTieW3GQ8qNPQPlhsjAGOPmZafRn5tfcNLkITwyYi9N0opdyfPxL
 I9qyasxSA++mJKUzi4Dy9C+na9rne2XoJ4u2XuyX9ygYafAHPfZDwg/EefXDUpaDKI2u
 iumNe6OASpvcaAZ73aU0ptCIJXrg+LWt5R0whGmXpvUB0YM5A8fm09GxNLwaScwCE6SP
 cK3e/1nZuwFRZNguuEQbKglFJGsyLUoKJFxY1VEyxyOd4rXLezIEQ38aoOD2vvjCUxF2
 tJZC1sCl0OyhJUAKUHnp9zX14HRBQEixKfu37m1mJOcaB+tmY49bsBMNzS5u6obRogqk
 XugA==
X-Gm-Message-State: AOAM533C8izEv3ATjkH1TIqXIAmTpGoJi3bTqlrEoQxb4jpLabekqk+u
 euOQr74vqTfmAxYzHMzJsRU=
X-Google-Smtp-Source: ABdhPJy6ToJxRJrxzr2hhRoyuNO6+x17cXSSlh5a7ZyKMmJX0sZ/wt+UP/O9NobuZJESVhHN5KNYkw==
X-Received: by 2002:a17:902:848c:b029:12c:daf3:94f1 with SMTP id
 c12-20020a170902848cb029012cdaf394f1mr17734639plo.50.1629489237899; 
 Fri, 20 Aug 2021 12:53:57 -0700 (PDT)
Received: from localhost.localdomain ([49.36.209.159])
 by smtp.googlemail.com with ESMTPSA id gz23sm6974901pjb.0.2021.08.20.12.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Aug 2021 12:53:57 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>
Subject: [PATCH v3] Documentation: checkpatch: Add TRAILING_SEMICOLON message
Date: Sat, 21 Aug 2021 01:23:36 +0530
Message-Id: <20210820195336.18611-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CABJPP5CxsHYO8Omdceh0yD6RtRMnt5hW7DWc=aKxpXPXQJVLEQ@mail.gmail.com>
References: <CABJPP5CxsHYO8Omdceh0yD6RtRMnt5hW7DWc=aKxpXPXQJVLEQ@mail.gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org
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
index f0956e9ea2d8..30eda8f4a8bd 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -845,6 +845,27 @@ Macros, Attributes and Symbols
     Use the `fallthrough;` pseudo keyword instead of
     `/* fallthrough */` like comments.
 
+  **TRAILING_SEMICOLON**
+    Macro definition should not end with a semicolon. The macro
+    invocation style should be consistent with function calls.
+    This can prevent any unexpected code paths::
+
+      #define MAC do_something;
+
+    If this macro is used within a if else statement, like::
+
+      if (some_condition)
+              MAC;
+
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
