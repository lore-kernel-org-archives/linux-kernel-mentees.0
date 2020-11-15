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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F7FC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 11:05:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6FD923A32
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 11:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p+7RtTX7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6FD923A32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id AD0CE86B4A;
	Sun, 15 Nov 2020 11:05:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id liD3S6JpkiNH; Sun, 15 Nov 2020 11:05:39 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C8C8386B3C;
	Sun, 15 Nov 2020 11:05:39 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AD9FEC0FAA;
	Sun, 15 Nov 2020 11:05:39 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E4571C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C8B1F20366
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQzLzUhV15YX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:05:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 8669B2034A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:05:35 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id f27so10327530pgl.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 03:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cyKM3QlUm9WC5oQVgFD6uekgAnNq9uGvejlZmcHhGwo=;
 b=p+7RtTX7zCzgw3pOLHzec4tBrOOV+1vKnQLTmH83C718t0g41y1DTFEZnQZb/fI6ra
 EL3zLQpv1pAL6g8nUgVPchGV4j1JQ3UQ+eEwgSuugrpSqLnEvXTV4jfuzTYWa6R0R6vg
 qseEl2LtTwZpz9s+u7qICVTqS3gE7AU4XNYi0ZD5pmHClvyJkWSKcndh19YsGAxPfN7U
 8ld1barHQI3ywFeGkPcbxhE6WfWTdaRrk2GFqO+gOkfgwfzvylI+e5w+wfMnAgxcfDFd
 6DiDZ76cxENF2EZTcGxkr8TyidyJNUPwNStfrWTPu8vP1nCmSOhksVH5F+8/TsmDdj52
 35BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cyKM3QlUm9WC5oQVgFD6uekgAnNq9uGvejlZmcHhGwo=;
 b=mYSatQWc32pK/YSk/WIuMKMKr7yiyydsCWoK0TTkEXszYPfXJ5JavylcpMM/SP98H/
 fFOmvcbeL5JmmDMY+S3kgJdP7zt8XeAVGJveGg6+Y7mG4apgDGgINNwWEXa0KrlsfjmR
 XLQEFlVMVlHzfiGuF8kTEhSrJVOClQNcEmyqKCGxaxaJYHXXlm5YKKhUUElBD1o2gQjH
 GCOYfQbCKBScTWiDjfAO/SEafNownfPShKpu6ct4QdxNK7qXgMEDDmwZ9iRbn0muypyb
 Is4+PjcDZz3ZbHfAtNL+X9xTZkHXpIKHuxS+znVHHmoXNuTUdc00Ft/a8t8sPHtw0+CK
 qqkA==
X-Gm-Message-State: AOAM533TIl5vvFUuMmereaeDmn/GKco0toj5HHf4EPqbwk0EgoRzH088
 eWq3oMJ5ZRBU4WyrFokojcA=
X-Google-Smtp-Source: ABdhPJz7NLidwXOb3+l4rZ776mVYVDLK2bgaqoKq+IJqcoywneABKb3bFQoPi6JwbbBf67V54wTIuQ==
X-Received: by 2002:a63:eb4a:: with SMTP id b10mr9302775pgk.416.1605438335033; 
 Sun, 15 Nov 2020 03:05:35 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:40f:cfd6:9c0d:ea75:a189:9a76])
 by smtp.googlemail.com with ESMTPSA id w15sm418058pgi.20.2020.11.15.03.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 03:05:34 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 15 Nov 2020 16:35:27 +0530
Message-Id: <20201115110527.12433-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
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

Checkpatch expects entry in maintainers file in a specific order and
warns if the changes made do not follow the specified order.

E.g., running checkpatch on commit 6f736909f0a4 ("MAINTAINERS: Add
patchwork link for PWM entry") reports this warning:

WARNING: Misordered MAINTAINERS entry - list 'Q:' before 'T:'
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git
+Q:	https://patchwork.ozlabs.org/project/linux-pwm/list/

Provide a simple fix by swapping the unordered lines

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
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
