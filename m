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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71249C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 07:35:32 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6A06238EC
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 14 Jan 2021 07:35:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6A06238EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5ACD886901;
	Thu, 14 Jan 2021 07:35:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JKPlBpi7nrIj; Thu, 14 Jan 2021 07:35:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9BB39868F3;
	Thu, 14 Jan 2021 07:35:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8AB75C088B;
	Thu, 14 Jan 2021 07:35:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E2C14C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D22198737A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7EsRXPRXn8M
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:28 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 51BCB87337
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 14 Jan 2021 07:35:28 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id c132so3211679pga.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 13 Jan 2021 23:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Eze22wqcpsTWbd1NuHKH1Yw11vYjsb5gy7SRhvZr/P4=;
 b=kqkKOaXkiBCJ6zNgIrer5E0F+51dO/snWGNUUQJhlBQQhExQRArBcImjl6USts8KVN
 R9lXyn9X9dy9YWL98MgXmbH//eKKb9bjWoggNrtQZg6e8J0Qw6envQJ4CrgCadQuzs4v
 vDfCvM0dd624GU2UBuxqer32lOsO4D2sXgxkJEi1cHcer7UcBo5WZ9tSQnKNaWZS4r6f
 49YP4tiRE20CS5L1+HdgCQLBOOERkDgaQH4aQU+90KgvFeeZo0mgTBHP9g70n90NHdy4
 bOv7fP2AZ7OB0Vb0+C/1nZkhO/UtBKQmkiUQ3N+areQI2ErvcOgGIMitiWuNnFRHke08
 hemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Eze22wqcpsTWbd1NuHKH1Yw11vYjsb5gy7SRhvZr/P4=;
 b=p73+X1FAv/cV3doq8poI686+x50MBN8jR9Jh0X/UNTwTjMyS6OHHFDJJr8fHLiXODK
 ROJFr/us+pWpHBP8Wd1UjH/lZMb7Chs6wzk9Go7lxc1Ey1fMXCxqIoBF2UCOz2QQBrl5
 l3u2CVq1uCo/n/r3GT8wHdACHwxe9Jkib6xiuRcGm1oflKsCk4Hfi29ahXD0XrLyKCAI
 98/0SDgRvb97jQ0X+8DYuv+QhfA/tw1YypwVMQBymHXh6JeyW9wWe9QRJtbDkjUnhTq9
 y6q2xIinaQqOHF/aptgOzJen9P6/2SfGbPYagg0b5LGx6Ici8Spnap6hSXBXwU1nXA0Y
 9CEA==
X-Gm-Message-State: AOAM533PuUf3TrhoZcOLoQo99e4m70s4hPpI6tsb9kPXDUJfqjQkRRid
 DmYAYxeySguK9mfy0fGE2UQ=
X-Google-Smtp-Source: ABdhPJzltz7TUsfamMjWZb42Eg905F+9IU8AQxpguZCcD7hZCoUinsYvWUQu7dTjW+zWJ1wRYr/lyg==
X-Received: by 2002:a62:7bcd:0:b029:19e:9bb7:6db3 with SMTP id
 w196-20020a627bcd0000b029019e9bb76db3mr6370186pfc.34.1610609727872; 
 Wed, 13 Jan 2021 23:35:27 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:b1fd:acc0:2bb9:df96])
 by smtp.googlemail.com with ESMTPSA id x20sm4442145pfc.3.2021.01.13.23.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 23:35:27 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Thu, 14 Jan 2021 13:05:12 +0530
Message-Id: <20210114073513.15773-2-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210114073513.15773-1-yashsri421@gmail.com>
References: <84492ae9-7452-d296-49ab-4d37eed3b968@gmail.com>
 <20210114073513.15773-1-yashsri421@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3 1/2] checkpatch: fix false
	positive for COMMIT_LOG_LONG_LINE with URLs
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

Avoid giving users warning for character limit for such cases, instead
suggest them to prefix the URLs with "Link:"

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e6857bdfcb2d..e8851ce73149 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3023,9 +3023,14 @@ sub process {
 		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
 					# A Fixes: or Link: line or signature tag line
 		      $commit_log_possible_stack_dump)) {
-			WARN("COMMIT_LOG_LONG_LINE",
-			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-			$commit_log_long_line = 1;
+			if ($line =~ /^\s*[a-z][\w\.\+\-]*:\/\/\S+/i) {
+				WARN("COMMIT_LOG_LONG_LINE",
+				     "Consider prefixing the URL with 'Link:'\n" . $herecurr);
+			} else {
+				WARN("COMMIT_LOG_LONG_LINE",
+				     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+				$commit_log_long_line = 1;
+			}
 		}
 
 # Reset possible stack dump if a blank line is found
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
