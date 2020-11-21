Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5026AC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:16:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CCBE722226
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:16:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miLvxHlc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CCBE722226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8369986FEF;
	Sat, 21 Nov 2020 12:16:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vnrBNC81oWIg; Sat, 21 Nov 2020 12:16:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 008CB86FE3;
	Sat, 21 Nov 2020 12:16:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D8343C1825;
	Sat, 21 Nov 2020 12:16:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25CD2C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BAC2C20418
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTqkkDcTV71U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:16:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id D71BC20431
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:16:05 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id q28so9823752pgk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=2t2a5RSuhb/As1zEzgXiwAu23fEnENund7CGHbuUhkQ=;
 b=miLvxHlc4BbrEYEi+uRD0x9o2B2KdXcmQXh+NLu50hfybZ7gL0uU0ycHmcA0l5jO6Q
 gJWZ6atrttsCAPm7vU0hVtFHdh+9D1WjdXhNulmSnh486HibHA0dkj8b03L2yIFsdqYi
 SFeTKWvOhMMsa3bbUuiZycJdQacgLmfGHCABaZ1ZyC5gSuVv00Kdw7PpuxIgJKb3w5+7
 1v5NPS4S9VtHBJsA+/BkS2aLa80DJNOYazNu83IyYkNNl0yWxMjdblygmQxJofwOKqcV
 vh2rMYhqwy6n1ZcNwrBaBOHvGP0+ShkWqLg8DIvYmSyIDNuVhU3exHkyDLHAEkHx+Th6
 jwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=2t2a5RSuhb/As1zEzgXiwAu23fEnENund7CGHbuUhkQ=;
 b=HDKHgy2PXtsPoa0j39uh4GBakecny+vcHmUEoCS2sQzwR93YkTRCZ8NMgj/0gQUoRu
 YieZ5oVhm6r1Vc5gS+CCmQRJi9v6EpIrs5yNaz6KzSuUv0rmltMEkxvIe18kGg4jxDXh
 vK/WctrLmTBCAzsCcxNs0vsnBr9jQEa+tCGFVu6QhhhOC+Ja1TWUZPDZ+jFljuStJZiV
 uHrluPfIcrxWcMWQjxMBRTJw0gbqGtbYUHA6FhGSmNX9gCuwowSB61aJPfn1j/6uGFB3
 O4ujzkmRNmNAAJrDiLyfXCmjuX3xQGUoZ6nOWWABGAxlpi2xyFtUGeZv4HU4ScKlUhl2
 36Yw==
X-Gm-Message-State: AOAM530qOJayHFiK/+08Gx5bGoQ60NoC1HCCTjHJXjG1ZhRlbyGMPdr/
 PASrcSAqAhF8WmDNl4AiEuY=
X-Google-Smtp-Source: ABdhPJw021THeZczZOFtV6/DAMEPKjirc50VNwyXspYWUCgSnKm0I4Zug9Qubs4pmU72MiDQWg3k6g==
X-Received: by 2002:a17:90a:9403:: with SMTP id
 r3mr15748398pjo.66.1605960965308; 
 Sat, 21 Nov 2020 04:16:05 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:400:4498:ed91:20bf:333c:1bc4])
 by smtp.googlemail.com with ESMTPSA id q13sm7838249pjq.15.2020.11.21.04.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:16:04 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sat, 21 Nov 2020 17:45:57 +0530
Message-Id: <20201121121557.23528-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option for
	LOGICAL_CONTINUATIONS
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

Currently, checkpatch warns if logical continuations are placed at the
start of a line and not at the end of previous line.

E.g., running checkpatch on commit 3485507fc272 ("staging:
bcm2835-camera: Reduce length of enum names") reports:

CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the
previous line
+	if (!ret
+	    && camera_port ==

Provide a simple fix by adding logical operator at the end of previous
line and removing from current line, if both the lines are additions
(ie start with '+')

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2: quote $operator at substitution

 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5b1a5a65e69a..7cb8942b6a16 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3553,8 +3553,14 @@ sub process {
 
 # check for && or || at the start of a line
 		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
-			CHK("LOGICAL_CONTINUATIONS",
-			    "Logical continuations should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("LOGICAL_CONTINUATIONS",
+				"Logical continuations should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# add logical operator to the previous line, remove from current line
+				$fixed[$fixlinenr - 1] .= " $operator";
+				$fixed[$fixlinenr] =~ s/\Q$operator\E\s*//;
+			}
 		}
 
 # check indentation starts on a tab stop
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
