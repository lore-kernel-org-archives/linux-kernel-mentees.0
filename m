Return-Path: <SRS0=uYLy=EV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB2EC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 11:54:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08F19223BF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 15 Nov 2020 11:54:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ReKaJKRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08F19223BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A95CF203AA;
	Sun, 15 Nov 2020 11:54:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0mpJvUrdLXQV; Sun, 15 Nov 2020 11:54:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1F86C20377;
	Sun, 15 Nov 2020 11:54:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 125C8C0800;
	Sun, 15 Nov 2020 11:54:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CF22BC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B94C487294
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:54:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hG44wJFl-h4K
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:54:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 1067F8728C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 11:54:19 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id f12so2504435pjp.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 03:54:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=KlHXAgtYyYu3v4lpFfqHH68rbY36R/F9Yom6+L7BGz4=;
 b=ReKaJKRl79jK/xVLuyD07EDXWNUQvdJM5KJ6Pr16Yqupy/9iLr/dOGoJSJhPVAOlH2
 sWmP/a1Mwb/W2m73XSMqrpBWIX+V+PIC/nXzmFkaLsnvp1E2JgG6fdrE2sv/+tRdQ3Bn
 KNIekXEqUYz1ZVyiwAMBsOXILe8+tidFcLeshao9jflaiyj20SrKxBCFCK9yUSqrntTp
 v8Mai0//OIC6TfEJSjB51ZF+2sNiDafghzCuKE/RYzCPuwM9qr+vva1uk/dyL9Jd2E1x
 I/nsEqgXeZ50YMhQRwhycz3W9DzEDSn+FFhnygR5hKLpjP4O264pnIOZLcXwtexMnJS0
 7aKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=KlHXAgtYyYu3v4lpFfqHH68rbY36R/F9Yom6+L7BGz4=;
 b=FpgQhpKsQEU0vYPaSyMWGcrmMOIc+iUerMjnzaj9HO98xV7JnoqjnTK3NkaXyCOTiB
 M8hSMZkoohcYarRMLLK9eEKjOPmqOmqC8qbulgDyyIsB3iqWspyuEYgSgvlX3G1tbdIh
 G5rFam+gRvBMzvqixSFV9xJYmukXay0dUnIXlaqjqDgvBsw7jWkeYxU4G6HeQuOPjLWZ
 zFW6j4TGOW/o9qxtKtEZoXdPyULxVrb5v42sNZmaSTIIoGBgapMBBlhyTmvS48FnDlV+
 BOCcwxf26wrAJ6YWd4mTErP00QWw5BeWZO/IMVoCrPQX2Ipcu+EQPTxOVVoTovLD2V1y
 tnsQ==
X-Gm-Message-State: AOAM531k8ubmW/LxAQWUSZwFL167l46x0m8Nt0sap56h3Hc2zPRwV5LO
 0W8/5J7FMcWmmLiV3w9Xf+Y=
X-Google-Smtp-Source: ABdhPJwHqtEya0DjW+OSskhBBswHQVNkNJVPJVw7R5FcORRyoSVaGEBJkrz/q06ruNh35bH7/8ourA==
X-Received: by 2002:a17:90a:d518:: with SMTP id
 t24mr10767583pju.183.1605441258533; 
 Sun, 15 Nov 2020 03:54:18 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:40f:cfd6:9c0d:ea75:a189:9a76])
 by smtp.googlemail.com with ESMTPSA id
 i26sm15608793pfq.148.2020.11.15.03.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 03:54:17 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 15 Nov 2020 17:24:09 +0530
Message-Id: <20201115115409.14511-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	ASSIGNMENT_CONTINUATIONS
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

Currently, checkpatch warns us if an assignment operator is placed
at the start of a line and not at the end of previous line.

E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
deadlock on hotplug") reports:

CHECK: Assignment operator '=' should be on the previous line
+	struct netvsc_device *nvdev
+		= container_of(w, struct netvsc_device, subchan_work);

Provide a simple fix by appending assignment operator to the previous
line and removing from the current line

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c9aaaa443265..5b1a5a65e69a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3542,8 +3542,13 @@ sub process {
 
 # check for assignments on the start of a line
 		if ($sline =~ /^\+\s+($Assignment)[^=]/) {
-			CHK("ASSIGNMENT_CONTINUATIONS",
-			    "Assignment operator '$1' should be on the previous line\n" . $hereprev);
+			if (CHK("ASSIGNMENT_CONTINUATIONS",
+				"Assignment operator '$1' should be on the previous line\n" . $hereprev) &&
+			    $fix) {
+				# add assignment operator to the previous line, remove from current line
+				$fixed[$fixlinenr - 1] .= " $1";
+				$fixed[$fixlinenr] =~ s/$1\s*//;
+			}
 		}
 
 # check for && or || at the start of a line
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
