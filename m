Return-Path: <SRS0=DonT=C4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04AB0C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 20:48:05 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 562AB21D42
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 19 Sep 2020 20:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MgUB0ota"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 562AB21D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E08C887491;
	Sat, 19 Sep 2020 20:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rBnhfOVMeGfB; Sat, 19 Sep 2020 20:48:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6E15387490;
	Sat, 19 Sep 2020 20:48:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 56D9BC088B;
	Sat, 19 Sep 2020 20:48:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5AF89C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 4335385F80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:48:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Py5yC2gBofC7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:48:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 8F02085F75
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 20:48:02 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id v14so4847742pjd.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 19 Sep 2020 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3tDVlF9QURn68en1g5ngH206VYOefysLjx8XpzJWR2I=;
 b=MgUB0otaoVijijJ/FMblM46ocG7wQuYPlR/mpt7LOBmn5rXXid5pVxpt5YLRPSZpTr
 OZY3FRZNMUZCqscQZK+pic11XBKuV5NvD0EwkpjsFXHDA/IIklKGlZhzGwCPgpRnqs/n
 +favlIQTL8RkYd8eVCsq3LZyv3Z7QfCwydaU80mxKqZ3CZweRSV3PP6/MTxt4+Vh2Jsb
 b92gCNm3j0uoHLVSPOAc9+xieN18DR2AT+Z8WaG/A/IJoAQJQEcUtFPKkj7dpWQhDYco
 xxZZapZq4vxfbRc2rtEOWAeSnr26VPeqDAED/6Ps6x4nos7pf9SWIdSaaDjuf1WICcFi
 S4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3tDVlF9QURn68en1g5ngH206VYOefysLjx8XpzJWR2I=;
 b=VonyCYArZnWcD2NdXHsGp7cI2ZwXMOrNnbaFqrsfSz+a/pwCmQQFIHcmdfHh7/eQqp
 biTyxExnBRVJex/o6mESL7T3lh8zMZrou9D51lSk89QuDxNEojBmLbhWbxqJCksbhxpj
 U/sJdVg5FT3OaeKyE1rmZgFhRRCx+wKRSVcVbguGaMKxFYTOBdSWPD47E7W0fZyKZCbW
 oR0z83dZv59xBnyeJi1gxoAaUeyBF6qTrH1hglCHFrKlKl+zGV4quFSlHk4zjenORMx6
 B8rptlJ89c4SDZKrjHNU5uG/OnFi3jTwf8ZmfJj6zxeZOuKpH+RQYGp1DV7HYL0O0p0z
 R4aw==
X-Gm-Message-State: AOAM532FpVcJ3W3K9SCjz9MDNdSgI3acBc2Tdecqrhqwucid7vwkXxLG
 YKfnXSQ9RN5Cbr5wyRpmobw=
X-Google-Smtp-Source: ABdhPJyUKbDPvPc37VxvSRPCEGs+uvOZyCa+8SqGOJtnEhf35o1aJSw4Q78wpMZ5BIfQflcsD8brXQ==
X-Received: by 2002:a17:90a:cb93:: with SMTP id
 a19mr16537063pju.207.1600548481909; 
 Sat, 19 Sep 2020 13:48:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:68b6:22a6:478b:7326:9143])
 by smtp.gmail.com with ESMTPSA id 187sm7472668pfx.174.2020.09.19.13.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2020 13:48:01 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Sun, 20 Sep 2020 02:17:21 +0530
Message-Id: <20200919204721.100531-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: extend author
	Signed-off-by check for split From: header
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

Checkpatch did not handle cases where the author From: header
was split into multiple lines. The author identity could not
be resolved and checkpatch generated a false NO_AUTHOR_SIGN_OFF
warning.

Support split From: headers in AUTHOR_SIGN_OFF check by correctly
parsing the entire From: header in such cases.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 504d2e431c60..8ee61ec346b3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2661,6 +2661,10 @@ sub process {
 # Check the patch for a From:
 		if (decode("MIME-Header", $line) =~ /^From:\s*(.*)/) {
 			$author = $1;
+			my $curline = $linenr-1;
+			while(defined($rawlines[++$curline]) && ($rawlines[$curline] =~ /^\s+(.*)/)) {
+				$author.= $1;
+			}
 			$author = encode("utf8", $author) if ($line =~ /=\?utf-8\?/i);
 			$author =~ s/"//g;
 			$author = reformat_email($author);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
