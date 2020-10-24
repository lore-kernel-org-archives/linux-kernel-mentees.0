Return-Path: <SRS0=3SZq=D7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D60BC55178
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 09:06:33 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34DF62225F
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 24 Oct 2020 09:06:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NH6nXlGt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34DF62225F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 6F4A0203D8;
	Sat, 24 Oct 2020 09:06:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nKBvNMllR6Z5; Sat, 24 Oct 2020 09:06:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4F4F6203C7;
	Sat, 24 Oct 2020 09:06:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 23799C0052;
	Sat, 24 Oct 2020 09:06:30 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4B0FFC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:06:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2CFD686FAF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:06:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jaV3dAYibC3X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:06:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CFF9486FAE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 09:06:26 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x10so8555plm.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 02:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gk2cFmlbMq/sinRoeLY+9r9e8FSdPc5N55kkSeL51tM=;
 b=NH6nXlGtCyHPOwHoToc2vFq67Mjkpgo195a5xL3nYoVJMP1QES7z0vlWXGR/NflJ7Y
 tMW+y3ckjtiM64PEUNkrJVEmDyI2XXaa3EVxBUP8RRHuzubugHgAGfNG3Rmowxm8iCeX
 eCpPxuYWYP2/ffoxgW4FgRZ5KlAyFyXacEvwuFhdsM/NDr/fM/TVmHGA59JiRspmGYba
 O37dmWwSNgW1JC5zvSTBEr3SvJpENMl/hOE7Ly4EnOHLvC1ztote49tAjGOvLHEKo8TX
 OXJ7nYv1V28EdClr/TIikUDZVaPIxRU4co4zbxAVuJXOh6VnNVxgJUtJX2GM4WcLqjux
 nPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=gk2cFmlbMq/sinRoeLY+9r9e8FSdPc5N55kkSeL51tM=;
 b=sN0L+OvO/bl7ViPuZfOn/SMUB5PoARWveQhvN4KrYth0mxKk1aAW6u85/Q46vH889q
 u2Vr9t5zQC753gyH3Qs/+XygcCeXWD76cX0wsvs16daseo+htWwrOxZ2d2P8TB7XtbMB
 B0jeCJUdKftH8N2GrbdnYwLQR1OXnMP25LpdZKNbQOktSO6wuuz+rFDyFJcBffK1xVOD
 xmJsVeCumnA2FguzCQ5jRenmQsjIs8Fq9E9G8xZLWw4SnU505x3YZdL4H4sqatHvnEXt
 NkCP0oyGIuEib3R7bkFQS1bRqSq7CojGyzGK/vGkswpWHxuRqKYilVBrLvK3rs5zAV8p
 l+VQ==
X-Gm-Message-State: AOAM530DwbiRwxm5Hhr80OnGsyKQmkrbN4WTtvgzSuNyz/eOWlwx8XMO
 XYNbh0c2S0G1flIQ50u/kVw=
X-Google-Smtp-Source: ABdhPJxCQmNfRB2M4zRNe5tfuUFzx1eRwFhxk/iHaXM6oxIhEvHdSZk5Hd+dly2J5/orcPpQRWYbIQ==
X-Received: by 2002:a17:902:b604:b029:d5:e2cd:5381 with SMTP id
 b4-20020a170902b604b02900d5e2cd5381mr3631673pls.75.1603530386170; 
 Sat, 24 Oct 2020 02:06:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:683a:f9a0:a2:3868:eea])
 by smtp.gmail.com with ESMTPSA id a18sm4420082pgw.50.2020.10.24.02.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 02:06:25 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sat, 24 Oct 2020 14:35:57 +0530
Message-Id: <20201024090557.45092-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: extend attributes
	check to handle more patterns
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

It is generally preferred that the macros from
include/linux/compiler_attributes.h are used, unless there
is a reason not to.

checkpatch currently checks __attribute__ for each of
packed, aligned, printf, scanf, and weak. Other declarations
in compiler_attributes.h are not handled.

Add a generic test to check the presence of such attributes.
Some attributes require more specific handling and are kept
separate.

New attributes which are now handled are:

