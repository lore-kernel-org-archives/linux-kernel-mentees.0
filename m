Return-Path: <SRS0=mimn=EQ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30622C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 13:42:28 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BFAE20797
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 10 Nov 2020 13:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCfsD1v6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BFAE20797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id AC80C86A22;
	Tue, 10 Nov 2020 13:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CGQ7b02LozGJ; Tue, 10 Nov 2020 13:42:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 51F5286895;
	Tue, 10 Nov 2020 13:42:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37C92C088B;
	Tue, 10 Nov 2020 13:42:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 31E12C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2CE1586A22
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5LG-QL9hhZL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:42:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 392DA86895
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 13:42:24 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id w6so5955195pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 10 Nov 2020 05:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=av8lo23smtd/n9mACNYWyyTC//lCv7kTFTq2uopUF7M=;
 b=RCfsD1v64iX+FPW4ewVMBuLnm5hU/JlGqcyGVFOOs3PNk/LIrxiZhtNy3ZZ/kfRukl
 +8V2lJSISnF9C2q21Dc57cwcDrjie1k9TW/+L6ymiHSeQHf8J/OR5LZ6GLi8odvqxkkR
 VfkrDlEDjbDEGM83vF3TsG1z1W0cR4qrAfSOnexA9obieZYR6Sajo0ODsQrgiF9BrBZ0
 DeEZ8kRgt/VJ8S2gwQrhYNxNbZWD+8iOOBmDtmn4j0TmGRB2ST21IYaRrvMCM7cchUuy
 WX0Jqwf62W2BS4ea6kAeoGnSFgWTKjuzXVj2LiMn3+HjbDJefbkAt5nUr6SKY86jNstR
 Mfhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=av8lo23smtd/n9mACNYWyyTC//lCv7kTFTq2uopUF7M=;
 b=eV3qIRq+1f0qzxTZSj14h+dg9xwae6vcXqR8obWndPThfC6DcMmIO3m02FL4QSDU4H
 6mhm55eh5xCmGc3pvmQslVIFZ0tZBt8z6dBTcjR12xHwyzrnK+gU7qdfRAtAqVfV8tQ4
 NIhLkIJ3VZ3LyBcefdBoqeCKdCCm7yslT9XQdXMZPGoeDdhjT8dxBXM6bl3ZSChXptgc
 XjeAm837E33dHTekrLpOZh65rgX8Pm0mP4C6GYjgTwQqyRDQAnxBtOQ4NWGnYNfsee1t
 zUgWkQGcHjG9Hm0U6s5Au6wFMYraCyg0+O+FfkDf13JdXKdZWKYO/K8osakze2KvI3he
 8RBg==
X-Gm-Message-State: AOAM532/w0kwY1pe4gCphuE1dcwm5MJKBpXmZrmfRf1vs/3ohqHarqz8
 NiCnwGPNOrKFMrPX46SobRY=
X-Google-Smtp-Source: ABdhPJyJ73cKOxBT61Y912kxpcvXak6bnxeULzbr8h7dCNStgmmOzqtRadQqjYKtbW8dv0aVvw8Kpw==
X-Received: by 2002:aa7:8430:0:b029:18b:b3f5:ea4b with SMTP id
 q16-20020aa784300000b029018bb3f5ea4bmr17674896pfn.61.1605015743644; 
 Tue, 10 Nov 2020 05:42:23 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:413:8adf:79d0:1679:313c:70a2])
 by smtp.googlemail.com with ESMTPSA id
 l14sm10814856pfd.113.2020.11.10.05.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 05:42:23 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 10 Nov 2020 19:12:14 +0530
Message-Id: <20201110134214.24082-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: Documentation: include
	sign off for reverts
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

Currently, we do not have any documentation on commit reverts regarding
the requirement of Signed-off-by tag for it. This may be misleading to
the users.

On evaluating MISSING_SIGN_OFF over v4.13..v5.8, it was found that
4 out of 11 cases for this error is because of missing sign offs in
revert commits.

Add documentation regarding the same.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 Documentation/process/submitting-patches.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 83d9a82055a7..ff065e1f6a25 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -404,6 +404,8 @@ then you just add a line saying::
 
 using your real name (sorry, no pseudonyms or anonymous contributions.)
 This will be done for you automatically if you use ``git commit -s``.
+Also reverts should include a Signed-off-by. ``git revert -s`` does
+that for you.
 
 Some people also put extra tags at the end.  They'll just be ignored for
 now, but you can do this to mark internal company procedures or just
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
