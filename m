Return-Path: <SRS0=MU2n=DU=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A2C2C433E7
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:37:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B9F92064C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 06:37:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FUk6dXM7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B9F92064C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id A005F87A6E;
	Tue, 13 Oct 2020 06:37:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JujW3FCZim5o; Tue, 13 Oct 2020 06:37:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 301A987A2C;
	Tue, 13 Oct 2020 06:37:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 17F63C0052;
	Tue, 13 Oct 2020 06:37:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 710BEC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 57AE6871CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qJ28lBH53w3f
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:37:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 872EC86BFE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 06:37:17 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id j18so3560212pfa.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 23:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+1wfzrIL65NAPWaqgLsoNY6XBV7rqfcyLpmvCVcLBAw=;
 b=FUk6dXM72vLJwJmOWdSehSqvb0Fcf+JJRGsZae9utP2ZvNfGyUZ+Bj0ktfLJBerRza
 4mF/fWar4fOOVJsPsQVGs4sIPzKS2ZuU+AhwsM04CLela7kTeYnKIgLUM60vvSxjWtWL
 lBeUSeSXN2qYFnek6CSujYyGm3YD0n4MOOrz9ie0bOaoLrunbaFVW2c0M55ajkM/+xp1
 vQ24lt9GEv1gsJkkUG5gBy3pRBEGbLyZLtuNcKiZUckRlJ+6ipXJBy5kOXYUIx47nRHt
 1w6OfsOCmiEYudaFp2b4VG0vcgpJLGtyWJ1SjFfuZcW0KMz4bCOpkxoZHUMzYRx7U7g3
 H8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+1wfzrIL65NAPWaqgLsoNY6XBV7rqfcyLpmvCVcLBAw=;
 b=BIWkrHIpqDvqua1h64Xmts+Uh+zqnqjBky6j+wvNhFClE0NcHVHMb6mAb+2B5b81AP
 H6dcODmuDxOkkDQnTGhGkb0AxSIBKgI3ztGfTSpwTx3i1tzuDIbL7W/PzpI7RRPFpQEV
 MHOcrD8CI5i6Qk1cIsrZvrbhBw/ywy6DwcPjAGueUbEZ2yNsJsdP3+bfmqUW2ye2/QVJ
 8RRu7QPWdP2qxYvYZ9mu22JeBPMkU37jdP/1zPBkel/kYiTriEFcIBBCDodU99Ie6M29
 LMgYvESyIkVDgX8qafS3RrYYOLY5Ha+BbQWFyf2g+KOfYX5lYwCDrPbcx3/JP5SjPEdn
 O48Q==
X-Gm-Message-State: AOAM532dQugKEW9D69lVG1xq6CIpf2qf88ZFhsA/QOLzJ+LjG48iVRdQ
 k34/2qR1LHGJJvXfwYGwdUE=
X-Google-Smtp-Source: ABdhPJyPOnj1LG8F3dpAH4VBAMobj1M1mvT46HiME+dTv3Q6IZCNaaRkC0ARITWKqsff4ZO4QoKUgw==
X-Received: by 2002:a63:c342:: with SMTP id e2mr15669689pgd.56.1602571037023; 
 Mon, 12 Oct 2020 23:37:17 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6854:a1e4:e3df:76ee:38b8])
 by smtp.gmail.com with ESMTPSA id w6sm17530235pfj.137.2020.10.12.23.37.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 23:37:16 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Tue, 13 Oct 2020 12:06:42 +0530
Message-Id: <20201013063642.39810-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix missing
	whitespace in formatted email
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

Commit 0c01921e56f9 ("checkpatch: add new warnings to author signoff
checks.") introduced new checks for author sign off. The format_email
procedure was modified to add comment blocks to the formatted email. But
no space was added between the email address and mail comment.

This causes wrong email formatting in cases where the email is in the form
"author@example.com (Comment block)". The space between the address and
comment block is removed, which causes incorrect parsing of the
formatted email.

An evaluation on checkpatch brought up this case. For example,
on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
the following warning was reported:

WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
system concerns)' might be better as 'David.Laight@aculab.com(big endian
system concerns)'

Add a single space in between the address and comment when the
extracted comment is not empty.

Fixes: 0c01921e56f9 ("checkpatch: add new warnings to author signoff checks.")
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..f1a4e61917eb 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1221,7 +1221,9 @@ sub format_email {
 	} else {
 		$formatted_email = "$name$name_comment <$address>";
 	}
-	$formatted_email .= "$comment";
+	if ("$comment" ne "") {
+		$formatted_email .= " $comment";
+	}
 	return $formatted_email;
 }
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
