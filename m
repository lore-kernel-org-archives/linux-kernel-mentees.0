Return-Path: <SRS0=j5Lk=GI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0479EC433E6
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:31:00 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3B022510
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  5 Jan 2021 10:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3B022510
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E2CFF870AA;
	Tue,  5 Jan 2021 10:30:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sO59GvJLW33; Tue,  5 Jan 2021 10:30:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3738287021;
	Tue,  5 Jan 2021 10:30:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 233C7C088B;
	Tue,  5 Jan 2021 10:30:58 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D33EAC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:30:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 75C7820C92
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:30:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6k5F2ClFHmAL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:30:55 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by silver.osuosl.org (Postfix) with ESMTPS id BDF0B203AB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  5 Jan 2021 10:30:55 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id h10so17185091pfo.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 05 Jan 2021 02:30:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOojekCLE+4Atuf8MN71Y5EpXTyBJ2znW4hlDZL8IH4=;
 b=bKm0vL6L1Ve9NQJdR7LY/I+t1icUkSlPpuDCJ68FFziNnxO3wL5KGt1oHSpr9/NvhK
 EuCp1xDs9/8i5XvMCY4PXlqwMFdKmM5g4wJMu9WykpzGbla6Th+Duh0GnKP5FGHrGT/A
 L/MX/ft3iIQIuvytT6O5uGRSKnsJ2oHFQ4fyLFyfJTa6P6Qc7B33nKUXXSXDb1SYz6Rg
 2uhILMYWi6XzeEfCMdAaCmpn5FtY9lgWGr09youhHJ/mrbwMlas9oNPqcSzsmTrjUiN/
 EVQckCuc0hSxSSxbZI1KrD9VtNg03GF5PPWMa282c8rxFQfw7Br0we2h2uezCcFJ06w8
 BwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SOojekCLE+4Atuf8MN71Y5EpXTyBJ2znW4hlDZL8IH4=;
 b=NtFVMjymbEvjV04DTYZNn03uPzUIgk+wQYzknhu/c1JBIqXhIBZicACcSDCf4A3mr6
 foIpqit/ROKi2GVgOfjPEgcS4vRHRFj9CIh4vlinmaGrVYLaK4RYWSKsSKWXd5c4/Woa
 CBREseuST8Jgl+YsSoh0enGyPfHczUtKHfmNG77oy09jqeeVrt/TbOMrswTvHxhDgB6P
 xSIMpTtnuSbAtadKnDp1QkwKn8tqdSBbmdf5c05u9kombDahhQENeXFB3DmCngD4cmrm
 1kiELFnw1mlSSIT2svP4+1DK9h1BVupwM6tOXEiqyS8mtGhbguOfBgMnNkvd6gMIK3Qj
 p/ww==
X-Gm-Message-State: AOAM532W24wsWpR7t5zELrdgrXnb+6EsDYfEB72lix+c57/aZuHM6UkR
 l/mOXZuzLt2M8nbU91Cjlic=
X-Google-Smtp-Source: ABdhPJwRcUvo+0ys1WB5CPikSOVzKFkWviWPT9C4p/hsmhIVroDtu2zJNL8mMsCwgUtnS0YboZRiqw==
X-Received: by 2002:aa7:8811:0:b029:1ab:9e4f:b8ea with SMTP id
 c17-20020aa788110000b02901ab9e4fb8eamr65734067pfo.78.1609842655141; 
 Tue, 05 Jan 2021 02:30:55 -0800 (PST)
Received: from localhost.localdomain ([2405:201:9004:6064:97d:44da:5ae4:7c76])
 by smtp.gmail.com with ESMTPSA id
 w1sm2284345pjt.23.2021.01.05.02.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 02:30:54 -0800 (PST)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: joe@perches.com
Date: Tue,  5 Jan 2021 16:00:44 +0530
Message-Id: <20210105103044.40282-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: trivial style fixes
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

Indentations should use tabs wherever possible.
Replace spaces by tabs for indents.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e6857bdfcb2d..7a323ca8a177 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2974,7 +2974,7 @@ sub process {
 				}
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_SIGN_OFF",
-                                             "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
+					     "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline);
 				} elsif ($rawlines[$linenr] !~ /^\s*signed-off-by:\s*(.*)/i) {
 					WARN("BAD_SIGN_OFF",
 					     "Co-developed-by: must be immediately followed by Signed-off-by:\n" . "$here\n" . $rawline . "\n" .$rawlines[$linenr]);
@@ -2997,8 +2997,8 @@ sub process {
 			if (ERROR("GERRIT_CHANGE_ID",
 			          "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
 			    $fix) {
-                                fix_delete_line($fixlinenr, $rawline);
-                        }
+				fix_delete_line($fixlinenr, $rawline);
+			}
 		}
 
 # Check if the commit log is in a possible stack dump
@@ -3240,10 +3240,10 @@ sub process {
 				next if ($start_char =~ /^\S$/);
 				next if (index(" \t.,;?!", $end_char) == -1);
 
-                                # avoid repeating hex occurrences like 'ff ff fe 09 ...'
-                                if ($first =~ /\b[0-9a-f]{2,}\b/i) {
-                                        next if (!exists($allow_repeated_words{lc($first)}));
-                                }
+				# avoid repeating hex occurrences like 'ff ff fe 09 ...'
+				if ($first =~ /\b[0-9a-f]{2,}\b/i) {
+					next if (!exists($allow_repeated_words{lc($first)}));
+				}
 
 				if (WARN("REPEATED_WORD",
 					 "Possible repeated word: '$first'\n" . $herecurr) &&
@@ -4432,7 +4432,7 @@ sub process {
 			WARN("STATIC_CONST_CHAR_ARRAY",
 			     "char * array declaration might be better as static const\n" .
 				$herecurr);
-               }
+		}
 
 # check for sizeof(foo)/sizeof(foo[0]) that could be ARRAY_SIZE(foo)
 		if ($line =~ m@\bsizeof\s*\(\s*($Lval)\s*\)@) {
@@ -5285,7 +5285,7 @@ sub process {
 		    $lines[$linenr - 3] !~ /^[ +]\s*$Ident\s*:/) {
 			WARN("RETURN_VOID",
 			     "void function return statements are not generally useful\n" . $hereprev);
-               }
+		}
 
 # if statements using unnecessary parentheses - ie: if ((foo == bar))
 		if ($perl_version_ok &&
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
