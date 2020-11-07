Return-Path: <SRS0=FEGG=EN=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E1BC388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 12:17:54 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3198206F4
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  7 Nov 2020 12:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYGsXz9J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3198206F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54F1E860FF;
	Sat,  7 Nov 2020 12:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4n3TW20olnFS; Sat,  7 Nov 2020 12:17:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5954B860F6;
	Sat,  7 Nov 2020 12:17:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 40A7CC088B;
	Sat,  7 Nov 2020 12:17:52 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 949CEC0889
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 12:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 58F3B2035E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 12:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OGwvCniU8BXs
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 12:17:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by silver.osuosl.org (Postfix) with ESMTPS id AF17320133
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  7 Nov 2020 12:17:49 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id b23so775100pju.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 07 Nov 2020 04:17:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=gr+Opq0aqfOXYJNqVNAeQl0q8hmnHyI/VZxrmYKhHjc=;
 b=eYGsXz9Js4bqBmELy//IuL8naU6bIP4a/R3GvCI9v9ln8NDc4Ztzx4UKWiwYQyNc7f
 52wAmvjJuip8E+uKiGUw/HFW8bg44VQoEMnTEgRBbwlNKgTjGL36Kg4GWQxGyU3jY1ci
 YKu6J6mSu3ZRC8uwiQ5dw8Tl55h1KvRZLvEWABXGcUd15i4tZIZXLMa3t0BWkkp8H5dg
 czQ/j0ktLWEezzTAMegsDkexp3ubvaANBVPKqrVmthwuPgsYt8KYkIzgMZIbjgBY3mJ5
 Ue7QfIrCY0D+wSQYmTXuMqTC7URxorUXHtx4fARI6qxjzVoWucBAc7w3OcdGhwEAhR0t
 cQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=gr+Opq0aqfOXYJNqVNAeQl0q8hmnHyI/VZxrmYKhHjc=;
 b=OKSfTXmFEm+REctfMeUJtND9fJj4NCr1PB2H03rh7ZIeOAtQlFdaVYWm2fnRsMjHFC
 6V5UnoFLzP4SBDK1+jFT/r91JpCC/8/2OxSEv7szC1CmgR55qxn9A8Ao5nPZMhloyf74
 Cd3l31PRskUHGNVAaWlPVAVDAlJIrvCRMOUXhVxDnE/X84uFuGpS+bhCP1zTh488Ufjv
 XH5137JPT89t6k+LDhx3rCHUOoOf6HQbFMzecHlo11yMJGUS4oHWiPZojnAL8P0COkc7
 gYEVZSaaADnDBR1sulcyXJ3jIj2Vi8X/0pe7mqY89UYorOe1s0suUnm24qojMJkE9jxr
 YxTQ==
X-Gm-Message-State: AOAM532wmO0P1uVDQlO6xOz4HuJvlZkE1u+YiayHiYOhJtSxfwQBni3E
 FcVpeVOr7qJv3olgtHERHpg=
X-Google-Smtp-Source: ABdhPJxKFbWOrpNQObRIUbbBcbH81vgQZ5FEMa7b/dWMOYIKBjaDnCLJ/fZVp+qGvLhxsQzmEgWgQQ==
X-Received: by 2002:a17:902:9a84:b029:d6:eaef:4806 with SMTP id
 w4-20020a1709029a84b02900d6eaef4806mr5470936plp.82.1604751469135; 
 Sat, 07 Nov 2020 04:17:49 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:42d:7bb5:3470:9721:ad9d:115e])
 by smtp.googlemail.com with ESMTPSA id e18sm2284338pjt.8.2020.11.07.04.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2020 04:17:48 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sat,  7 Nov 2020 17:47:42 +0530
Message-Id: <20201107121742.27144-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option for
	COMMIT_LOG_LONG_LINE
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

Currently, when a line exceeds 75 characters in a commit message,
checkpatch.pl gives a warning corresponding to the same.

E.g., running checkpatch on commit a1af2afbd244 ("drm/nouveau/volt:Fix
for some cards having 0 maximum voltage") we get this warning:

WARNING: Possible unwrapped commit description (prefer a maximum 75
chars per line)

Some, mostly Fermi, vbioses appear to have zero max voltage. That causes Nouveau to not parse voltage entries, thus users not being able to set higher clocks.

Provide a fix by consuming first 70 chars of the corresponding line,
then stop at the next whitespace, and substitute it with the consumed
chars and a newline char.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5a1096a4e220..ee665208ef02 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2881,8 +2881,11 @@ sub process {
 		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
 					# A Fixes: or Link: line
 		      $commit_log_possible_stack_dump)) {
-			WARN("COMMIT_LOG_LONG_LINE",
-			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+			if (WARN("COMMIT_LOG_LONG_LINE",
+				 "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr) &&
+			    $fix) {
+				$fixed[$fixlinenr] =~ s/(.{70}[^\s]*)\s+/$1\n/g;
+			}
 			$commit_log_long_line = 1;
 		}
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
