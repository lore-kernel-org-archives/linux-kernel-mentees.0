Return-Path: <SRS0=I6GU=ET=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13526C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:11:37 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5022223C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 13 Nov 2020 13:11:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BB+/B/u5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5022223C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 02104873DC;
	Fri, 13 Nov 2020 13:11:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ixd5yAiWIo8o; Fri, 13 Nov 2020 13:11:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A2EE1873DA;
	Fri, 13 Nov 2020 13:11:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 98A23C0FAA;
	Fri, 13 Nov 2020 13:11:35 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7B655C088E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:11:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 764C8872B5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:11:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9YZFgj3bCZoH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:11:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id E2E5187284
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 13:11:33 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id 10so7585216pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 13 Nov 2020 05:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75K9Xmj3ZL7JIJFabT0ZlYsUmd1/U2W+UwNPqr8ITUk=;
 b=BB+/B/u5IVnXmkQY6+YYyzJeRo23kPVXakF1637xp99uBaVHXhH9r3kWBh020Tq94u
 t/d6cAZcQLPC0BO+llThD7BsS7eDpJy6JI6FN3mxn8iaNR42q1qLqtUNXvccvxamC5GW
 iIgEUGAgidux1rgKf+ETBNnZ9X0FE+eweR45chSMcgK/hqbp7lRmihUTQV0E5DoRFKPi
 0QIZaMSvqhutdCK8ny/f5OO3cvRSuqjYzh5QJSVmIzp1tEpRHqA91ARCKsDUsXg7mPEo
 GOWyaIGRAIorj6Q2e6tltuE63OAc4tKHaxBlKEvpvSbD4Wa5PWU+vMkxLuUn+sfGo1Hf
 /XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75K9Xmj3ZL7JIJFabT0ZlYsUmd1/U2W+UwNPqr8ITUk=;
 b=H+buGq7pvKgAPG+KUG6luxaLx7XF0/zLG1Co2GpnC2Z3nIwN/ZrQXd6TcVfswnSRfV
 En72nakJZvpYqcMvQ81AcJrT3NJOc5SwjO6nEpBS2bDTcTF7/uGwsH+uJaMgIdn/ZRWa
 WrYODy6SHYAb/b3OHNq7G+WnC8YIS9lgMCOYNzOn1r0Wh9h4KTbO7/WNScOIcDWbAJhx
 5rgPXPYUvFS2dU0hWKYY09e1MKJPryny/9CQlMz8nhahUsP3yFwOMeyr/IT/AbrqTfsF
 pYsg/UVBDwkgO52tFbKWEiMOIbB+V6Iw1Fb3m3fPus+HScbWdCXZ1yLjynssKk/NWZF8
 9QHg==
X-Gm-Message-State: AOAM530Tql7N/lOSLqCQGwKOc+cY2IcnXjRadW8VpZXFDv80eDqLaFwm
 xWaVPx5huXqaFQWU+Zi2S8w=
X-Google-Smtp-Source: ABdhPJzZHmYbT7BNBCHwmxpfa0iqfKje97CetxC81cErMlPi+mlnRx3EKEWnN0XJc9ZCJ4yWX5gxEw==
X-Received: by 2002:a17:90a:448a:: with SMTP id
 t10mr2883633pjg.38.1605273093372; 
 Fri, 13 Nov 2020 05:11:33 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6819:f451:9e0a:873f:ed68])
 by smtp.gmail.com with ESMTPSA id gm12sm10533302pjb.28.2020.11.13.05.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Nov 2020 05:11:32 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Fri, 13 Nov 2020 18:40:37 +0530
Message-Id: <20201113131037.37519-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix typo and remove
	duplicate word
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Delete repeated word in scripts/checkpatch.pl.
"are are" -> "are"

Fix typo "commments" -> "comments"

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2749f32dffe9..e7fd2d6279cf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2841,7 +2841,7 @@ sub process {
 
 
 				# stable@vger.kernel.org or stable@kernel.org shouldn't
-				# have an email name. In addition commments should strictly
+				# have an email name. In addition comments should strictly
 				# begin with a #
 				if ($email =~ /^.*stable\@(?:vger\.)?kernel\.org/i) {
 					if (($comment ne "" && $comment !~ /^#.+/) ||
@@ -7109,7 +7109,7 @@ sub process {
 		exit(0);
 	}
 
-	# This is not a patch, and we are are in 'no-patch' mode so
+	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
 		exit(0);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
