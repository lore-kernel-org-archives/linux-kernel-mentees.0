Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CE1AC4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 07:32:08 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A21E320797
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 07:32:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQzmzRRI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A21E320797
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1725F867F6;
	Mon, 16 Nov 2020 07:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MX2rosZNkdYk; Mon, 16 Nov 2020 07:32:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 38B0C867F2;
	Mon, 16 Nov 2020 07:32:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2AFEBC0800;
	Mon, 16 Nov 2020 07:32:06 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7AF4EC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 69B9287164
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:32:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v8sIGlelM7Mx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:32:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 4E27D87163
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:32:04 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id d17so6465074plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 23:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WiKXLY/e64nqLzEROzawOCPF5yuNSt2KsJE3wDL+hG0=;
 b=mQzmzRRIEbJ6jj06oXJs+VVoOP6UvLuvlT3fkUqsf839TJLI2HfqNTqobXLDA5CcVb
 rGQdgUviTpsTuUoJOcAEBswSBn5BpZvqemuIBKt89pQ4nmrqzi3pUIl972aDLXcADnSl
 9KyY6SxuUL9OyhC1kkX3UEHzauUtPixeqpg/ud9LpBL80vgqIYAg7icbbCLhf1mACsz6
 RUYpHneJ0oZHE/f4Jpi6ubsaqYtjjAenmGZRz8/4iN4YiOsoH39+lAU1XbqbA0U7tyDQ
 /cbGK+zjA3UAPkxL4NkerQa9TKTy8QfcHwPiW4BsSFFGf6kvkmRRzG3dtrXh4/dkma/E
 myGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WiKXLY/e64nqLzEROzawOCPF5yuNSt2KsJE3wDL+hG0=;
 b=EPRF6EjytTBrWq3WWLRUfGAv5FHYInBsNi6gfioMLBzPnlUrOHb0iPuX/VlbmYb4+n
 dWV1OMyIit9LH+QbtHlqaTsUDd06fZUZCRAFcd6PEgqsvE5+Ebl6HW+Bf6pXiWwGtx5/
 N7EE2rfJgzK12T92m6C6U9coByTN33XXAt/CIBgs4yoLA7zK4kqe7GGutbbSTbf3XCb1
 DD0xlk2dpB7LhX3gLlPDRkAwBwBccb9gwiacA3zcBdjJon5DgXQX2D0sPsCdgxkMBkdR
 VD8+xrcAEnNEHKMUSWyTyOtMrn06ShpXN+cQE1HRJx8bdAeHDi9BQChvlIAlPK3reI2+
 /FAQ==
X-Gm-Message-State: AOAM531fNo7PVeIYmb9isCfoZ/gS+I8OTrCUWZOXAe0CAczIS4yFOwiU
 Enkaz2VlZALD9jp3jB7YRlQ=
X-Google-Smtp-Source: ABdhPJx8ZzsUpG3zrRxLGLC8ln55eBCvppYF6Q/LpfYXEjVarP+mM1d/POTPUfw0gBTeb5HqBPfBpw==
X-Received: by 2002:a17:902:b196:b029:d6:ffaf:c3c9 with SMTP id
 s22-20020a170902b196b02900d6ffafc3c9mr11609441plr.62.1605511923784; 
 Sun, 15 Nov 2020 23:32:03 -0800 (PST)
Received: from localhost.localdomain ([42.111.137.21])
 by smtp.googlemail.com with ESMTPSA id
 e201sm17343115pfh.73.2020.11.15.23.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 23:32:03 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon, 16 Nov 2020 13:01:54 +0530
Message-Id: <20201116073154.8211-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: avoid
	COMMIT_LOG_LONG_LINE warning for signature tags
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

Currently checkpatch warns us for long lines in commits even for
signature tag lines.

Generally these lines exceed the 75-character limit because of:
1) long names and long email address
2) some comments on scoped review and acknowledgement, i.e., for a
dedicated pointer on what was reported by the identity in 'Reported-by'
3) some additional comments on CC: stable@vger.org tags

Exclude signature tag lines from this class of warning.

There were 1896 COMMIT_LOG_LONG_LINE warnings in v5.6..v5.8 before this
patch application and 1879 afterwards.

A quick manual check found all the dropped warnings related to signature
tags.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
modify commit message: remove specific commit example, add cause of the warning instead

Changes in v3:
modify commit message: minor english fix; remove difference count, add relative counts instead

 scripts/checkpatch.pl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index ac7e5ac80b58..f2369ac29d50 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2961,8 +2961,8 @@ sub process {
 					# file delta changes
 		      $line =~ /^\s*(?:[\w\.\-]+\/)++[\w\.\-]+:/ ||
 					# filename then :
-		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
-					# A Fixes: or Link: line
+		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
+					# A Fixes: or Link: line or signature tag line
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
 			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
