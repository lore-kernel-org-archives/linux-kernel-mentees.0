Return-Path: <SRS0=3uRj=ES=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63226C2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 19:58:57 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF85020791
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 12 Nov 2020 19:58:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTZ7Ncwc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF85020791
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 12A2A871C3;
	Thu, 12 Nov 2020 19:58:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wx6oTfyQhLz1; Thu, 12 Nov 2020 19:58:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1659287196;
	Thu, 12 Nov 2020 19:58:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 04016C088B;
	Thu, 12 Nov 2020 19:58:55 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 92AFAC016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 19:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 7241720398
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 19:58:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-+guf-Hv7cf
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 19:58:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by silver.osuosl.org (Postfix) with ESMTPS id 7A66420198
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 19:58:52 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id q10so5566618pfn.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 12 Nov 2020 11:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rXt3aBnjyyUVhNw6IvgDKYYDlvrZlVOOJN+YMGLagng=;
 b=UTZ7NcwcTUFjfNzTb+iVKZumGEWxvb1zuSYYg0oKpfx/xY4iCNXCsjnvpoIb0hUIEt
 Pt3CtUSTMfXz8cv+k9fbSfA6ZZJiAaq62xtJjqxujoa4Pfjkco9dfsU7xQASdILmhgpH
 ivzyITjBLQpbBUsA6+fIBohHoDajvbzxd6NlOdi1dvI/vJ2RBNdy48+Qy+xDDN/5Mh+L
 m91VpI/4jKeLykdF9QI8SJc6wR4sFRBE2FrSC1ZLEWUs9eZ4QvXdhaUZ6UwmdoJbztSd
 w+bpqZJ5XAZ5z6q+nhXKwQinOG9cwqNtOqwPueJDapIvyTI+8DmBtKZiprF/cT+8+u38
 M10w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rXt3aBnjyyUVhNw6IvgDKYYDlvrZlVOOJN+YMGLagng=;
 b=oXuTFkc0vvz/eXVX4Zp18dc0W/4r6s04/0sCPvkNKsmR0PSapR/61RtM8B0S7aO3Et
 cHXc5Uxgltzxh3K8u1U5WqNmzhH+qgEXd9Iwf7uCd7T++kAH07gzMjYzhAfIOpmxJPRQ
 pv82kb6lPLdKgiQ9S3WdfZCGVjivCC9nRS85lX3m1LfUVzTuSlNXRpWfyVgeZ0GIQNNE
 B74bixbwUS5cikx6SDSjcwCQr+s/v4ZTcjAE/u1rLVlx3EbKQkcyliymwVNQ+Ygc9T7e
 A0YwIRk9jY/70ECpGGW3SSqUuGIjPedN0R6QNYlXJGfckKXxEB5mQMAAlF/wrRhuMAg8
 qV/w==
X-Gm-Message-State: AOAM5303hUtmzV/jZ5A3IXiyyLN+3QM1KiVqh21QjQ/t5CZfXfE/CqDq
 tb8oTuTHE782DwFdfsqqmNY=
X-Google-Smtp-Source: ABdhPJz+bt0jNwQCityNqe1UNv0oAiPG1c5exBlmTkAj+8H1dXPtCU3GvNkyE8hAeWI4e5fP+KZ4/w==
X-Received: by 2002:a65:6847:: with SMTP id q7mr993484pgt.42.1605211131917;
 Thu, 12 Nov 2020 11:58:51 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:431:ca3d:d81d:4531:78f5:b367])
 by smtp.googlemail.com with ESMTPSA id c11sm8223177pjn.26.2020.11.12.11.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 11:58:51 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Fri, 13 Nov 2020 01:28:40 +0530
Message-Id: <20201112195840.5094-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: avoid
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

Generally these lines exceed 75 characters limit because of:
1) long names and long email address
2) some comments on scoped review and acknowledgement, i.e., for a
dedicated pointer on what was reported by the identity in 'Reported-by'
3) some additional comments on CC: stable@vger.org tags

Exclude signature tag lines from this class of warning.

A quick evaluation on v5.6..v5.8 showed that this fix reduces this
warning by a frequency of 17.

A quick manual check found all the dropped warnings related to signature
tags.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
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
