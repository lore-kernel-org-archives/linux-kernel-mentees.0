Return-Path: <SRS0=+FSu=FV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F938C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 13:42:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90409238EF
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 17 Dec 2020 13:42:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 90409238EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1F51287581;
	Thu, 17 Dec 2020 13:42:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JTwCe4D36HfC; Thu, 17 Dec 2020 13:42:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 70A728757E;
	Thu, 17 Dec 2020 13:42:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 581B4C088E;
	Thu, 17 Dec 2020 13:42:34 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D87D2C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 13:42:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id B9D5722E20
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 13:42:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jgngJtdJrJjD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 13:42:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by silver.osuosl.org (Postfix) with ESMTPS id CC11A2046B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 13:42:31 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id f14so3669677pju.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 17 Dec 2020 05:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xX8a79Gjb31KcVl9BRU7zIuRKc3nJSmAQkj+J42gmDo=;
 b=IVVED24WxVyEFokYDkZM+re9QFS1ER56bPsSsaUeoZtF74kdLMOrGg6uveNSSEAR6X
 zpNbUs1Dr8UVbc8lR6YKVFW0ZI6i6MGOvWybKTsxcYAdbcX5oY9vber46zK5rk04JprC
 mMOlAf8COuTTh3vKw3EQWGQ2jFOwnLhBQGHL67Hzy60NO+/Ch/beibIZoXrogMgDgNn2
 qL2nx4VDkonJlGbkEwh0omUVj8m2E+vf+2JTXhobeBNmXDF1AgCEDfX23Q82B9xotmZL
 zBMxrLgJtlTHe9Wmx0gdgNbYy4OfnrozX3DVx+/JTa2Ge1SvPYIi0JvvV/DdUm0NEDMU
 SdTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xX8a79Gjb31KcVl9BRU7zIuRKc3nJSmAQkj+J42gmDo=;
 b=teVofTRZIZYy6VFIHrKLT+Zcyd2LSrEy/AQ6/TwW2I6jfmKt6mrJhc4v1xcLIpdLhr
 Pk73zmnQGgOyHcajIFwsWa40Kom3lBAxwzVdE6yRglanlqWOobIh7wcr/3s0YApezDpv
 g9gRYyzCyOEY/tlKD5SyXHmknAoYMPZUOrZgOghpjfvnLoV7Ah8v6YDzmEoG/mwH6IUi
 hewPVo+Vj/hgDgnMStMY2brtBhhTl0tAdc4WnKxJhP5lsR80s32r5vmJwGHYgyArumMJ
 4pPbR/eecMilD2D7NWFrWoIc4cB1rqRlNhrMqmimwkdPYcRQa4DcGM5o1IDL2mGqUXIo
 WyvQ==
X-Gm-Message-State: AOAM530l78fuafmsyOQ/WWjwXYZbQhSzY9zRQKTTC6joVg+cRdhag2Bu
 gmBXGYNwXIAhjaZYk3omzdw=
X-Google-Smtp-Source: ABdhPJyFttykqEqBExQYV65btoTZGx484eNHaiTltEX264Durh1Mnt15/pR+ALVf5CC+uPkAk5ekkQ==
X-Received: by 2002:a17:90a:db0b:: with SMTP id
 g11mr8028012pjv.168.1608212551215; 
 Thu, 17 Dec 2020 05:42:31 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:403:493:5d38:be:6298:62ae])
 by smtp.googlemail.com with ESMTPSA id j15sm6049719pfn.180.2020.12.17.05.42.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 05:42:30 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Thu, 17 Dec 2020 19:12:21 +0530
Message-Id: <20201217134221.16178-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive for
	COMMIT_LOG_LONG_LINE with URLs
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

Currently checkpatch warns for long line in commit messages even for
URL lines.

An evaluation over v4.13..v5.8 showed that out of ~11000 warnings for
this class, around 790 are due to the line containing link.

E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
Consolidate how dtexts and dvalues are freed") reports this warning:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html

Avoid giving users warning for character limit, instead suggest them to
prefix the URLs with "Link:"

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index abd5a3d2e913..23da1f50fe6a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3032,8 +3032,14 @@ sub process {
 		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
 					# A Fixes: or Link: line or signature tag line
 		      $commit_log_possible_stack_dump)) {
-			WARN("COMMIT_LOG_LONG_LINE",
-			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+			if ($line =~ /(?:http|https|ftp):\/\//) {
+				WARN("COMMIT_LOG_LONG_LINE",
+				     "Consider prefixing the URL with 'Link:'\n" . $herecurr);
+			}
+			else {
+				WARN("COMMIT_LOG_LONG_LINE",
+				     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+			}
 			$commit_log_long_line = 1;
 		}
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
