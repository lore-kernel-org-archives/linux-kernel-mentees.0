Return-Path: <SRS0=G515=D5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716E1C388F7
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 12:48:11 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DE45B22267
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Oct 2020 12:48:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LesCpGBq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE45B22267
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4BF8187463;
	Thu, 22 Oct 2020 12:48:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNUCap1jIVpP; Thu, 22 Oct 2020 12:48:08 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id B5818872D4;
	Thu, 22 Oct 2020 12:48:08 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9CFCAC0052;
	Thu, 22 Oct 2020 12:48:08 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A61FC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 7070187061
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:48:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iumGdaAJrDsJ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:48:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 88EEF8705F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 12:48:06 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y1so892927plp.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Oct 2020 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V+Nru7pUaBada8hmqbJrp9Lo/ckSZaisaJljQP8XXzc=;
 b=LesCpGBqB9gijvigruEVlwQARsEiuLg0ay2hKkC11jHSq7SvaaPKqL9Rgj2g0QU5aW
 PVqctv2i/IFEUn5PL7zmp4TaHL2j4MhlaNaSQijCo2fNNKz+n6HCvUt6YuycGlPBoCGk
 oXEv98J+LK+KKwmEO6yiIyBOkMRl+Sz60IL9G/hq+Y/0KfgxVILlpdZwU35Y3oYdUmMA
 I8zO33Hm4QFEjHwbcGPAMh2ySCq3JOpfclz9f2FLPUkrxsH62GaERXY4l+EjvZXpb6eV
 Xu6QWqQ/trqAtctuw4S5jDPKOeIO3tCAhL980iVnjIcddFckFnYUyi5P9fhbGSQ4uM1h
 z0rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V+Nru7pUaBada8hmqbJrp9Lo/ckSZaisaJljQP8XXzc=;
 b=DJ9q0vla1vbOJ5K74sbfcISe11ss8j3d6fgsSRSGoytWXJFIeLwuG6VbluhhtxgZxY
 +kR7yWRsLI7+PqsA98xDVgQ5EFw3rJWYJJFDwGlCk6KvONleXzOZnhqnqGIBEAnsaWIl
 u+85MiBP+rWxfyG/BhR4KGEqJBNLU47hUaAkMKhQu9f1DhPMruHxWx+7FHxcmbyuWGbN
 4I8yy8r/1bQN4HBX06/rWnNwYn/9k9cXFTO9XDeVUVBqvbhWL96PqQ+yDrniu1P1/gE6
 JjLXFhdh5BsgSRkVEtdnwLcgUbdORQCxPic+k1GCcoPCldzAkLIZCZ6fiNG5xyMFanXc
 pALw==
X-Gm-Message-State: AOAM533FaxiRKA+2AnHPWFLBGHJ2gL8v5pjLxo/elMOpKCjPC+izld4m
 DUbBDrJoQ+C1Mak3jHeWVHcPdzEvfu0gZlbR
X-Google-Smtp-Source: ABdhPJwu1su38kQm5gzoqzHrnqrxtQkMqml+K05J6DEGh+D0BLZoDeocGs+VOiGF7oErK8S2QziY3w==
X-Received: by 2002:a17:902:423:b029:d5:f967:86fe with SMTP id
 32-20020a1709020423b02900d5f96786femr2316889ple.55.1603370885736; 
 Thu, 22 Oct 2020 05:48:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:68cc:70a3:ea5f:217b:100f])
 by smtp.gmail.com with ESMTPSA id g85sm2302187pfb.4.2020.10.22.05.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Oct 2020 05:48:05 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Thu, 22 Oct 2020 18:17:41 +0530
Message-Id: <20201022124741.620334-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH RFC] checkpatch: extend attributes
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

