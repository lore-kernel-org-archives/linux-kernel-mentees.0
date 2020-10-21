Return-Path: <SRS0=nqa8=D4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECB5FC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 21:18:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FB7A24198
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 21:18:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZAj9tO9g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FB7A24198
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7AE3686A36;
	Wed, 21 Oct 2020 21:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 696-epgvjlW7; Wed, 21 Oct 2020 21:18:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6AE0185EAE;
	Wed, 21 Oct 2020 21:18:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 46F41C088B;
	Wed, 21 Oct 2020 21:18:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF022C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 21:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id C7E1D2E44B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 21:18:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kTcg9lbU5adC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 21:18:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by silver.osuosl.org (Postfix) with ESMTPS id 3F1FF2F36F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 14:45:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id n9so1595424pgt.8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 07:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pxAcdVZl/YIRZ+Db6rT1ciQ/orlo2DSt1cDHO2mvbz8=;
 b=ZAj9tO9gE+uPn1Aujv88U1LOcSJcd7ifPhmfgYzsbxfvN2j44Ah2X5ffVVcdrVXCNy
 3GbCIc/8x21GXuYo+RrjlSlRbrjUI/gGtztLSTh+/8zs6/GVoxybiqfopZkZegtql8EE
 7C/ZvDr9a1ZStULCK/2uanh1SOPtIlC+Dn2aT9yzetvLN3ujo0asIcOm3AKFXIhT2d87
 0T+G42np4HVjteKCpDTuJ/TU5nNcxxXpaKCqR9o2ry/M0m6BsE0zgYECxsj728rqcCDv
 rPC0/EBjEGxLs7RbYvA1LefgxZ3RYFTH8gsLo0H7l8Unn0b53kh3wqXgxIy8konAE1cK
 gIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pxAcdVZl/YIRZ+Db6rT1ciQ/orlo2DSt1cDHO2mvbz8=;
 b=MnBts9qvvVgkIgwepK/M1pYJsSfc3DG7qFZtHMs5epBJG3RDPncS0Onjc3Np7rT2hK
 9bqvJGGweONyoxcTaDPr3APuHNnU6XVHLe5d9zQ+iR/nJPT+qgsYtN0KYNuOTWR+r25N
 iU4TMbOw/49NyxjH25lmhoBtHTL2SjstBBfPtqMhYVa2a7iYcEB0jocRhDGH4rf1KIQl
 /YFrSMnBftE2BzLLxuSJhXpQYj5W6bhnzbhjZkQK/i/Hn9Lg4g3rj+h+PBCqxEDILZmw
 JvOvJThiHcdLQrudDArP0JzUsrar2Y5LzQ80q9eyzT4BH+sXsJ4NabXivn7y64Nmy3zK
 8UXQ==
X-Gm-Message-State: AOAM533LyBDcUZKCtgxzYcZSrNUr/fjIf367fSmNVqUIKql6lx0LDB5g
 FXdCaRfZQJ87Hc5bAjeUDX0=
X-Google-Smtp-Source: ABdhPJwixBPQj5h4r3ugQugDZOW4+Izh86j8jPK41XPK/Kbr6+ARnig9rHCFT6Axz4sO81sb+rIP8A==
X-Received: by 2002:a05:6a00:8c5:b029:13e:ce2c:88bd with SMTP id
 s5-20020a056a0008c5b029013ece2c88bdmr4116723pfu.0.1603291510702; 
 Wed, 21 Oct 2020 07:45:10 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:41d:60ec:8cb2:c45f:197:35d9])
 by smtp.googlemail.com with ESMTPSA id
 e6sm2616149pfn.190.2020.10.21.07.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 07:45:10 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 21 Oct 2020 20:14:58 +0530
Message-Id: <20201021144458.29614-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix false positive for
	REPEATED_WORD warning
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

Presence of hexadecimal address or symbol results in false warning
message by checkpatch.pl.

For example, running checkpatch on commit b8ad540dd4e4 ("mptcp: fix
memory leak in mptcp_subflow_create_socket()") results in warning:

WARNING:REPEATED_WORD: Possible repeated word: 'ff'
    00 00 00 00 00 00 00 00 00 2f 30 0a 81 88 ff ff  ........./0.....

Here, it reports 'ff' to be repeated, but it is in fact part of some
address or code, where it has to be repeated.
In this case, the intent of the warning to find stylistic issues in
commit messages is not met and the warning is just completely wrong in
this case.

To avoid all such reports, add an additional regex check for a repeating
pattern of 4 or more 2-lettered words separated by space in a line.

A quick evaluation on v5.6..v5.8 showed that this fix reduces
REPEATED_WORD warnings from 2797 to 1043.

A quick manual check found all cases are related to hex output in
commit messages.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 9b9ffd876e8a..78aeb7a3ca3d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3050,8 +3050,10 @@ sub process {
 			}
 		}
 
-# check for repeated words separated by a single space
-		if ($rawline =~ /^\+/ || $in_commit_log) {
+# check for repeated words separated by a single space and
+# avoid repeating hex occurrences like 'ff ff fe 09 ...'
+		if (($rawline =~ /^\+/ || $in_commit_log) &&
+		$rawline !~ /(\b[0-9a-f]{2}( )+){4,}/) {
 			while ($rawline =~ /\b($word_pattern) (?=($word_pattern))/g) {
 
 				my $first = $1;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
