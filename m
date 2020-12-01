Return-Path: <SRS0=4WB8=FF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8078FC64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 07:23:52 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3A9C2085B
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 07:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYUWkBfN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3A9C2085B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 315DA86CD4;
	Tue,  1 Dec 2020 07:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MwHRgqJA1doY; Tue,  1 Dec 2020 07:23:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 300C186CB1;
	Tue,  1 Dec 2020 07:23:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1C62DC163C;
	Tue,  1 Dec 2020 07:23:49 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 07A19C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 07:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id EF6BE874F4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 07:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Aq5Sh-wp9VFZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 07:23:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 605E7874F3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 07:23:47 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t3so664789pgi.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 30 Nov 2020 23:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62XovuLGP8KgQCNcEZEsMV/0NqzJQ6zEFCXEwgkuSHI=;
 b=YYUWkBfNcbQARP0QF3Xs9Ur4sBY91GGnohJLLydY5/GEVe9zJtNOmS7/yh91Q+Kif7
 R9W4uLopFWn8+/sRuPCUGvILy2Zm4C+bidh3noH76l0iH4p76pgM6oi0m3qhi4fm5l+r
 5TXQkAdcO1RtfT/4PMXTwBIEu+6hxjlOgFWc1mjEEm3gGbV6IULtBB8+pgVPcfQ3FX5w
 VK9mALaumyMCMl5dwqYPZU3BKHrpXBwDq/X7/f1UC6ouXaikBJV3ZIZhhXXAXPl0YCCW
 rD2k/m8hjigVXL3JiuG1Y+jaLLwdo7YvrHzKkYgA22vj0cTQGNblgjvlRAqmjIe9aR1Q
 veew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=62XovuLGP8KgQCNcEZEsMV/0NqzJQ6zEFCXEwgkuSHI=;
 b=ib4Yf2ttjjQxTfl7aM7ii6u06LR+sL0BzdW87YimGuM0Z9etvj3Je2Fu0HJ0c+Lwi+
 3QT84NxQP1TkeXCcw+yT0+9PpIaI93212UpZB71TLyR0j/wa5UQZ3esN3V0Ks+JvRzyF
 +hW5eq7tB6FEgPq2HgPA5Im8P03hsbhsnoBgCTic/s+tap0ps7heX9exEAGj+DNbiv5T
 yt7kdkkJHaobj+pcIc4HZYO5UQOp/VWtx2AClqSEyWdj+rCuySbmMy+KkfUsaef0tFr2
 I/14jmBTM9Tt53rWGYcEXjslRgPjciRlPhA4qq5gSpLGnGaL3FeQFS2MtuwLlhU138B+
 EnGg==
X-Gm-Message-State: AOAM531X0DRKHd76J4Abwo+8+pzqoGnl+3UyRj1JkW+JzYr/chu36pwv
 cktK5noG4nAQXAhuu1YBw3U=
X-Google-Smtp-Source: ABdhPJwphpb1ohLwz1072VDtVU+EMIcOBVolNX8K1bm+U7Zrj8h3CVWYDFUUAz43YAUeq5DWCLBxQg==
X-Received: by 2002:a63:100e:: with SMTP id f14mr1186665pgl.8.1606807426888;
 Mon, 30 Nov 2020 23:23:46 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60c8:895e:5a85:4183:13b9])
 by smtp.gmail.com with ESMTPSA id 17sm1386603pfu.180.2020.11.30.23.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 23:23:45 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Tue,  1 Dec 2020 12:53:20 +0530
Message-Id: <20201201072320.44544-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Peilin Ye <yepeilin.cs@gmail.com>, dwaipayanray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix TYPO_SPELLING
	check for words with apostrophe
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

checkpatch reports a false TYPO_SPELLING warning for some words
containing an apostrophe when run with --codespell option.

A false positive is "doesn't". Occurrence of the word causes
checkpatch to emit the following warning:

"WARNING: 'doesn'' may be misspelled - perhaps 'doesn't'?"

Modify the regex pattern to be more in line with the codespell
default word matching regex. This fixes the word capture and
avoids the false warning.

Suggested-by: Joe Perches <joe@perches.com>
Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
Changes in v2:
- Use the default codespell word regex.
- Modify commit message to specify --codespell usage

 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3c86ea737e9c..bd6304f93e0a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3106,7 +3106,7 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
+			while ($rawline =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
 				my $typo = $1;
 				my $typo_fix = $spelling_fix{lc($typo)};
 				$typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
