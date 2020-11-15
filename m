Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2EF0C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 17:19:05 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E70E2223C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 17:19:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R6X89R5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E70E2223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 2227E20377;
	Sun, 15 Nov 2020 17:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fQi3nQ5fKG0J; Sun, 15 Nov 2020 17:19:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id B62EB20369;
	Sun, 15 Nov 2020 17:19:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEEBDC0800;
	Sun, 15 Nov 2020 17:19:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7061C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:19:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id BBD188722C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:19:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dIe6EqbspwkK
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:19:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3D32187228
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 17:19:02 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id g11so6920760pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 09:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ile4Ueq+/H9c/6jUa0JhYl+yDKP365ziXuBYqJNeYSA=;
 b=R6X89R5SwhMnDJ+AgftpRV3qN7nqQciiPKoGNcnVGo8cKp6Sl+G7AN5AY+Aq8tY/C0
 vsfMJ1cxe9qVVBTIyUVfdijlweN7g1QBvnpzTIgC4qWAVwR2nk1BdReIE6mFPu+Sclrj
 2fUdhfq9hMgkkTrCecQA1i9xAnLtxGPC3nE5ClxJvGX87iMSLwnRbCB9Nq327xYR/tPD
 aS7zXVK6y7GN4MDfOa9Cd+V7UZ5vduMBWaM2/VqBfP7mWh2k1AEhBo7IytDyiTv9Lxyl
 9yvn9OZDRc2syDDuXxSLHf4PStjVfddk7Xiwq/p7haBiepgzVKgLdQZnNB37SOTJOYst
 OilA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ile4Ueq+/H9c/6jUa0JhYl+yDKP365ziXuBYqJNeYSA=;
 b=HaGlscDrGSTCbsNxlz3Ar8zkkpYl2xpEtZ8tr+Yd/OBedlgvLAo3QJoE0LdImdTFLF
 3yDRaxekdilgQfOYDGKegVjUN7REC+C58zqzYeDkwryJJBAQ3rdxrbg4Kf2w0XvCShA1
 ecUFgbuCSngmZsCghKslrkf3QgJSCy2Q6OrU4wEKDOJ+KYZOrfjJyonyZNSTG2OdrQfs
 PAc0sN2XDGQF9HEL+u1fIsYa/yNJ2O+y4ytxHGLJpzU4w2rWsDhnE1R8M/IFQpCO53t6
 S6n4mYoPKYByD85vR/clJBPnQVUAXNgccZmpXYq7uaXE/T0G9yxx1cpSnZ/sznTjXk7Q
 UOsg==
X-Gm-Message-State: AOAM531dwTZlZSl8fnB52G4FfTYBmywpywU3llpjmMJCKGZUYFN/jNQl
 TKdHC5zrLOb/8ij+mCx00gg=
X-Google-Smtp-Source: ABdhPJySRBHgr3i0TpxvhiNiOXD+Y7MJGCpj649LCmQDv7zjXX65yCqvClZFHBqlGOSgK+6NJrJnbg==
X-Received: by 2002:a17:902:9049:b029:d5:eadd:3d13 with SMTP id
 w9-20020a1709029049b02900d5eadd3d13mr10023999plz.15.1605460741702; 
 Sun, 15 Nov 2020 09:19:01 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:403:5563:5d03:b10d:63ae:9ab3])
 by smtp.googlemail.com with ESMTPSA id
 128sm15918046pfd.110.2020.11.15.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 09:19:01 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 15 Nov 2020 22:48:53 +0530
Message-Id: <20201115171853.8153-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option for
	MAINTAINERS_STYLE
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

Checkpatch expects entries in MAINTAINERS file in a specific order and
warns if the changes made do not follow the specified order.

E.g., running checkpatch on commit 6f736909f0a4 ("MAINTAINERS: Add
patchwork link for PWM entry") reports this warning:

WARNING: Misordered MAINTAINERS entry - list 'Q:' before 'T:'
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git
+Q:	https://patchwork.ozlabs.org/project/linux-pwm/list/

Provide a simple fix by swapping the unordered lines

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
modified commit message

 scripts/checkpatch.pl | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2749f32dffe9..c9aaaa443265 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3299,13 +3299,22 @@ sub process {
 					     "Unknown MAINTAINERS entry type: '$cur'\n" . $herecurr);
 				} else {
 					if ($previndex >= 0 && $curindex < $previndex) {
-						WARN("MAINTAINERS_STYLE",
-						     "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev);
+						if (WARN("MAINTAINERS_STYLE",
+							 "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev) &&
+						    $fix) {
+							# swap these lines
+							$fixed[$fixlinenr - 1] = $rawline;
+							$fixed[$fixlinenr] = $prevrawline;
+						}
 					} elsif ((($prev eq 'F' && $cur eq 'F') ||
 						  ($prev eq 'X' && $cur eq 'X')) &&
 						 ($prevval cmp $curval) > 0) {
-						WARN("MAINTAINERS_STYLE",
-						     "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev);
+						if (WARN("MAINTAINERS_STYLE",
+							 "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev) &&
+						    $fix) {
+							$fixed[$fixlinenr - 1] = $rawline;
+							$fixed[$fixlinenr] = $prevrawline;
+						}
 					}
 				}
 			}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
