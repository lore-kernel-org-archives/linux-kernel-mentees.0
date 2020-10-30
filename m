Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C666C5517A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 09:07:38 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4965B2071A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 09:07:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCFsB3/t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4965B2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id BC074872FB;
	Fri, 30 Oct 2020 09:07:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HWH3lF+-hMd5; Fri, 30 Oct 2020 09:07:36 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 4D6AB87241;
	Fri, 30 Oct 2020 09:07:36 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 45A73C0859;
	Fri, 30 Oct 2020 09:07:36 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2EE87C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2A9BC8688F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:07:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GG1JSl6uRHUD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:07:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 5E4148587C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 09:07:34 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id 13so4709738pfy.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 02:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+B7DrabjALESSLgvrRU2SUJPeb/davPcXgiTuHjAvYs=;
 b=FCFsB3/tIibDL4zx1fW1oF29wuAfAoJ1hS97J0MKs7E1RJUrUZ94sjGhHikaqpnYmG
 tCr+48OEbfz6TqXrGwlOURI68Ik1O2UMqQveFp3XHKB2rF8Vo05gSrZOAdpt1USJrB/G
 IFZ4GOiqKb0MGjsIoErdioH8lV1BXqMhbMJqPI2xpDxN3y1Q5No8seR5k6RxTPQFF9G5
 C69+8qUCIyqkggXfZf0B4Ngn/X1Zkg/nnv3HSvReNWIZv+qogBm87gVAOmsTiiyP3ys7
 gFu6PMZf3DMGTng4VwRUQLm0h5D6xcLXW4nr/SkDyCIUdwvWbKB2iR7kfKUw/5zE4f6d
 TidQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+B7DrabjALESSLgvrRU2SUJPeb/davPcXgiTuHjAvYs=;
 b=q4QO+PChCb5YkIB5MNWSJo4vFlPn5zMrwYjuyQ0WqCX66y4u9ZAt3Wjui0Qb+obzPU
 ByPUMZr4Rp6rL/rO58ZMgPIRC/dwdxAtiPZoBQGbmwbfe62bY+4fasYm3/63HWb8Hjco
 xnm4mRusdbPp1eIqyh6pAkqJLdZJMN/lVikhu+VKuxC4Chw73SWA5iVzy8C6Snz4z0LI
 1FwmP3CLnviBOFRjxvyqg5KyBshpJ19U5PeLgylp++0A0GS2gzb8XIqnIYnTbs+Q4j4H
 0TBW8sXtCVtEmdiB5WR7c+kEz6LPxk0lYDXjACLSRurNOnFCF92LrrHmGx1V67K64GlD
 qdaQ==
X-Gm-Message-State: AOAM532gFTiuczvy3x9nQFD8O3BRT7z4z0VIVsNq8+73LwR0hbFCHwSP
 qQju0fYUMZdw++BmJ96PM3E=
X-Google-Smtp-Source: ABdhPJwQoy5lGoxWGCu+w56vGEHkheybredgq458reF1b9S+aRPHgVNaR+OoMNWdPanqXrkH9up5ng==
X-Received: by 2002:a63:6503:: with SMTP id z3mr1313531pgb.2.1604048853824;
 Fri, 30 Oct 2020 02:07:33 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6819:f451:9e0a:873f:ed68])
 by smtp.gmail.com with ESMTPSA id w187sm5245878pfb.93.2020.10.30.02.07.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 02:07:32 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Fri, 30 Oct 2020 14:37:04 +0530
Message-Id: <20201030090704.40533-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, yashsri421@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: improve handling of
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

Improve comment parsing mechanism in checkpatch.

What is handled now:

- Multiple name/address comments
- Comments anywhere in between name/address
- Nested comments like (John (Doe))


A brief analysis of checkpatch output on v5.0..v5.7 showed that
after these modifications, the number of BAD_SIGN_OFF warnings
came down from 2944 to 1424, and FROM_SIGN_OFF_MISMATCH came
down from 2366 to 2330.

So, a total of 1556 false positives were resolved in total.

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