Add more definitions to the attribute check.
The following patterns are added:

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
Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 199 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 163 insertions(+), 36 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7e505688257a..869d9b2801cd 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6155,50 +6155,177 @@ sub process {
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
 
-# Check for __attribute__ aligned, prefer __aligned
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(.*aligned/) {
-			WARN("PREFER_ALIGNED",
-			     "__aligned(size) is preferred over __attribute__((aligned(size)))\n" . $herecurr);
-		}
+			# Check for __attribute__ alias, prefer __alias
+			if ($attr =~/^_*alias_*/) {
+				WARN("PREFER_ALIAS",
+				     "__alias(symbol) is preferred over __attribute__((alias(#symbol)))\n" . $herecurr);
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
+			# Check for __attribute__ aligned(size), prefer __aligned(size)
+			if ($attr =~/^_*aligned_*\(/) {
+				WARN("PREFER_ALIGNED",
+				     "__aligned(size) is preferred over __attribute__((__aligned__(size)))\n" . $herecurr);
 			}
-		}
 
-# Check for __attribute__ format(printf, prefer __printf
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf/) {
-			if (WARN("PREFER_PRINTF",
-				 "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
+			# Check for __attribute__ aligned, prefer __aligned_largest
+			if ($attr =~/^_*aligned_*$/) {
+				WARN("PREFER_ALIGNED_LARGEST",
+				     "__aligned_largest is preferred over __attribute__((__aligned__))\n" . $herecurr);
+			}
 
+			# Check for __attribute__ always_inline, prefer __always_inline
+			if ($attr =~/^_*always_inline_*/) {
+				WARN("PREFER_ALWAYS_INLINE",
+				     "__always_inline is preferred over __attribute__((__always_inline__))\n" . $herecurr);
 			}
-		}
 
-# Check for __attribute__ format(scanf, prefer __scanf
-		if ($realfile !~ m@\binclude/uapi/@ &&
-		    $line =~ /\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\b/) {
-			if (WARN("PREFER_SCANF",
-				 "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
-			    $fix) {
-				$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
+			# Check for __attribute__ assume_aligned, prefer __assume_aligned
+			if ($attr =~/^_*assume_aligned_*/) {
+				WARN("PREFER_ASSUME_ALIGNED",
+				     "__asume_aligned(a, ...) is preferred over __attribute__((__assume_aligned__(a, ## __VA_ARGS__)))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ cold, prefer __cold
+			if ($attr =~ /^_*cold_*/) {
+				WARN("PREFER_COLD",
+				     "__cold is preferred over __attribute__((__cold__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ const, prefer __attribute_const
+			if ($attr =~ /^_*const_*/) {
+				WARN("PREFER_CONST",
+				     "__attribute_const is preferred over __attribute__((__const__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ copy, prefer __copy
+			if ($attr =~ /^_*copy_*/) {
+				WARN("PREFER_COPY",
+				     "__copy(symbol) is preferred over __attribute__((__copy__(symbol)))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ desginated_init, prefer __designated_init
+			if ($attr =~ /^_*designated_init_*/) {
+				WARN("PREFER_DESIGNATED_INIT",
+				     "__designated_init is preferred over __attribute__((__designated_init__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ externally_visible, prefer __visible
+			if ($attr =~ /^_*externally_visible_*/) {
+				WARN("PREFER_VISIBLE",
+				     "__visible is preferred over __attribute__((__externally_visible__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ format(printf, prefer __printf
+			if ($attr =~ /^_*format_*\s*\(\s*printf/) {
+				if (WARN("PREFER_PRINTF",
+					     "__printf(string-index, first-to-check) is preferred over __attribute__((format(printf, string-index, first-to-check)))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*printf\s*,\s*(.*)\)\s*\)\s*\)/"__printf(" . trim($1) . ")"/ex;
+
+				}
+			}
+
+			# Check for __attribute__ format(scanf, prefer __scanf
+			if ($attr =~ /^_*format_*\s*\(\s*scanf\b/) {
+				if (WARN("PREFER_SCANF",
+					     "__scanf(string-index, first-to-check) is preferred over __attribute__((format(scanf, string-index, first-to-check)))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*format\s*\(\s*scanf\s*,\s*(.*)\)\s*\)\s*\)/"__scanf(" . trim($1) . ")"/ex;
+				}
+			}
+
+			# Check for __attribute__ gnu_inline, prefer __gnu_inline
+			if ($attr =~ /^_*gnu_inline_*/) {
+				WARN("PREFER_GNU_INLINE",
+				     "__gnu_inline is preferred over __attribute__((__gnu_inline__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ malloc, prefer __malloc
+			if ($attr =~ /^_*malloc_*/) {
+				WARN("PREFER_MALLOC",
+				     "__malloc is preferred over __attribute__((__malloc__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ mode, prefer __mode
+			if ($attr =~ /^_*mode_*/) {
+				WARN("PREFER_MODE",
+				     "__mode(x) is preferred over __attribute__((__mode__(x)))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ no_caller_saved_registers, prefer __no_caller_saved_registers
+			if ($attr =~ /^_*no_caller_saved_registers_*/) {
+				WARN("PREFER_NO_CALLER_SAVED_REGISTERS",
+				     "__no_caller_saved_registers is preferred over __attribute__((__no_caller_saved_registers__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ noclone, prefer __noclone
+			if ($attr =~ /^_*noclone_*/) {
+				WARN("PREFER_NOCLONE",
+				     "__noclone is preferred over __attribute__((__noclone__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ fallthrough, prefer fallthrough
+			if ($attr =~ /^_*fallthrough_*/) {
+				WARN("PREFER_FALLTHROUGH",
+				     "fallthrough is preferred over __attribute__((__fallthrough__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ noinline, prefer noinline
+			if ($attr =~ /^_*noinline_*/) {
+				WARN("PREFER_NOINLINE",
+				     "noinline is preferred over __attribute__((__noinline__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ nonstring, prefer __nonstring
+			if ($attr =~ /^_*nonstring_*/) {
+				WARN("PREFER_NONSTRING",
+				     "__nonstring is preferred over __attribute__((__nonstring__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ noreturn, prefer __noreturn
+			if ($attr =~ /^_*noreturn_*/) {
+				WARN("PREFER_NORETURN",
+				     "__noreturn is preferred over __attribute__((__noreturn__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ packed, prefer __packed
+			if ($attr =~ /^_*packed_*/) {
+				WARN("PREFER_PACKED",
+				     "__packed is preferred over __attribute__((__packed__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ pure, prefer __pure
+			if ($attr =~ /^_*pure_*/) {
+				WARN("PREFER_PURE",
+				     "__pure is preferred over __attribute__((__pure__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ section, prefer __section
+			if ($attr =~ /^_*section_*\s*\(\s*("[^"]*")/) {
+				my $old = substr($rawline, $-[1], $+[1] - $-[1]);
+				my $new = substr($old, 1, -1);
+				if (WARN("PREFER_SECTION",
+					     "__section($new) is preferred over __attribute__((section($old)))\n" . $herecurr) &&
+					$fix) {
+					$fixed[$fixlinenr] =~ s/\b__attribute__\s*\(\s*\(\s*_*section_*\s*\(\s*\Q$old\E\s*\)\s*\)\s*\)/__section($new)/;
+				}
+			}
+
+			# Check for __attribute__ unused, prefer __always_unused or __maybe_unused
+			if ($attr =~ /^_*unused_*/) {
+				WARN("PREFER_UNUSED",
+				     "__always_unused or __maybe_unused is preferred over __attribute__((__unused__))\n" . $herecurr);
+			}
+
+			# Check for __attribute__ used, prefer __used
+			if ($attr =~ /^_*used_*/) {
+				WARN("PREFER_USED",
+				     "__used is preferred over __attribute__((__used__))\n" . $herecurr);
 			}
 		}
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
