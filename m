Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E280C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 15:20:23 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A655920878
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 15:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FdyOPnVL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A655920878
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 564FC22654;
	Mon, 12 Oct 2020 15:20:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uY+FImsJGfnf; Mon, 12 Oct 2020 15:20:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 1179B20116;
	Mon, 12 Oct 2020 15:20:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 05530C0893;
	Mon, 12 Oct 2020 15:20:21 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9CEC7C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:20:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 8423085FE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:20:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yow4YalYfV1k
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:20:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id EC31E85FC6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 15:20:19 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id r10so14576058pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 08:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDmkkeeqQ3b4HtPKjP66HsePetdbbMIHR1qv6Sgv0no=;
 b=FdyOPnVLgzq3ZS9epBu1sjXXvTR8eEKZ5VpYLpcm3BPKfJNM1y4HEgEn7mIJwTRFix
 tTqqY6a2Zn8c02xDq4naVIPJL1aAIj5aKZWKo/r8it7Z/KpEZbSWJkjQv1UyV8VBVWbB
 GdETIFMLuCmCwuq3PKmNMr/tOwxTzb/AaTGC8GSh8ZGJMy6Q76JD6WmXtDUNZD6Vr26r
 0r5WCxbXawommwNRbiPBRZS+T7A2wtgvT4uyp5M+J4rBifo2xVw3XKVJGBtkRM6Lk3tc
 ENj3egXAZWuN5vTOYIZq+F950I7rG5sXj/Xn2CgMFj6XJOol7QmJr6EliQxmabQRZLJs
 a4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YDmkkeeqQ3b4HtPKjP66HsePetdbbMIHR1qv6Sgv0no=;
 b=AOVWIMoDHgaKZt4GgtV1mwUqftL4E8AbGJHLQO3lKsDjNRuY7dfrjIHIekvmP/L9hP
 bJIYX1XCFdA3dO9CjSYabf/3cBH39JBzG7Jq8UyTVp15T6ajPiAqS8G3W6yY1K+T62fS
 zM3jahhIJdoSQSo5n/5By6/5ZmyabGOtfTgVjLl7jlQX4hT/KA8C3ZIKkxiid3ZP9tx2
 ISWsU9NBgm6HqWkupDZFhxDROrkU43wNZfMcohsCBlmu+wL4hG8iWkPo8/KnRVAmAvfm
 FNEkmAtbPBvpGfVAxco83a1oyKfA8gOZEbaFyzfFKEOXtDCsWHiwmoVAHi4zqUEQ4jyI
 YEBw==
X-Gm-Message-State: AOAM531eR9D0bK/74PxbAGauPlr+aHxmO7btbNt7jLPjZgBayXJkcGOT
 BTp4F1sZUR0tyTaU6P6KqIk=
X-Google-Smtp-Source: ABdhPJy1Fti/loRGToxRXjORfSstPLRFKjgO4hcuBr2WEwN07TpGRA8ISHOtIspE0tS0MABmB867TQ==
X-Received: by 2002:a17:90a:d983:: with SMTP id
 d3mr20612669pjv.144.1602516019438; 
 Mon, 12 Oct 2020 08:20:19 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:a404:280a:90bd:7a49:dcda:1fb1])
 by smtp.gmail.com with ESMTPSA id t5sm19814480pgs.74.2020.10.12.08.20.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 08:20:18 -0700 (PDT)
From: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
To: Joe Perches <joe@perches.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 12 Oct 2020 20:46:30 +0530
Message-Id: <20201012151628.1234094-1-ujjwalkumar0501@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Ujjwal Kumar <ujjwalkumar0501@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: improve
	EXECUTE_PERMISSIONS tests
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

1. Use group capture regexp for file mode test to improve code
   readability.

2. The 'scripts/' directory test on filenames can be excluded
   as it has become obsolete because there are many source
   files that are not scripts in this directory and its
   subdirectories.

3. Replace unnecessary group capture regexp with non-capturing
   group.

Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Ujjwal Kumar <ujjwalkumar0501@gmail.com>
---
 scripts/checkpatch.pl | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index fab38b493cef..aa84999917b5 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2678,10 +2678,11 @@ sub process {
 		}

 # Check for incorrect file permissions
-		if ($line =~ /^new (file )?mode.*[7531]\d{0,2}$/) {
+		if ($line =~ /^new (?:file )?mode (\d+)$/) {
+			my $mode = substr($1, -3);
 			my $permhere = $here . "FILE: $realfile\n";
-			if ($realfile !~ m@scripts/@ &&
-			    $realfile !~ /\.(py|pl|awk|sh)$/) {
+			if ($mode =~ /[1357]/ &&
+			    $realfile !~ /\.(?:py|pl|awk|sh)$/) {
 				ERROR("EXECUTE_PERMISSIONS",
 				      "do not set execute permissions for source files\n" . $permhere);
 			}

base-commit: d67bc7812221606e1886620a357b13f906814af7
--
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
