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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C6A1C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:01:50 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7D32224E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 21 Oct 2020 15:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0dSn7gN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B7D32224E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D892086470;
	Wed, 21 Oct 2020 15:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9bY39t1hMhlz; Wed, 21 Oct 2020 15:01:46 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3FD0D863E0;
	Wed, 21 Oct 2020 15:01:46 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 26072C0052;
	Wed, 21 Oct 2020 15:01:46 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA25DC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B18EE87151
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:01:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Hhm4qzOcfYS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:01:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com
 [209.85.216.65])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 3EF7F87126
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 15:01:44 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id b6so2181318pju.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Oct 2020 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=pxAcdVZl/YIRZ+Db6rT1ciQ/orlo2DSt1cDHO2mvbz8=;
 b=e0dSn7gNlfWmZ9NcZPlkwENydhaAtKyX+pH/ejlCnrg9uqUxmzzG6mcxcCQ6661BVU
 nU9jMfImnZXM7l0YzUlT8wk71a6UwM9iwgaVQX3SPgFgBdNVYdi/ztBokj0OH3qyCpZq
 c5/ZNRfpnvglJjcwoVWhelr+rnfN++WsmT2p188Su45BuK0uwPnoNLi/0tdxBWAyoWQL
 pKy+F4+opiQ8Zy6IdJv9uPl2bLfqCx05+QB5Q3SQqd8B4VLoUMLQSfpcsiUxODAy0RYV
 R8jDudapt/HHYG+NKGPcQoHfztq88x9IEPBjScVUxtKL0dGIb3D97dEYzjO7TE25wkjS
 oswQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pxAcdVZl/YIRZ+Db6rT1ciQ/orlo2DSt1cDHO2mvbz8=;
 b=l/7VQoBphf7ZWYHFjn3JosLqlBAmjPKIZhwo/6rntYjeexPqKruTnX7YO9A3CPUrCd
 JZx50cRxJNSk5jM6RuL0iVKrrNXJ5f8oBSjsmdveokESUyeasvJLcJpMtGluwxBSSIjK
 aTgIuJsvROSiXFKZk3JYNuBeHVzjWQs8XOol6VjpJvkSdRHlnws/fDw1fCTgX6ErS/r3
 KekP0PePuR/oN5iAuGmWK+DLs0i258ZJ1i6DaUyAmz6+oDYdRjqcIr/DMC7IIyT8wSx/
 kC03aTIaf1LuC+dsIclBz/wYxGsJsCx63Y9LHJ7oeT+vWsISLjp5/4LujqNCb8e2+0U0
 LqhA==
X-Gm-Message-State: AOAM530pDOgkfvcgcC6K3F8FeJ352h/dY/JJQG6OYTlWCRlzFmzth6cl
 1CBDVqornJQm+30XGHtJ4+s=
X-Google-Smtp-Source: ABdhPJxyTGlPAOtFsyfXgAseCi6vB1MeM10HqBS/vG88cAZG3ZrU3MsuVzH1rNxjQauAGm+xUa9GJQ==
X-Received: by 2002:a17:90a:c28d:: with SMTP id
 f13mr3647088pjt.145.1603292503614; 
 Wed, 21 Oct 2020 08:01:43 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:41d:60ec:8cb2:c45f:197:35d9])
 by smtp.googlemail.com with ESMTPSA id
 z6sm2776437pfg.12.2020.10.21.08.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 08:01:42 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Wed, 21 Oct 2020 20:31:20 +0530
Message-Id: <20201021150120.29920-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: Aditya Srivastava <yashsri421@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 dwaipayanray1@gmail.com
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
