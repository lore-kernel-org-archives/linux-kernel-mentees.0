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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A46C64E7A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 19:08:02 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D021E20639
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  1 Dec 2020 19:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lhG+TSz3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D021E20639
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 438748766C;
	Tue,  1 Dec 2020 19:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J0XIaLhypvBG; Tue,  1 Dec 2020 19:08:00 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9629C87670;
	Tue,  1 Dec 2020 19:08:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7B819C163C;
	Tue,  1 Dec 2020 19:08:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6E84EC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:07:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6A05586B68
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:07:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QFM0pXrblUXG
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:07:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id DAC2386B67
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  1 Dec 2020 19:07:58 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id r9so1819434pjl.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 01 Dec 2020 11:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3k8wUreye3hCNgABtnnchdmZJU7MZ67yxVUTCzDbwog=;
 b=lhG+TSz3ardhgBQ9dPVuDdxEIl1Ve6Ccd1W9EqdIgLHW/SZMygOp9OfwtIWYrl4AlR
 Ql4GlNd7kbNDtHcXedFUk676XxkIQJLv/W3EhzLi8H4PfRL08pDThptzWSsK+4asyAHI
 WEjIF+7wEuPDfoEqi/phQflBBzh3wKc2aZfbhJmKgt95iUFkikctJL4XEe5mlbDfzRGy
 yMeuK0NAw38gPooe+qoK/sm93vL58T4gH3qoTzq6BId9uqqG2IjrAr4OrHWhEmyF7oId
 aEdtVgvBBl0YFNvktODpJYj4o2mErAWCmg26KhP9uFM8w1QASfyIO6xXdn0IvHLwKki0
 OCJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3k8wUreye3hCNgABtnnchdmZJU7MZ67yxVUTCzDbwog=;
 b=nZXJOaqq7PKfAfXJchwNsWKzv769NFsOx4gyRJNlp8zWatqeS1gYbh3P/CsPc1lg2M
 cnFLgFqIE/lyoWBlt/HS5XN4RyWeO0vGoUlohB1aB279BMEO41WLYtObiR2uDjpnoFpq
 9GVlivuFDWspb0ElOqEfPD0HpnazzJSQHSSIC83mWmDUWwcTromdWTMXLCQLgNNGsv+G
 e6vPOs/P2cKX4ywJTZeFe1xSpbmki2gBMqvVeLjDfhKXVhEeJ2A/COZuBUxY8T5/mTKT
 JjpI4uQ5NT8qWo2Qjt1GjUsmfKDvYbaAfF3SwVGu2qJ+jDZK0qIhZPXFlcU6rZrYBu6r
 kXKA==
X-Gm-Message-State: AOAM533xtHFT1ISs2aOr5X/q9IOZqTrM6R+oVnU6DEWDfstpjOdSydfK
 G/ZohyIDR50sZg3rQ1PI2Dg=
X-Google-Smtp-Source: ABdhPJw7JUuqwHqfCFuKuypu53c9dXCyg9LdIc+Dy2wj/D/8atMP2VmSUDxkTQ/PwS6U9Bdrgk4tKw==
X-Received: by 2002:a17:902:9049:b029:d5:eadd:3d13 with SMTP id
 w9-20020a1709029049b02900d5eadd3d13mr4062836plz.15.1606849678311; 
 Tue, 01 Dec 2020 11:07:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:60c8:895e:5a85:4183:13b9])
 by smtp.gmail.com with ESMTPSA id p1sm486815pff.131.2020.12.01.11.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 11:07:57 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Wed,  2 Dec 2020 00:37:29 +0530
Message-Id: <20201201190729.169733-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: Peilin Ye <yepeilin.cs@gmail.com>, dwaipayanray1@gmail.com,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: fix TYPO_SPELLING
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

In addition, highlight the misspelled word location by adding a
caret below the word.

Suggested-by: Joe Perches <joe@perches.com>
Reported-by: Peilin Ye <yepeilin.cs@gmail.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
Changes in v3:
- Highlight misspelled word location using a caret

Changes in v2:
- Use the default codespell word regex.
- Modify commit message to specify --codespell usage

 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 3c86ea737e9c..e8c1ed0b1fad 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3106,15 +3106,18 @@ sub process {
 # Check for various typo / spelling mistakes
 		if (defined($misspellings) &&
 		    ($in_commit_log || $line =~ /^(?:\+|Subject:)/i)) {
-			while ($rawline =~ /(?:^|[^a-z@])($misspellings)(?:\b|$|[^a-z@])/gi) {
+			while ($rawline =~ /(?:^|[^\w\-'`])($misspellings)(?:[^\w\-'`]|$)/gi) {
 				my $typo = $1;
+				my $blank = copy_spacing($rawline);
+				my $ptr = substr($blank, 0, $-[1]) . "^";
+				my $hereptr = "$hereline$ptr\n";
 				my $typo_fix = $spelling_fix{lc($typo)};
 				$typo_fix = ucfirst($typo_fix) if ($typo =~ /^[A-Z]/);
 				$typo_fix = uc($typo_fix) if ($typo =~ /^[A-Z]+$/);
 				my $msg_level = \&WARN;
 				$msg_level = \&CHK if ($file);
 				if (&{$msg_level}("TYPO_SPELLING",
-						  "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $herecurr) &&
+						  "'$typo' may be misspelled - perhaps '$typo_fix'?\n" . $hereptr) &&
 				    $fix) {
 					$fixed[$fixlinenr] =~ s/(^|[^A-Za-z@])($typo)($|[^A-Za-z@])/$1$typo_fix$3/;
 				}
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
