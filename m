Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 001B9C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 19:31:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F63D20885
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 19:31:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dt/6Omgg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F63D20885
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 0AF7F85F8B;
	Sun, 25 Oct 2020 19:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ddq0UNDrBWyl; Sun, 25 Oct 2020 19:31:41 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F1F885EC2;
	Sun, 25 Oct 2020 19:31:41 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 24686C088B;
	Sun, 25 Oct 2020 19:31:41 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BA0A0C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 19:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id A5523865E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 19:31:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WM+hWrMx0mUu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 19:31:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 97C9A85FED
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 19:31:38 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id k8so852938pjd.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 12:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw7Y/6Dgm4OYeBVasv5zxdWpIx2iMbuxYOG+poUDizA=;
 b=Dt/6OmggmVain+OMmgWnDGmts50vmpoONv/GXrQSVmwwqflhWG3Pstnv60aSeqxKer
 +AU0JOpQ4rjj3hdUclYPJQw09rbLzulYyHTAH2a6QxFx92onHsIk1XDEPtb/SdLLdVBC
 6HlyNPtY3SFIXnO7uCa2c/XKushWCbcIpFCD5HPsAQNkrUwVAkJWGTHgph0bvJJNxO2T
 rq7qTRFuBdd9qQow36WA67YBgT5Eg+jMgFuNcBDbgjWZ658effWIP2ePWwa5m/ZBU/oX
 ndRy6e1WQ0U9hYNf4A4f/hb8R00HwOjfpwrPM77XWxb72WQr62uqoEe7dU3Ke16R8sIV
 9v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bw7Y/6Dgm4OYeBVasv5zxdWpIx2iMbuxYOG+poUDizA=;
 b=pb4OZk+lXdDF7dJuL3d0ED1BSz1UOCHxVvoC7vgbpDp9Sj0RdLCgFilSms6JuwtEbB
 +jaeH6FzPUNgytV81SX6z4ncsBnB08+S5xKrgE4+C8vIscN7LYEensZpMYwXqCPv5jiV
 YgoX5YGIGsRHT/4saulh9UFWd/fq8kAnIt6kszKpvAj1H+/+gHte6ij8h6mTB/H1bwQs
 7+bfXgpZjxbWELu0oM4p6knBaG6BeB/XTtFzTpPP7OTPiTWJjiKVpOWbdjOweXsTaaDk
 EMJqDkuPW69mkyg0O08Ydo9jb7yC5b65JKI7s+jiDXnZ3+93fpq5RCn6sn3pS4n3Arvv
 LTag==
X-Gm-Message-State: AOAM533uq2Cb96UEx9Lvf/csmvP9kkAKsvPxWry9W9as5EZyLw4411Up
 rG7dxBmMQRmJlKLF/E7zICo=
X-Google-Smtp-Source: ABdhPJw1e3wt23zR+nz/7Q1vklcBM98Xwp9KKXavRanVu+EjWmn5U3NpqvaicRAN7cc0Orz2UiDA9g==
X-Received: by 2002:a17:90a:ee98:: with SMTP id
 i24mr7772849pjz.205.1603654297944; 
 Sun, 25 Oct 2020 12:31:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:60a7:4fb7:1d05:966d:919e])
 by smtp.gmail.com with ESMTPSA id j5sm9939228pjb.56.2020.10.25.12.31.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 12:31:37 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Mon, 26 Oct 2020 01:01:03 +0530
Message-Id: <20201025193103.23223-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v6] checkpatch: extend attributes
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
packed, aligned, section, printf, scanf, and weak. Other
declarations in compiler_attributes.h are not handled.

Add a generic test to check the presence of such attributes.
Some attributes require more specific handling and are kept
separate.

Also add fixes to the generic attributes check to substitute
the correct conversions.

New attributes which are now handled are:

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
__noinline__
__nonstring__
__noreturn__
__pure__
__unused__
__used__

Declarations which contain multiple attributes like
__attribute__((__packed__, __cold__)) are also handled except
when proper conversions for one or more attributes of the list
cannot be determined.

Link: https://lore.kernel.org/linux-kernel-mentees/3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com/
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 109 +++++++++++++++++++++++++++---------------
 1 file changed, 71 insertions(+), 38 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7e505688257a..eeebd8149be9 100755
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
-
-# Check for __attribute__ aligned, prefer __aligned
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*aligned/) {
-			WARN("PREFER_ALIGNED",
-			     "__aligned(size) is preferred over __attribute__((aligned(size)))\n" . $herecurr);
-		}
-
-# Check for __attribute__ section, prefer __section
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*_*section_*\s*\(\s*("[^"]*")/) {
-			my $old = substr($rawline, $-[1], $+[1] - $-[1]);
-			my $new = substr($old, 1, -1);
-			if (WARN("PREFER_SECTION",
-				 "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
+		    $rawline =~ /\b__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
+			my $attr = $1;
+			$attr =~ s/\s*\(\s*(.*)\)\s*/$1/;
+
+			my %attr_list = (
+				"aligned"			=> "__aligned",
+				"always_inline"			=> "__always_inline",
+				"assume_aligned"		=> "__assume_aligned",
+				"cold"				=> "__cold",
+				"const"				=> "__attribute_const__",
+				"copy"				=> "__copy",
+				"designated_init"		=> "__designated_init",
+				"externally_visible"		=> "__visible",
+				"format"			=> "printf|scanf",
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
+			my @conv_array = ();
+			my $conv_possible = 1;
+
+			while ($attr =~ /\s*(\w+)\s*(${balanced_parens})?/g) {
+				my $curr_attr = $1;
+				my $params = '';
+				$params = $2 if defined($2);
+				$curr_attr =~ s/^[\s_]+|[\s_]+$//g;
+
+				if (exists($attr_list{$curr_attr})) {
+					if ($curr_attr eq "format" && $params) {
+						$params =~ /^\s*\(\s*(\w+)\s*,\s*(.*)/;
+						push(@conv_array, "__$1\($2");
+					} else {
+						my $new = $attr_list{$curr_attr};
+						push(@conv_array, "$new$params");
+					}
+				} else {
+					$conv_possible = 0;
+					last;
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
+			if (scalar @conv_array > 0 && $conv_possible == 1) {
+				my $replace = join(' ', @conv_array);
+				if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+				         "$replace is preferred over __attribute__(($attr))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*\Q$attr\E\s*\)\s*\)/$replace/;
+					$fixed[$fixlinenr] =~ s/\}\Q$replace\E/} $replace/;
+				}
+			}
 
+			# Check for __attribute__ section, prefer __section
+			if ($attr =~ /^_*section_*\s*\(\s*("[^"]*")/) {
+				my $old = substr($attr, $-[1], $+[1] - $-[1]);
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
