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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB61C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 03:43:40 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8A852073A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 13 Oct 2020 03:43:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="snwYBNbf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8A852073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 380F02E0E3;
	Tue, 13 Oct 2020 03:43:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mYp7abcOw4Bf; Tue, 13 Oct 2020 03:43:37 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id AC8D420485;
	Tue, 13 Oct 2020 03:43:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8DF7FC07FF;
	Tue, 13 Oct 2020 03:43:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 70CBCC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 03:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 54C5C86C24
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 03:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hqD90YNYQZlv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 03:43:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 7206986759
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Oct 2020 03:43:34 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id h6so16562563pgk.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 20:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0W9VIQQ1F92giMMXeSWdWmbGQa5CVj0mL0tk7E83wCM=;
 b=snwYBNbfDuxuzVlVQnESkyd0BN1KpGywolnbnMFZPl7SgXGFWh4j/7A3PgQ8VFJu1E
 uhHnrHSLOx7YWU0RY2lytrqIyI4BVxKyfI1mJ9dC3QO2sA5U87Y7UL6vfCzqYKRtbBAp
 J9vpivwBIZ7IXFtfowsJD1olQw+BPHBY59u+vcVh2jHGttW93wPd53/whX07MEJlYloo
 B+/zqxvrxxha7EdPbjluE7g5FXWlJIZPjTVBQwoE0zrpQQ6nopftx7JLeHNzts5m8QHh
 tMxW4KgfqBMWW5T2hjgbWykaTbqWI4fAJcj9ECB4GvPCzPhj40onolFZ8V6OhwPd+1IR
 j5nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0W9VIQQ1F92giMMXeSWdWmbGQa5CVj0mL0tk7E83wCM=;
 b=a5Bz6zLMNn2Ws/dcnToko53hDGKV/byjKcChV7fEDEKZStLBMw6pUVeEWxculaiBjD
 to4UuvuNXYC6HjUmskkv879JgGBRqx6IBSyDCyFdOvAWiRmJnGMJKkr+44aUGV2+Effv
 et5TW6K9IfQSLV6LlWQQ2WaCOe70jr84bzGrEYfv5OhPYKNqfHbOQ/w4Sng1GtnhadqC
 r//PuVPwddXQsx5/45wFtEJ+wITzx5T9qZhLuceflo8owG+O/kLK4B4zkjTF+748UnPB
 FJM4PMkPDYOdndyHcbC85UTcbWRDqTlvEdmEGttL/wwc34NIO9Dk3HBy/4MzMSZKwuwv
 4TtQ==
X-Gm-Message-State: AOAM531bPKJnDxeSBB56sYca54jhqOp2d+BJeRY8WtS0ox0Z5oxQy4Gz
 H4TM+nyFRUKzs/MWikp6vmI=
X-Google-Smtp-Source: ABdhPJw9Z82qf+P4H7QRqviRdIKb8eIIFu9QMMLdyOFpYh/CLOYjWrmyd2Zt/hz7CPEBNj1p8xRPLg==
X-Received: by 2002:a63:db44:: with SMTP id x4mr15381942pgi.435.1602560613852; 
 Mon, 12 Oct 2020 20:43:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6854:a1e4:e3df:76ee:38b8])
 by smtp.gmail.com with ESMTPSA id e1sm22336842pfd.198.2020.10.12.20.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 20:43:33 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 13 Oct 2020 09:13:07 +0530
Message-Id: <20201013034307.5520-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: fix missing whitespace
	in formatted email
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

commit 0c01921 ("checkpatch: add new warnings to author signoff checks.")
introduced new checks for author sign off. The format_email procedure
was modified to add comment blocks to the formatted email. But no
space was added between email address and the mail comment.

This caused issues in some cases where the email was in the form
of "author@example.com (Comment block)". The formatted email removed
the space at the end of address.

An evaluation on checkpatch brought up this case. For example,
on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
the following warning was reported:

WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
system concerns)' might be better as 'David.Laight@aculab.com(big endian
system concerns)'

Resolved this by adding a single space in between the address and comment
when the extracted comment is not empty.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 124ff9432b51..6000addf1af3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1201,7 +1201,9 @@ sub format_email {
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
