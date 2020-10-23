Return-Path: <SRS0=Y4zm=D6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D82AC388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 09:43:38 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1C002192A
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Oct 2020 09:43:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsKdJZlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1C002192A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 510EC2051F;
	Fri, 23 Oct 2020 09:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rEI9ierAeDQ8; Fri, 23 Oct 2020 09:43:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 4BB862050C;
	Fri, 23 Oct 2020 09:43:35 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31518C088B;
	Fri, 23 Oct 2020 09:43:35 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 36DA1C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 09:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 2971C872ED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 09:43:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0x8bbIzJtGfc
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 09:43:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 6F3FC872CC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 09:43:33 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id v22so547034ply.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Oct 2020 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UngXBlnnjkw1Wqy0iVM1SCifmatRfaaY7ktN8yajVH8=;
 b=hsKdJZljvb949NMcBwXlzAFMzOnQO0E0d345EHHx2ybHwi6fBEaftmadcUBDnkrAW1
 p5DR2YFUdKsUgl3uaJNyi8CD+tlNzEG2WoTga60H61CQS1rjY0iboX503QP20EST9MW+
 tNGA5mQlaKD2CVTpXHI9O3ngF/C2W1oMrIFeTLJTmXiTKjRn+HRCXwGo2YnjNIwnadSj
 D3YJm/oELielGv0+d8QB3faYNG8wxcUo6L3z5MI6aFUrGLrX55l7RfMO3pyFETnQ4flb
 90kuhrsF2rhZgyP+wiNO37D8nXaNh1N7B9xHbHHe9i9WPdp7ch189a+4hBTMCby78V1h
 Tn9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UngXBlnnjkw1Wqy0iVM1SCifmatRfaaY7ktN8yajVH8=;
 b=k9XAuIIA1AqND//Qng9OivkeD/WoPGkPEBYu3hGq4lImjyZm1vSM668ZrRZmqdmKoJ
 ayFwmTQogp3n67nUQDyrP/pHlolndhdPLW9+9QWmgVJW6OGuy21qw9bPhufnCBIGavHv
 +vINtOUHeJohB94VIU1QumZIKUWYM3R2T277mMOI/v4bx00jARZabl/DIoyVgohpx53I
 B7olrGbrOI9v21ZZykjAsf1ebmLw25FkdTL0PjexbazivCJ3q60fv9IzTp6cGIxFgrVU
 b3oy39EWhFXWgKniwq/9nvB18VM4BQ0FE2gwGsX+iRmkM4HriTmljG94Dw8Z5EH1EnQ0
 HExQ==
X-Gm-Message-State: AOAM531Bunly8VKLaMkUdZnLvikYYNuPEpylnTIaoUp/PE0pUlVfFV9h
 FzqrbkLIJJJKa9u4oqAU5hs=
X-Google-Smtp-Source: ABdhPJxzmYn1mKMJ6BRjBP3kJxc+8BMvcD6T6TZUD/0ODubNTlQ0ryH8aPRUEa/BZsrAvdRpJD5IoQ==
X-Received: by 2002:a17:902:7c0d:b029:d3:de09:a3 with SMTP id
 x13-20020a1709027c0db02900d3de0900a3mr1639764pll.52.1603446212846; 
 Fri, 23 Oct 2020 02:43:32 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:6890:ae4b:a0f8:1bbb:ec51])
 by smtp.gmail.com with ESMTPSA id bx24sm1756775pjb.20.2020.10.23.02.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 02:43:32 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Fri, 23 Oct 2020 15:13:07 +0530
Message-Id: <20201023094307.20820-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH RFC v2] checkpatch: extend attributes
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

Checkpatch currently checks __attribute__ for each of
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
 scripts/checkpatch.pl | 130 ++++++++++++++++++++++++++++++------------
 1 file changed, 94 insertions(+), 36 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7e505688257a..69324c2e55d6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6155,50 +6155,108 @@ sub process {
 			}
 		}
 
-# Check for __attribute__ packed, prefer __packed
+# Check for compiler attributes
 		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*\bpacked\b/) {
-			WARN("PREFER_PACKED",
-			     "__packed is preferred over __attribute__((packed))\n" . $herecurr);
-		}
+		    $line =~ /\b__attribute__\s*\(\s*\((.*)\)\s*\)/) {
+			my $attr = trim($1);
+
+			my $attr_list = qr {
+				__alias__|
+				__aligned__$|
+				__aligned__\(.*\)|
+				__always_inline__|
+				__assume_aligned__\(.*\)|
+				__cold__|
+				__const__|
+				__copy__\(.*\)|
+				__designated_init__|
+				__externally_visible__|
+				__fallthrough__|
+				__gnu_inline__|
+				__malloc__|
+				__mode__\(.*\)|
+				__no_caller_saved_registers__|
+				__noclone__|
+				__noinline__|
+				__nonstring__|
+				__noreturn__|
+				__packed__|
+				__pure__|
+				__used__
+			}x;
 
-# Check for __attribute__ aligned, prefer __aligned
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*aligned/) {
-			WARN("PREFER_ALIGNED",
-			     "__aligned(size) is preferred over __attribute__((aligned(size)))\n" . $herecurr);
-		}
+			my %attr_replace = (
+				"__alias__"			=> "__alias",
+				"__aligned__"		=> "__aligned_largest",
+				"__aligned__("		=> "__aligned",
+				"__always_inline__" 	=> "__always_inline",
+				"__assume_aligned__("	=> "__assume_aligned",
+				"__cold__"			=> "__cold",
+				"__const__"			=> "__const",
+				"__copy__("			=> "__copy",
+				"__designated_init__"		=> "__designated_init",
+				"__externally_visible__"	=> "__visible",
+				"__fallthrough__"		=> "fallthrough",
+				"__gnu_inline__"		=> "__gnu_inline",
+				"__malloc__"		=> "__malloc",
+				"__mode__("			=> "__mode",
+				"__no_caller_saved_registers__" => "__no_caller_saved_registers",
+				"__noclone__"		=> "__noclone",
+				"__noinline__"		=> "noinline",
+				"__nonstring__"		=> "__nonstring",
+				"__noreturn__"		=> "__noreturn",
+				"__packed__"		=> "__packed",
+				"__pure__"			=> "__pure",
+				"__used__"			=> "__used"
+			);
+
+			if ($attr =~/^($attr_list)/) {
+				my $old = $1;
+				if ($old =~ /^(__.+__\()(.*)\)/) {
+					my $new = $attr_replace{$1};
+					WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+					     "$new($2) is preffered over __attribute__(($old))\n" . $herecurr);
+				} else {
+					my $new = $attr_replace{$old};
+					WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+					     "$new is preffered over __attribute__(($old))\n" . $herecurr);
+				}
+			}
 
-# Check for __attribute__ section, prefer __section
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*_*section_*\s*\(\s*("[^"]*")/) {
-			my $old = substr($rawline, $-[1], $+[1] - $-[1]);
-			my $new = substr($old, 1, -1);
-			if (WARN("PREFER_SECTION",
-				 "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
+			# Check for __attribute__ format(printf, prefer __printf
+			if ($attr =~ /^_*format_*\s*\(\s*printf/) {
+				if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+				         "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
+
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
+			if ($attr =~ /^_*unused_*/) {
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
