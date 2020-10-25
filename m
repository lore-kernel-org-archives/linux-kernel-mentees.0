Return-Path: <SRS0=kzO3=EA=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D974CC4363A
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 06:52:10 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 19F4220A8B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 25 Oct 2020 06:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYwDecot"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 19F4220A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 9EF3C2740C;
	Sun, 25 Oct 2020 06:52:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CsYrgwoO6IwD; Sun, 25 Oct 2020 06:52:06 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 6A46A27400;
	Sun, 25 Oct 2020 06:52:06 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5305DC0859;
	Sun, 25 Oct 2020 06:52:06 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 279F3C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0E8F98694B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:52:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id laiHVfgLGA7U
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:52:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 804A9868FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 25 Oct 2020 06:52:03 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r10so4180083pgb.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Oct 2020 23:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCPmgUWprMxajeTKkhQ9CgmDvrrA7j8uD3bhsde/MbU=;
 b=IYwDecotTzxO2siq7u3wM71/vTJC+82XhIraXU+X7MEVjhMhWY1zditCoDJL0LVf6C
 iPsnH4ygRIQyLL40JAZ8z5OK954c8XiTIcLVIArD3zeOAnLaCjYZ98keJnqARfHp78Dg
 y2+6gUQh26OxSihYEh0Weim56uZeGxmmgyI6fFTsabkJKhIA+Wd1EHRtuVTHEEXMIS7F
 4IJQlNDUIYhkm+AyCyNCirKTN54EiyaPDFTqUBNTCebFbnSf+b1PnotRXzsdn9Ki6A2q
 M/HRcyDfMacG/qtS+Nn/jRGcSf5Xeu9rOZ0fcgm30GxZrvONlJAcb82o1AV5bp8xcs3J
 FrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bCPmgUWprMxajeTKkhQ9CgmDvrrA7j8uD3bhsde/MbU=;
 b=OZJj+pBBuJWYdteCYiz/PCNYNPrb/oFMQJ2TCchOuLjEfo9yaD/WjmjdSa0h7kBwwq
 WQuC61zU3alZHUqrUtwMIVdMACiPfoXbsqxMU2oKilX7J/RH6U/aEK7JAvJaWWVAdTa4
 XjiHjwKL872Scatqx5GjeoZZXUkZtjOgvs+bi5d1wRlsqJ9Ku09f2q4LOhoLhsXr8Sho
 64Ckdvckv9Nxy4pe0sxFJ+GOEC1VL2MFOMTKX/J3yKixXlpCczCCjnNX0rEBWR96jaV4
 Yf+N+50qrAGQYI6KTx8B9HWmHVwyTbrYd0TPgU3ORcq5FE621jN5GVPIwEDVTOXtnYCZ
 fq5Q==
X-Gm-Message-State: AOAM530ANAxE7/lGxk+sPtCx1tEF3qD7zcJPrc8VuX8LEs5flqMqP419
 iIyZ/BH0K1SwF0S8jdshQ4o=
X-Google-Smtp-Source: ABdhPJyv9shsaS1JzUANl3TORQcoxGd3nAbEcQlwQbgr9dbsVm4Lcse/yfT9icwU5/P0H4cdt42Keg==
X-Received: by 2002:a63:180f:: with SMTP id y15mr8629523pgl.324.1603608722873; 
 Sat, 24 Oct 2020 23:52:02 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:60a7:4fb7:1d05:966d:919e])
 by smtp.gmail.com with ESMTPSA id o15sm8326691pfd.16.2020.10.24.23.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2020 23:52:02 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Sun, 25 Oct 2020 12:21:34 +0530
Message-Id: <20201025065134.21737-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: extend attributes
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
__noinline__
__nonstring__
__noreturn__
__pure__
__unused__
__used__

Also add fixes for the generic attributes check.

Link: https://lore.kernel.org/linux-kernel-mentees/3ec15b41754b01666d94b76ce51b9832c2dd577a.camel@perches.com/
Suggested-by: Joe Perches <joe@perches.com>
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 107 ++++++++++++++++++++++++++++--------------
 1 file changed, 71 insertions(+), 36 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7e505688257a..1b736e9042d2 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6155,50 +6155,85 @@ sub process {
 			}
 		}
 
-# Check for __attribute__ packed, prefer __packed
+# Check for compiler attributes
 		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*\bpacked\b/) {
-			WARN("PREFER_PACKED",
-			     "__packed is preferred over __attribute__((packed))\n" . $herecurr);
-		}
+		    $rawline =~ /\b__attribute__\s*\(\s*($balanced_parens)\s*\)/) {
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
+					if (WARN("PREFER_DEFINED_ATTRIBUTE_MACRO",
+					         "$new$params is preferred over __attribute__(($attr))\n" . $herecurr) &&
+						$fix) {
+						$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*\Q$attr\E\s*\)\s*\)/$new$params/;
+					}
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
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*format_*\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
 
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
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*format_*\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
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