__alias__(#symbol)
__always_inline__
__assume_aligned__(a, ## __VA_ARGS__)
__cold__
__const__
__copy__(symbol)
__designated_init__
__externally_visible__
__gnu_inline__
__malloc__
__mode__(x)
__no_caller_saved_registers__
__noclone__
__fallthrough__
__noinline__
__nonstring__
__noreturn__
__pure__
__unused__
__used__

Link: https://lore.kernel.org/linux-kernel-mentees/3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com/
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 105 +++++++++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 36 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7e505688257a..01d83d345b4c 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6155,50 +6155,83 @@ sub process {
 			}
 		}
 
-# Check for __attribute__ packed, prefer __packed
+# Check for compiler attributes
 		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*\bpacked\b/) {
-			WARN("PREFER_PACKED",
-			     "__packed is preferred over __attribute__((packed))\n" . $herecurr);
-		}
+		    $line =~ /__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
+			my $attr = $1;
+			$attr =~ s/\s*\(\s*(.*)\)\s*/$1/;
+
+			my %attr_list = (
+				"alias"				=> "__alias",
+				"aligned"			=> "__aligned",
+				"always_inline"			=> "__always_inline",
+				"assume_aligned"		=> "__assume_aligned",
+				"cold"				=> "__cold",
+				"const"				=> "__const",
+				"copy"				=> "__copy",
+				"designated_init"		=> "__designated_init",
+				"externally_visible"		=> "__visible",
+				"fallthrough"			=> "fallthrough",
+				"gnu_inline"			=> "__gnu_inline",
+				"malloc"			=> "__malloc",
+				"mode"				=> "__mode",
+				"no_caller_saved_registers"	=> "__no_caller_saved_registers",
+				"noclone"			=> "__noclone",
+				"noinline"			=> "noinline",
+				"nonstring"			=> "__nonstring",
+				"noreturn"			=> "__noreturn",
+				"packed"			=> "__packed",
+				"pure"				=> "__pure",
+				"used"				=> "__used"
+			);
+
+			if ($attr =~ /^(\w+)\s*(${balanced_parens})?/) {
+				my $curr_attr = $1;
+				my $params = '';
+				$params = $2 if defined($2);
+				$curr_attr =~ s/^[\s_]+|[\s_]+$//g;
+
+				if (exists($attr_list{$curr_attr})) {
+					my $new = $attr_list{$curr_attr};
+					WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+					     "$new$params is preffered over __attribute__(($attr))\n" . $herecurr);
+				}
+			}
 
-# Check for __attribute__ aligned, prefer __aligned
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*aligned/) {
-			WARN("PREFER_ALIGNED",
-			     "__aligned(size) is preferred over __attribute__((aligned(size)))\n" . $herecurr);
-		}
+			# Check for __attribute__ format(printf, prefer __printf
+			if ($attr =~ /^_*format_*\s*\(\s*printf/) {
+				if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+				         "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
 
-# Check for __attribute__ section, prefer __section
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*_*section_*\s*\(\s*("[^"]*")/) {
-			my $old = substr($rawline, $-[1], $+[1] - $-[1]);
-			my $new = substr($old, 1, -1);
-			if (WARN("PREFER_SECTION",
-				 "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
+				}
 			}
-		}
 
-# Check for __attribute__ format(printf, prefer __printf
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf/) {
-			if (WARN("PREFER_PRINTF",
-				 "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
+			# Check for __attribute__ format(scanf, prefer __scanf
+			if ($attr =~ /^_*format_*\s*\(\s*scanf\b/) {
+				if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+				         "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
+				}
+			}
 
+			# Check for __attribute__ section, prefer __section
+			if ($attr =~ /^_*section_*\s*\(\s*("[^"]*")/) {
+				my $old = substr($rawline, $-[1], $+[1] - $-[1]);
+				my $new = substr($old, 1, -1);
+				if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+				         "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
+				}
 			}
-		}
 
-# Check for __attribute__ format(scanf, prefer __scanf
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\b/) {
-			if (WARN("PREFER_SCANF",
-				 "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
+			# Check for __attribute__ unused, prefer __always_unused or __maybe_unused
+			if ($attr =~ /^_*unused/) {
+				WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+				     "__always_unused or __maybe_unused is preferred over __attribute__((__unused__))\n" . $herecurr);
 			}
 		}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
