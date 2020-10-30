Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C82C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 08:23:52 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D97422210
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 08:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hw2oXWD5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D97422210
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1E83A85F79;
	Fri, 30 Oct 2020 08:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLRa9Cz58fki; Fri, 30 Oct 2020 08:23:50 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 089CD85F5C;
	Fri, 30 Oct 2020 08:23:50 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id E7D34C0893;
	Fri, 30 Oct 2020 08:23:49 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B7C4EC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 9A8A920468
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:23:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9dwM5vXA8yOc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 50B01203CA
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 08:23:47 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id a200so4603067pfa.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 01:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=cZS1mbN8CzO8kDY7DMru37RBwHfdUfXiyhlBVp28U7c=;
 b=hw2oXWD5zqKA0eRPbNUDhKhXI68GDDaR4enZKGiRTJBsK7EhQMyxqpb0KOWrU6+j21
 4cPrw4zPG0qjbfWkt6PnvJbgG9/smfRGrNNW+s6FAa9XvSdk5JaWMBnMOkeu20EL8FLm
 6xvZDqylvRWs5VQbQp6U6qHxsAvtS9CGJu3fIkT7XrubDyvAIwbeeLbVBh/lNpnoivOF
 vnXrbypp9ziPtYNLTSbP0lCr66QEfC6isBPo16tsX+lvK6BnYPyVWWlQHwA/DuaRlztv
 LzjBjw/zFQ7IFT19JJpc+ldYoxS3VCB/RJP3HgN3+ec7kYU3p5ENn869f8vEIyv5mUx2
 Fs1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cZS1mbN8CzO8kDY7DMru37RBwHfdUfXiyhlBVp28U7c=;
 b=WsxubAU8blvE7naWB+/U17Wzm1C1rWyKFV3JAVbj/KIGj8qjFYZyr/RzXPqRcPnCsu
 viS8/FxA3cMWCDPE/DA5xQwZPcvNCAxi20JWUTf0YNRlWoYqxJAyk/kWXvy0AQKvkBqm
 hKj7fZcHko4yA7NSKRZvUNjA/WB2wwtVE8rS6ZMmoe5j+zv4x3mHh3kQDZEZ5qvVi3U4
 qlDMolg0tQC+CUDw8I+z1yO/kvy7kwa7Ay1wsv03U5V4BhUg5fnvfXy+49qzuiJ7cdfa
 35bPviUEQGTZIn0RN+mTV2BeW7rz7hUCzaCNTdAL/wtSEtLNKde5qaE517OIAi3G3FMT
 +4xQ==
X-Gm-Message-State: AOAM5335gUGWiEh6CrCQNjkG+nR/CeZFXEAtWgIHj+uHhcU017I1pwgk
 +NHjT1NQ7hbGWWdvtgAjM9o=
X-Google-Smtp-Source: ABdhPJxNC8JeONNLR314dNrW4lmtPgLAw1pTl5cTSFSU6ZR2y5mZwOP2vBU/UbTiMHPqRgHjsQKzMQ==
X-Received: by 2002:a17:90a:7023:: with SMTP id
 f32mr1530388pjk.87.1604046226647; 
 Fri, 30 Oct 2020 01:23:46 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a])
 by smtp.googlemail.com with ESMTPSA id w187sm5113370pfb.93.2020.10.30.01.23.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 01:23:46 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri, 30 Oct 2020 13:53:35 +0530
Message-Id: <20201030082335.14256-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	ERROR:GERRIT_CHANGE_ID
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

Currently, whenever gerrit change id is present in commit, checkpatch.pl
gives an error to remove the change id before submitting the patch.

For eg, running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW
API to 53 for 22000 series"), causes error:

ERROR:GERRIT_CHANGE_ID: Remove Gerrit Change-Id's before submitting
upstream
Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d

But there is no --fix option present for this error message, in case
user wants to fix it immediately.

To fix this error, delete the corresponding line from the patchfile when
checkpatch.pl is executed with --fix

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7800a090e8fe..5329927fc1c1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2852,8 +2852,11 @@ sub process {
 
 # Check for Gerrit Change-Ids not in any patch context
 		if ($realfile eq '' && !$has_patch_separator && $line =~ /^\s*change-id:/i) {
-			ERROR("GERRIT_CHANGE_ID",
-			      "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr);
+			if (ERROR("GERRIT_CHANGE_ID",
+			          "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
+			    $fix) {
+                                fix_delete_line($fixlinenr, $rawline);
+                        }
 		}
 
 # Check if the commit log is in a possible stack dump
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
