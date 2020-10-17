Return-Path: <SRS0=PE7C=DY=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 052C7C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:23:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 717CF2076A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 17 Oct 2020 05:23:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n5WACNV9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 717CF2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1753A88D4D;
	Sat, 17 Oct 2020 05:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ulu3gGFKPmUG; Sat, 17 Oct 2020 05:23:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 8AA40873C5;
	Sat, 17 Oct 2020 05:23:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7DD56C07FF;
	Sat, 17 Oct 2020 05:23:13 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C914C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 42B2488D4D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:23:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CUPjzuii5SpS
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:23:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 95E6C873C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 17 Oct 2020 05:23:11 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id q21so2652005pgi.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 16 Oct 2020 22:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=46Kt70r/bDYHJDe+zcQ3TtYjzSLIU+e5WRMsBr0lX/E=;
 b=n5WACNV9WxTHG+MStnGGcYxyNlN1WbK8pALro7h7tZmxIsAtwbbh71K5u3nVAZtiTT
 a/06ueRYTcsoUp2f4kqoLnnUeJOvLVVORtbikIfRNERyDkjeOceu6D7wV9M0LQ/aPLur
 cPyQSdy/NRYDkim2xQhpVKKwzmDX7C9rwKotJSlCFd1F8CyY5JL+bSyiNHNhIWqyJvPe
 oSKRQiw4gsS0zoVCesJnEXuldCcJMPpW533h/tirkqakcxBm0O6OfqZaYo1qZN8IcQQu
 LNA4H2L17xct1c7s9q2KWR4itTcPThn4TtztPNPxVZiMNzTsznxPrVjDrXPFCW80wAlR
 bxkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=46Kt70r/bDYHJDe+zcQ3TtYjzSLIU+e5WRMsBr0lX/E=;
 b=EjsKW8jy8ogH5PFrkVjy3MhY3e7EyyXNPWWUw3KaVD4VqetIaolKzHhNPvTXKfArFx
 svdSJDXdoBefmLBNlRDqsKX5spbLYenGquKX81dfPLDdtVsb7QNbKqjFI+dvBlsc4cCa
 vf0EZfyAzkgMS8/ctNcWX788aAlne1Fa4DxulzC5kA3InKy5aWKeZXJmMytUKNv8i3R7
 C/BSVeqykmoZD4yJEYekynnWKyDSyZxxgj+WtqNhLfcOIdtFUMOCQzLcDwXCC76w2Oo4
 QfD3wuAiPg3e8ZVAX86YqtN/rEGV1GKQAn3xanphVgQSLT6UOBlrK1vuaNRKIRvn+41W
 okBg==
X-Gm-Message-State: AOAM531hNWFV2SfBE18hONKCMtA8NZHqM05SGUb7YLdfsWfZ2o8S2x5g
 +BqmRtukHludLxJvW1UYGGU=
X-Google-Smtp-Source: ABdhPJxieGBqB4KXv5IPVX+eo5Ha7V47PYjzIhvlIsMgdTyoBAe6wepK+bNX6niGtsHq0u07KzglJQ==
X-Received: by 2002:a63:f14:: with SMTP id e20mr6207523pgl.52.1602912191025;
 Fri, 16 Oct 2020 22:23:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:68e2:46b7:2869:5094:8e3e])
 by smtp.gmail.com with ESMTPSA id q2sm4172191pfu.193.2020.10.16.22.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 22:23:10 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 17 Oct 2020 10:52:43 +0530
Message-Id: <20201017052243.17095-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add new exception to
	repeated word check
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

Recently, commit 4f6ad8aa1eac ("checkpatch: move repeated word test")
moved the repeated word test to check for more file types. But after
this, if checkpatch.pl is run on MAINTAINERS, it generates several
new warnings of the type:

WARNING: Possible repeated word: 'git'

For example:
WARNING: Possible repeated word: 'git'
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git

So, the pattern "git git://..." is a false positive in this case.

There are several other combinations which may produce a wrong
warning message, such as "@size size", ":Begin begin", etc.

Extend repeated word check to compare the characters before and
after the word matches. If the preceding or succeeding character
belongs to the exception list, the warning is avoided.

Link: https://lore.kernel.org/linux-kernel-mentees/81b6a0bb2c7b9256361573f7a13201ebcd4876f1.camel@perches.com/
Suggested-by: Joe Perches <joe@perches.com>
Suggested-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index f1a4e61917eb..89430dfd6652 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -595,6 +595,7 @@ our @mode_permission_funcs = (
 );
 
 my $word_pattern = '\b[A-Z]?[a-z]{2,}\b';
+my $exclude_chars = '[^\.\,\+\s]';
 
 #Create a search pattern for all these functions to speed up a loop below
 our $mode_perms_search = "";
@@ -3056,15 +3057,27 @@ sub process {
 
 				my $first = $1;
 				my $second = $2;
-
+				my $start_pos = $-[1];
+				my $end_pos = $+[2];
 				if ($first =~ /(?:struct|union|enum)/) {
 					pos($rawline) += length($first) + length($second) + 1;
 					next;
 				}
 
-				next if ($first ne $second);
+				next if (lc($first) ne lc($second));
 				next if ($first eq 'long');
 
+				# check for character before and after the word matches
+				my $start_char = '';
+				my $end_char = '';
+				$start_char = substr($rawline, $start_pos - 1, 1) if ($start_pos > 0);
+				$end_char = substr($rawline, $end_pos, 1) if ($end_pos <= length($rawline));
+
+				if ($start_char =~ /^$exclude_chars$/ ||
+				    $end_char =~ /^$exclude_chars$/) {
+					next;
+				}
+
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
 				    $fix) {
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
