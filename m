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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24A2C4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:30:25 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E14922075E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:30:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnozC2aR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E14922075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 5272286250;
	Fri, 30 Oct 2020 11:30:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gqfHhnPKH8Ys; Fri, 30 Oct 2020 11:30:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id E4D0286208;
	Fri, 30 Oct 2020 11:30:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CFD71C0859;
	Fri, 30 Oct 2020 11:30:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2CCF5C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B40687343
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:30:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NQFDx-2AIPCX
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:30:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 95999872F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:30:22 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t22so2792485plr.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=4KXXsRljWXKNZx9sGuTl9bP+5dTwUIcuveDfE32LuB4=;
 b=lnozC2aRzdEBl2M2IgGzB8KtZihC4aIzavNWrvXBVc/v2G/0L860nHPW+/n3g/3hjE
 41N+7m0aYk5sctPPGyIiWIaAuLW8TL07hYfOrANqOleUrtgNQcLkTNMnlh18vxTYfZvM
 5MQyXFxo5k0sYOOcUIy62UiQuKboRiZnesgSV/nVT+DEhpz4kqOfMj2r49q4o7KWh1Ad
 Snzdrj5Yk0BJ1UUB9Jzf9o/ZdaEK8FgG69xc48MM+ATShgbelLVvHdL4Onc8WbDTo9KJ
 zZ3i2A6WrJLIzx8TDCwObxOj9OsRsWV4q3XwxQqt+M6HrW0GvzWKZDa7JflanEs94Gu9
 ko+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=4KXXsRljWXKNZx9sGuTl9bP+5dTwUIcuveDfE32LuB4=;
 b=C/RkmClYNVeHHRPsGG8CEiC0SfW8BuUkIG7csVZbvcwPAbX4Eo0Lt8vhHfjM/BU1jg
 AT9Hn2PHO7sNHlC31J01ZvqYZaVPCgC1nBaWQdJFmFzsaYBWPzyIqxwCQ/TxHehVSRE8
 ZB9zt2S6+QDsFI5JADjGp7ODxwoP+gH9LgPksXyw1NWljbYO7yc7zYXyjkZfhF1NHdu/
 bt0scqhn/wLmNnH12YqoZK/RDTgaklO7uT9oGkmFwDgt3lSriADJX4mZtmbmr6XO1PdE
 TwXNOmO3Zjc6FnrhkhmFCxwLnwF1ga0zp+UQd4TqpNI9slRbN92NYrsmg69tGzcrrDBz
 hpCQ==
X-Gm-Message-State: AOAM533StOX4HdWgzTcALVN6zzYtA1eXaf67P9uE8SMAytDy7JXXdFPw
 ka3qBmJM2/PI7qyNsSgqLc8=
X-Google-Smtp-Source: ABdhPJw+PYcCQ8pj9r37SXvbUnQH8OHciXcCc3Tf9KKZ4Ty3J3Bh0tDMgWRaNJtO+zQ8uyxwSfNpmQ==
X-Received: by 2002:a17:902:b192:b029:d2:f08:f85a with SMTP id
 s18-20020a170902b192b02900d20f08f85amr8398788plr.49.1604057421934; 
 Fri, 30 Oct 2020 04:30:21 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a])
 by smtp.googlemail.com with ESMTPSA id i22sm5740272pfq.160.2020.10.30.04.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 04:30:21 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri, 30 Oct 2020 17:00:12 +0530
Message-Id: <20201030113012.23160-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	GERRIT_CHANGE_ID
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

Currently, whenever a Gerrit Change-Id is present in a commit,
checkpatch.pl warns to remove the Change-Id before submitting the patch.

E.g., running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW
API to 53 for 22000 series"), reports this error:

ERROR: Remove Gerrit Change-Id's before submitting upstream
Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d

Provide a simple fix option by simply deleting the indicated line.

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
