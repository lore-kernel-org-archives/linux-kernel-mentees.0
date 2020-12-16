Return-Path: <SRS0=xLm4=FU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E199C4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:32:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 063A52311B
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 16 Dec 2020 12:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 063A52311B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7372887269;
	Wed, 16 Dec 2020 12:32:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0Bg-r1kR-bfx; Wed, 16 Dec 2020 12:32:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id C5C55871B6;
	Wed, 16 Dec 2020 12:32:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BD173C088E;
	Wed, 16 Dec 2020 12:32:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B99B6C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:32:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id A432A85F93
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:32:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c2QfKJHbHAH5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:32:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id C474185F58
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 12:32:23 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id lb18so1402816pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 16 Dec 2020 04:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=xX8a79Gjb31KcVl9BRU7zIuRKc3nJSmAQkj+J42gmDo=;
 b=Zt3q5LFolURRMBcKiNq1h0FRODGrzHMm+DS52TDH97EaV2HmkgKU/aMyJ/Cw3vODts
 cUoCz6H58/6lslFBqC9JdpJ1+gWa8AObrCR+mqe9rBso2vjAvxzaGYypt4zt2Oo8/3xP
 nesXKvBQUzYBA+y+t7oBs7hSHEpFd39ty8Kd89IR7DTt40qFuWCRmE7wqjOLJd8tVXDH
 NiEoS5n+UIxOYUsuN7j3qD8bK0Ep9TjvJHMysHi/jGOcNVv6wsnxcdgHAF+JDq2Oyykb
 j+miHSCwxeXOollnqs5b37VYRrcTgy5B2GCTJSf2Dc/Y+LQXK4LpILkoFv4cJ4fl0H4p
 gCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xX8a79Gjb31KcVl9BRU7zIuRKc3nJSmAQkj+J42gmDo=;
 b=jqLDOWxrrdvf2jREfqNg8La6BBnsrFbSB+xc8BN7YqLyqw+KAyfldzRFDLc7x4QdH+
 04NSeEThPAxyCOZj6AOooPfjVeFN2n37X0Ercz5oVWXE2Xbw1W3WIn0anDnc52+mW8ay
 a6g+TFJJ7bYvb2ruh+0GuTpxCNPpH9A0LteO/7tiQkIPPuyEI8HibfiA9XMy3UQVamwd
 rNJON1YlDdazNS7IjHrNUMXEqXiUAX1I2JBBqUUTeXn8oWYk8nD/9AmWjIfjoj+guaws
 6k6W+UOIJzEKvLSdB1c3BUWp6ZFnnO1D/Ir09pdbZ/64vH1xTcBNhPBIcZmGcmhT/LO6
 OL9w==
X-Gm-Message-State: AOAM5322QM3jGIT3HjK1f6whktUFrP21LJeTAlV14MoZtyDzhLHgTuZT
 ULAV5uwZ3Eb1Fu7UWwdw284=
X-Google-Smtp-Source: ABdhPJzwLDUc0iJu/0nzN5qmXhxZu9adqUF2mXFAYwJX1NZ1n5cnSzh3LRf5LzWAS5+tOAU1a2xA6g==
X-Received: by 2002:a17:90a:d502:: with SMTP id
 t2mr2829370pju.131.1608121943275; 
 Wed, 16 Dec 2020 04:32:23 -0800 (PST)
Received: from localhost.localdomain ([42.111.145.76])
 by smtp.googlemail.com with ESMTPSA id h32sm2654010pgl.36.2020.12.16.04.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 04:32:22 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 16 Dec 2020 18:01:21 +0530
Message-Id: <20201216123121.16466-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
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
