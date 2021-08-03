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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E3FC4320A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 141C360FA0
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Aug 2021 14:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 141C360FA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8DBA82BA1;
	Tue,  3 Aug 2021 14:20:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xoUP25awJZ9p; Tue,  3 Aug 2021 14:20:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 17DB082B84;
	Tue,  3 Aug 2021 14:20:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03AD1C0010;
	Tue,  3 Aug 2021 14:20:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D6124C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C63B882B94
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uxcBakrgE8U3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 438EE82B84
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Aug 2021 14:20:24 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 dw2-20020a17090b0942b0290177cb475142so4071326pjb.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Aug 2021 07:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=uUz1GJ4UMZtESqOH3Iv0HC2onnOwVwctq0r47BVKDPQ=;
 b=SDGn417J2pG+ccdcocBsajmR7geyPNjKtmoAMJQxKCRWSx4AOrjMhU7NunDVVEYp9/
 5xKdBjka2Ga9rD/xXQHrE/3K7ToIbIaX3ajv0J4Trluneg3yk6vntvOaLwEbVs2Kh62r
 iIDui6uXEbx/ktw8+uwil6+KsEoO/Pn3aywbFiExu+tnqIrTo95GncgOgiCUNyDFANpB
 +16ai98DjcXEHnsT/fwfVDon1h0PXsCoJfU5E4ZNxWUiNM4v6uUozYNLl6w+kgyGL6Vi
 5q5iN4goKZ+wkg7PWURlCTxJsWZdt6EHkydM46vrp+UXB78gASxwTWdM63Drrd3dC+K7
 /81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=uUz1GJ4UMZtESqOH3Iv0HC2onnOwVwctq0r47BVKDPQ=;
 b=K8e583OFf7KVMYcE+G9z+m+U8CzbDtXhi8Y3gPy2KczkqVJeqUSY3NJBeTPCzb7u7U
 LokP8MuhSPpdKqPY/Z7qnJuVEAgKYt/TBiPHwNt94HhDmubb9VoPYxCVusC3lmNXbsL8
 nUsU8JGJBENQ1N208bh2APufUUQu7/WTbetlNhlqkdBFxZhlE3xrpp2Icj8EAinV/2C4
 jeZ49rAELrIiqSkA1aVuXVIDAO+yrtgkQEyjk1pjiPPnWBS7+N8ruxe8H2rVvkrIfr0q
 vsU9wyewTMU2Vfw1wnOxmA86XFJEUx77QSQ4KSUOGiFCaiG7HhFI8lwvNzMPxBzLuI5E
 Er1w==
X-Gm-Message-State: AOAM533MW7qHH9P0qdNPgOEJ2yh2rofgZt2MCX/Mt2CssJNCQVHNgaj7
 olZdUuT9dondWwMou4BZgv4=
X-Google-Smtp-Source: ABdhPJyvGWoW29oJjZk7NLyPevuzrLC9xPcaQWGYkHP2kBI/TAawD5jjnUoxaTRfWW2xG8SY1qeLOw==
X-Received: by 2002:a65:42c3:: with SMTP id l3mr215227pgp.377.1628000423619;
 Tue, 03 Aug 2021 07:20:23 -0700 (PDT)
Received: from localhost.localdomain ([47.9.137.220])
 by smtp.googlemail.com with ESMTPSA id i18sm17786246pgb.83.2021.08.03.07.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 07:20:23 -0700 (PDT)
From: Utkarsh Verma <utkarshverma294@gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: [PATCH] Documentation: checkpatch: Add TRAILING_SEMICOLON message
Date: Tue,  3 Aug 2021 19:50:10 +0530
Message-Id: <20210803142010.17015-1-utkarshverma294@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
References: <CAKXUXMymBWUcy53a38hA9b3VYL0af2vpDW0=xsCEWuiiUQQn-w@mail.gmail.com>
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

Signed-off-by: Utkarsh Verma <utkarshverma294@gmail.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 Documentation/dev-tools/checkpatch.rst | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index f0956e9ea..504edd961 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -845,6 +845,26 @@ Macros, Attributes and Symbols
     Use the `fallthrough;` pseudo keyword instead of
     `/* fallthrough */` like comments.
 
+  **TRAILING_SEMICOLON**
+    Macro definition should not conclude with a semicolon. The macro
+    invocation should be consistent with the function call. A function
+    call concludes with a semicolon, so the macro invocation must also
+    conclude with a semicolon. Suppose if a macro MAC is defined::
+
+      #define MAC       \
+        do_something;
+
+    If this macro is used within a if else statement, like::
+
+      if(some_condition)
+              MAC;
+      else
+              do_something;
+
+    Then there would be a compilation error, because when the macro is
+    expanded there are two trailing semicolons, so the else branch gets
+    orphaned.
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
