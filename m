Return-Path: <SRS0=JFU2=FN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E37C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 10:58:51 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6844D22573
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  9 Dec 2020 10:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6844D22573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C6F4F87209;
	Wed,  9 Dec 2020 10:58:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eUOjJUda7DUp; Wed,  9 Dec 2020 10:58:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 314B1871E2;
	Wed,  9 Dec 2020 10:58:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 294E5C0FA7;
	Wed,  9 Dec 2020 10:58:50 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 16164C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 10:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 03BD586B47
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 10:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b+nkNMJ3w0Pq
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 10:58:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6249F86A87
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  9 Dec 2020 10:58:47 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id c12so768814pfo.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 09 Dec 2020 02:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=BXaW0jO2/S1wuVEFpx3vV2s9QGgLtBxA4cmhQiHtnhE=;
 b=Lm4NEGXQOq38dN5PB/M7Rh7sBlVh0XSgh/b0vDrjdaRY/jeubH7BuOnaL8gRVllkBE
 2bsFv+477RG3U5AX3p4TS4+Aj2kyGM4gvlb6y6mBjHiufWmryxRSpfBkUGKcAGG14EcD
 cGz0a0l8TxNDCg3Wu7hHy7vCkZwQ2Qx1/oCQVqftQ5tDvqllro+FsIZYBVmuSJbjZMHV
 oJDzaed8ibmYX5mz5GmMfwqtWCx6bwW6y3UbcNtFZoDRK1R6o/AdcJoXhNAu9mALqQr7
 whTslOptEBIAe0fKk/Suzqs+yD3j8evbazA5IQNGnAud8q8sq9cdnG6mkN5cwYqC5W4+
 zaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=BXaW0jO2/S1wuVEFpx3vV2s9QGgLtBxA4cmhQiHtnhE=;
 b=Yl8fqPDBQU8LAMsOBbGjQzItl491nN8vbjRmPT7GYfzf+dCkRzj6kFD5hkLpL6BD3q
 n+ZqMNhPWU83DKUhM+3NE91XhVt95culw/7SHKBbjH7x/aznFPNgNmDqAVOLn8vRetHT
 B1J7RWM2M3HEJybhckNiL95ovgc+NKeSE5oLxcGlxiFKLy01qKShVB2rcq9Dqdr4B0Zd
 OLZ7JNsnlvYSorx4BCrz/Uziou3Ef9Sbm9Gvyfi6+I/DLKGseoj0SBvYNbDrDtblHIg+
 MmP7xalwVX9qxGTYVeL9iaqWZKhkkVkdeAWx0G/cTX4+2poJMGuyr46NsYvEqjtbUAea
 R58Q==
X-Gm-Message-State: AOAM5327j56FsXnmXAEshTj+O33+QXXr0E/+31uZPMPApr35vWGOmUgk
 tFXV5rMNunXRPXfjwgtGOVU=
X-Google-Smtp-Source: ABdhPJzNU4t1jCw6liKYrMd4TI4tE78q310Wm7CvE96ZKtXXKnK3YRKBZpXApD8u2wLB+laUVliLQQ==
X-Received: by 2002:a62:7ed2:0:b029:19d:9461:2b30 with SMTP id
 z201-20020a627ed20000b029019d94612b30mr1795014pfc.14.1607511526861; 
 Wed, 09 Dec 2020 02:58:46 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:408:3658:6502:c162:a66c:507f])
 by smtp.googlemail.com with ESMTPSA id kb12sm1654060pjb.2.2020.12.09.02.58.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 02:58:46 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed,  9 Dec 2020 16:28:33 +0530
Message-Id: <20201209105833.9066-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option and
	improve msg for BOOL_COMPARISON
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

Currently, checkpatch warns if the user compares expression with boolean.

E.g., running checkpatch on commit 3b3a1a0b7824 ("staging: rtl8723bs:
hal: Modify comparison to constant in rtl8723bs_xmit.c") reports:

CHECK: Using comparison to true is error prone
+	if (ret == true)

Provide a fix by replacing the expression with preferred expression. i.e.,

1) If the check is for a 'true' or 'not false' expression, the operand
will get replaced with empty string.

2) Else, the operand gets replaced with '!', and the arguments follow.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
This fix is actually inspired from the comment mentioned in the script by Joe. I have added the Suggested-by line correspondingly.

 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 8bd8e4518f7f..abd5a3d2e913 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6973,8 +6973,11 @@ sub process {
 					$op = "";
 				}
 
-				CHK("BOOL_COMPARISON",
-				    "Using comparison to $otype is error prone\n" . $herecurr);
+				if (CHK("BOOL_COMPARISON",
+					"Using comparison to '$otype' is error prone. Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr) &&
+				    $fix) {
+					$fixed[$fixlinenr] =~ s/\b(?:true|false|$Lval)\s*(?:==|\!=)\s*(?:true|false|$Lval)\b/$op$arg/;
+				}
 
 ## maybe suggesting a correct construct would better
 ##				    "Using comparison to $otype is error prone.  Perhaps use '${lead}${op}${arg}${trail}'\n" . $herecurr);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
