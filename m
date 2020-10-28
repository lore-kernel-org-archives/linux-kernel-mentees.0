Return-Path: <SRS0=l7vb=ED=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AAC0C55178
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 15:25:38 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D41AF247C3
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 28 Oct 2020 15:25:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rk7YWlUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D41AF247C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 3522085F6D;
	Wed, 28 Oct 2020 15:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FadP9kUNtel8; Wed, 28 Oct 2020 15:25:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 95DF3855B1;
	Wed, 28 Oct 2020 15:25:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7A1CFC0859;
	Wed, 28 Oct 2020 15:25:36 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 62AB2C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5EB52854A7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:25:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4WZQxceWgx2a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:25:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id AFE9E8501D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 15:25:34 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id e15so3111074pfh.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Oct 2020 08:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7aBxd9wvGAhqe9b4UK5WTDYxo4jznLuU7dvTCTS2kKU=;
 b=rk7YWlUSZoJbpdIbuN4crnpSHuACuqFj4L2opgSBU2sNTTPr2N/1+Ac21ObsXStwbV
 IESMmJ3Ib2QL8TYDwyAaYxZCyVqF/baxDBDC5Ur0YfH5e3qke7B3T/lIGYmeh1DmZrEb
 ajcHs8jyrLJeaieoDNj2+Y0Lq/36kwgpYyhbkG/LbmY9L/kkHwC+buoVt7HisbjvMC58
 SnuWV2y0AgvjpCJ4Bk/SRBpbJGNqhwWh6VjLcpkjJSq3RnXno7aEMTH7IufFp0WqIV3D
 4Vzqa5HI8tMK8BRYd/C5P3+bhYyp5ozzDQFk5OE/TM+/ioZbXvemjDlezpJedLBUcvqR
 tVFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7aBxd9wvGAhqe9b4UK5WTDYxo4jznLuU7dvTCTS2kKU=;
 b=X+ijmbe5fwNxKxKOXb5YsuHreAuxQhWA2WfIyYFYv3VhKLnBJMm8qAxkfQL5YDtOJ1
 yFhvi9qQpC2jtDNnpfQ9ay8DN8hfpl4pFMB1H9Xz+ePoVY7eRK20y9RLJp7acLCdoxCk
 zU+qgDWG/xQ30GY1Uz5TFmj0fpDXA4cwlA+IJorIIVWaghgoAlTwn4IxCxefrZtRWaOk
 gloTAOlY16geitp7VQ2VUKnu/02JQUQjo3DfUbqc4GvNCau2yPJA/PJ9Wkcj9w8KSOXU
 RMLJNHZBUWxK5PonDak3M3J0ant2EsZ5vt5cps8u04GecNojejDvnF+DDIxQgz3Kzzce
 2lLw==
X-Gm-Message-State: AOAM530sqi2pSkCoHLluNQeVSFbx5qk3+8Lw+T5+osDkqbgo0trBgD9F
 u4ZMGDnJLaHQdOYIDNcBGvA=
X-Google-Smtp-Source: ABdhPJzgRuT9lfghDzObA2dsbnoDOMrfY9GzTXgxKDpyXPnVtrLqV+W4BAudPBdX9Hyb9GqZ8UjueA==
X-Received: by 2002:a62:7609:0:b029:152:b31e:6aed with SMTP id
 r9-20020a6276090000b0290152b31e6aedmr8142108pfc.10.1603898734126; 
 Wed, 28 Oct 2020 08:25:34 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:68c8:652f:fb23:5ed8:226a])
 by smtp.gmail.com with ESMTPSA id ck21sm5245592pjb.56.2020.10.28.08.25.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 08:25:33 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Wed, 28 Oct 2020 20:55:01 +0530
Message-Id: <20201028152501.106117-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: improve handling of
	email comments
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

checkpatch has limited support for parsing email comments. It only
support single name comments or single after address comments.
Whereas, RFC 5322 specifies that comments can be inserted in
between any tokens of the email fields.

On analyzing 50,000 commits from v5.4 it was found that there were
about 370 false positives resulting from wrong parsing of comments.

Improve comment parsing mechanism in checkpatch.

What is handled now:

- Multiple name/address comments
- Comments anywhere in between name/address
- Multi level comments like (John (Doe) )

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..ae8436385fc1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1183,14 +1183,20 @@ sub parse_email {
 		}
 	}
 
-	$comment = trim($comment);
+	# Comments in between name like John(A nice chap) Doe
+	while ($name =~ s/\s*($balanced_parens)\s*/ /) {
+		$name_comment .= trim($1);
+	}
 	$name = trim($name);
 	$name =~ s/^\"|\"$//g;
-	if ($name =~ s/(\s*\([^\)]+\))\s*//) {
-		$name_comment = trim($1);
+
+	# Comments in between address like <john(his account)@doe.com>
+	while ($address =~ s/\s*($balanced_parens)\s*//) {
+		$comment .= trim($1);
 	}
 	$address = trim($address);
 	$address =~ s/^\<|\>$//g;
+	$comment = trim($comment);
 
 	if ($name =~ /[^\w \-]/i) { ##has "must quote" chars
 		$name =~ s/(?<!\\)"/\\"/g; ##escape quotes
@@ -1205,8 +1211,6 @@ sub format_email {
 
 	my $formatted_email;
 
-	$name_comment = trim($name_comment);
-	$comment = trim($comment);
 	$name = trim($name);
 	$name =~ s/^\"|\"$//g;
 	$address = trim($address);
@@ -1216,6 +1220,11 @@ sub format_email {
 		$name = "\"$name\"";
 	}
 
+	$name_comment = trim($name_comment);
+	$name_comment =~ s/(.+)/ $1/;
+	$comment = trim($comment);
+	$comment =~ s/(.+)/ $1/;
+
 	if ("$name" eq "") {
 		$formatted_email = "$address";
 	} else {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
