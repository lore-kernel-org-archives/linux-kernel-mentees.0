Return-Path: <SRS0=ZZOl=GR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECA1C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 07:35:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D538238EC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 07:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D538238EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 20FC687388;
	Thu, 14 Jan 2021 07:35:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CJMWOiCnZ5VG; Thu, 14 Jan 2021 07:35:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id B241387337;
	Thu, 14 Jan 2021 07:35:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A172DC088B;
	Thu, 14 Jan 2021 07:35:33 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF86CC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id C6DC08737E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgFATgCQo8Hw
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 655E487337
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:32 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id m6so2859985pfk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 23:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=owDSUfxjCGNV7feym8SWdxYVebJhgpkhx2YM4l3iFLA=;
 b=qHVtSpQGZutLPHTqE7h7h3Uc/79S/uPr3YwZQ0YQpMyIx/GLpPYu8JoLg6/IEMvIlP
 mExDcVq2K3/JyXfYoGQR6XhhC3uT8Ym903BsZydRsbfdqio1ChI/xE1BAUB1wenye/fr
 4W7x9VhrxfpsvebuHFbHHy798FSilY+WIn5roDrm3TKM6uwOJefznt6JXYBT6e0yt6ga
 OXNF2OLlTigs7SlEKCzTkNpq3lbZCN3kwVlO/E541kKsJshD9gV7kc1jVEuaV2oZYWdZ
 tXXLFnjpQE8o7HRoNjk0xbEv68bYZhR7SKeRiGcM7lIo7fwE2YnG30eiJVzcGk8lKzC4
 qeDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=owDSUfxjCGNV7feym8SWdxYVebJhgpkhx2YM4l3iFLA=;
 b=G1aioXwpf+0pbbjvF1xzFaKqiHoSQfODTgkj5zyxG7AUvaU1x1+dWz7Cbd2jims/bk
 nk/rSWgoWKXmJn+NXhtT9VKAB4goPGv0b6ZlKuWVQU/g8bhe+79WRuqN84pJmAOigi1H
 9O+3NRFTu9INmZ3rgnOpB26NDFljVQhTmsTN74gK9zDG0LrluKDbTKC5H6WWIQ6HyOfV
 h1x2UcN7STixC1JmYJnoy6Ax+fm5Cy/MAoAN23aK4MkNk1AYhlefY4kHpbo5IDw65CUY
 QKjwZQQHBR+iQU/7dkGlaxZacnZ6okXXwAzEafdJ4RtruNPPAKeCQtx+GJsVGVB3mZUW
 o4+g==
X-Gm-Message-State: AOAM531KaDglNBf187mdni/hS1zrx22ZlU6dS6eY2gpzy8JONP/4BD2h
 XQb4bzyR2y3h0ceDTgzAe74=
X-Google-Smtp-Source: ABdhPJztSKcPGxNuYd6U4KMEQbw94p6VkgElcmgov+fS5kEHTspA5yLgor11wltFXOwjtLL8TyTa7A==
X-Received: by 2002:a63:1142:: with SMTP id 2mr6230072pgr.263.1610609731903;
 Wed, 13 Jan 2021 23:35:31 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:b1fd:acc0:2bb9:df96])
 by smtp.googlemail.com with ESMTPSA id x20sm4442145pfc.3.2021.01.13.23.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:35:31 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Thu, 14 Jan 2021 13:05:13 +0530
Message-Id: <20210114073513.15773-3-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114073513.15773-1-yashsri421@gmail.com>
References: <84492ae9-7452-d296-49ab-4d37eed3b968@gmail.com>
 <20210114073513.15773-1-yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3 2/2] checkpatch: add fix option
	for COMMIT_LOG_LONG_LINE with URLs
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

An evaluation over v5.6..v5.8 found that out of 1703 warnings reported
by this class, 161 are due to the line containg URLs. Out of these 161,
53 are due to lines where URL is the first non-whitespace character of
the line.

E.g. running checkpatch on commit 3cde818cd02b ("ASoC: topology:
Consolidate how dtexts and dvalues are freed") reports this warning:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html

Provide a simple fix option by prefixing the first non-whitespace
character of the line with "Link:"

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e8851ce73149..7030c4d6d126 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3023,9 +3023,12 @@ sub process {
 		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
 					# A Fixes: or Link: line or signature tag line
 		      $commit_log_possible_stack_dump)) {
-			if ($line =~ /^\s*[a-z][\w\.\+\-]*:\/\/\S+/i) {
-				WARN("COMMIT_LOG_LONG_LINE",
-				     "Consider prefixing the URL with 'Link:'\n" . $herecurr);
+			if ($line =~ /^\s*([a-z][\w\.\+\-]*:\/\/\S+)/i) {
+				if (WARN("COMMIT_LOG_LONG_LINE",
+					 "Consider prefixing the URL with 'Link:'\n" . $herecurr) &&
+				    $fix) {
+					$fixed[$fixlinenr] = "Link: $1";
+				}
 			} else {
 				WARN("COMMIT_LOG_LONG_LINE",
 				     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
