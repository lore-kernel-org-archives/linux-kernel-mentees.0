Return-Path: <SRS0=Gcau=G2=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDEF5C433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 19:06:06 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 76A4122B4E
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 23 Jan 2021 19:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 76A4122B4E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 146922049E;
	Sat, 23 Jan 2021 19:06:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEEq3s1DQDH9; Sat, 23 Jan 2021 19:06:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 79C8C2013C;
	Sat, 23 Jan 2021 19:06:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4F5ECC08A1;
	Sat, 23 Jan 2021 19:06:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C7145C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 19:06:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id A4F9687310
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 19:06:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V7eVApt-y5NI
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 19:06:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 93EDD8701C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 19:06:01 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id 30so6163025pgr.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 23 Jan 2021 11:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mzZg7viznpPW9SNKKzGUUY3fkPMxKyXqQG2BhjhBWW4=;
 b=K6fh6gdLRuB22vj3PYFX/FhCAWroNIJs2DV7WgnNY52nneKQf3SSssNRfNWTkgAeBh
 fDY1iPfJOg6ITqLcTeXqgjl3B5B6RORl4rZfFA21sBm0llst6mrjbqkKnL9NUMMy8/ee
 etrynJ6ieCdaO52TgHO1OnkimMAJ6NZWDqV/HUxp1tqWFdQ0P7jpJ0cEDaMiFLu58NEi
 PsXarqKn+KwqrN7ary1sf8XlfuxeeSfFMyJK1cEC8dIqeFinkUeksHmpZa2edZ4uTAsF
 SxgDKr524wrw6KA93L8G3RFXjJ2zFg9/COAA7cPB5qoumB5gP2JA/zGmKuhLiasVhrUl
 fGRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mzZg7viznpPW9SNKKzGUUY3fkPMxKyXqQG2BhjhBWW4=;
 b=iP4BDvUvM8RMnfp3lTQAv1dLdedv6B9DD+RcAhZuV47OSQmlNMUEAMfK1goQ0ESyDl
 xPS5wPjQQZLaAC9E6uqefp9uH7EKkX1nFh6leqYT5v+MpQsjFpkZmsaXMeqJr55hHSlY
 6L7r9LXmlJMZnv4oCYvm/xP0HFcxEm8HyRI2SeJ8whLN3t8XWwNSw9sILMe1T+koC8zf
 RR7FEMa7KdJydV3hM+S3p5JkfSkeyFPgHQMP6AA18jLZLLt5OVCwBUVZVEp/GvU3P3Hn
 77u2EFMvWjfyDiSFVc9JxHmf+ICnFWfPeYfXKUhazu6JY637G9KIS5aXLL0GE4MPvkvw
 ZUFw==
X-Gm-Message-State: AOAM5303Otso6QRWrJbUIKjfHSjmLW7P+mpbgO/ucawpouOMsYorVOyW
 e8/8/duijDzI/063rRKhVWY=
X-Google-Smtp-Source: ABdhPJz7C1AJJPuFSxibuxFN3GfHArq09cTmE6ZISuKx25crKnNZ14ljLvQW30Dgl7HeAKeWPXlfSQ==
X-Received: by 2002:a63:2009:: with SMTP id g9mr1055989pgg.219.1611428761067; 
 Sat, 23 Jan 2021 11:06:01 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:8c2b:8940:3286:eb08])
 by smtp.googlemail.com with ESMTPSA id t8sm12524465pjm.45.2021.01.23.11.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Jan 2021 11:06:00 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sun, 24 Jan 2021 00:34:59 +0530
Message-Id: <20210123190459.9701-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <f23f4003-0017-d52a-39b9-2737e60182bb@gmail.com>
References: <f23f4003-0017-d52a-39b9-2737e60182bb@gmail.com>
Cc: yashsri421@gmail.com, dwaipayanray1@gmail.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 broonie@kernel.org, jpoimboe@redhat.com,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add warning for
	avoiding .L prefix symbols in assembly files
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

objtool requires that all code must be contained in an ELF symbol.
Symbol names that have a '.L' prefix do not emit symbol table entries, as
they have special meaning for the assembler.

'.L' prefixed symbols can be used within a code region, but should be
avoided for denoting a range of code via 'SYM_*_START/END' annotations.

Add a new check to emit a warning on finding the usage of '.L' symbols
for '.S' files, if it denotes range of code via SYM_*_START/END
annotation pair.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
* Applies perfectly on next-20210122

Changes in v3:
- Modify regex for SYM_*_START/END pair
- remove check for arch/x86/entry/* and arch/x86/lib/*
- change 'Link:' in commit message to lkml
- Modify commit description accordingly

Changes in v2:
- Reduce the check to only SYM_*_START/END lines
- Reduce the check for only .S files in arch/x86/entry/* and arch/x86/lib/* as suggested by Josh and Nick
- Modify commit message

 scripts/checkpatch.pl | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7030c4d6d126..4a03326c87b6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3590,6 +3590,13 @@ sub process {
 			}
 		}
 
+# check for .L prefix local symbols in .S files
+		if ($realfile =~ /\.S$/ &&
+		    $line =~ /^\+\s*(?:[A-Z]+_)?SYM_[A-Z]+_(?:START|END)(?:_[A-Z_]+)?\s*\(\s*\.L/) {
+			WARN("AVOID_L_PREFIX",
+			     "Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
+		}
+
 # check we are in a valid source file C or perl if not then ignore this hunk
 		next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
 
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
