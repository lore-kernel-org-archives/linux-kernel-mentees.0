Return-Path: <SRS0=9dud=GV=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 780CDC433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 19:14:07 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D8DD22573
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 19:14:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D8DD22573
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id BDD9F86030;
	Mon, 18 Jan 2021 19:14:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XKvV4qhIqYHT; Mon, 18 Jan 2021 19:14:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 25F4E8601E;
	Mon, 18 Jan 2021 19:14:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 024F8C08A1;
	Mon, 18 Jan 2021 19:14:04 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5D514C013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 19:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 51AC786E1D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 19:14:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wWVNo4wyZki7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 19:14:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7E98D85F5D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 19:14:01 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id x12so9125992plr.10
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 11:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WlLbPCtA5zX530YpM9Rqf78MCKfOyhRy2nl/un5gf4Y=;
 b=jsuMm3rGQ0zrVs6eYqAGj6R1bBCs4e1F7CtnRUfyIRkbVUXFqcXh/B39/bs5MRPOuB
 CsUak65MQ9kNywGQkKRkBQkPHMPlYVmGsnJmNVdkicQn/hx73KXTHHtn3YQWIIBrvV0+
 sAmnSKzB25TPohRQkLdlQa7+u0X4ykfgqwiT/sX+jhp1n6jEMe8d9dAXHwyWHOlcZXVv
 KNNKdzG+3xmFBsQ1fxoDCvlbNzeb8FZ60UsJc/BKHUOiIzNpuzhCh8EXPsT8b2R4a9OT
 gkP735FsssIoHNX0gOVe4W5ky1rEj1V9AGyEDdGSd69JHKNuNaDJGkNqZMsQ02XVFyd9
 K8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WlLbPCtA5zX530YpM9Rqf78MCKfOyhRy2nl/un5gf4Y=;
 b=L7XmjL4FngDSfHG3LjgTwU1LMeRNq9+Z8EVcW17OEtep8E49zr8Jy02sADAQ/vl1ER
 0NjOhx+1tfdJL1l6cCaRQ76DG3GxRKhjEXfPDbgiCPDRcACbQTpOI8U0E/dSDwW8B286
 5BfoGT9adqcPpVSNNsjI6jSjzao6E4Q7ReYeMD1VjGAcRZ8ZvlAKxVc6aVj+J3nQJtxC
 s14x+lWifkIz8H7L0+/50dDEYfTuuA8exZ4r20rLw0WDCjOfpStlPqa7o0qmHOT65LW6
 5i3aMz9v8fCpE4plj82+i+qmSuf0yEqlPEg6kwp/0DkiRklgKcz4tEHy0Vo7Ej8+L5yJ
 gLIg==
X-Gm-Message-State: AOAM532bV83zyb5ncCXtJWBO0z9dGlvOmO9qcBw6EQAzOoFVkFtsUt5D
 Oha8dsFBZwZ0IFd6mHIXYzc=
X-Google-Smtp-Source: ABdhPJyPzB/wOlwOhIF99+aG0wnMwYgueqL6SRqmJQ8WkKw5QEZnlijZ+DXQCP9zscxscb5KvAKhPg==
X-Received: by 2002:a17:90a:2e82:: with SMTP id r2mr832621pjd.46.1610997240983; 
 Mon, 18 Jan 2021 11:14:00 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:2812:4fd3:d673:ac9b])
 by smtp.googlemail.com with ESMTPSA id mv17sm146726pjb.17.2021.01.18.11.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 11:14:00 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 19 Jan 2021 00:43:51 +0530
Message-Id: <20210118191351.1446-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <9000f3ce-0ac2-cc8c-48f8-31ffaac8bd6d@gmail.com>
References: <9000f3ce-0ac2-cc8c-48f8-31ffaac8bd6d@gmail.com>
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add warning for avoiding
	.L prefix symbols in assembly files
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

Local symbols prefixed with '.L' do not emit symbol table entries, as
they have special meaning for the assembler.

'.L' prefixed symbols can be used within a code region, but should be
avoided for denoting a range of code via 'SYM_*_START/END' annotations.

Add a new check to emit a warning on finding the usage of '.L' symbols
in '.S' files, if it lies within SYM_*_START/END annotation pair.

Suggested-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/lkml/20210112210154.GI4646@sirena.org.uk/
Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7030c4d6d126..858b5def61e9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2501,6 +2501,9 @@ sub process {
 
 	my $checklicenseline = 1;
 
+	# record SYM_*_START/END annotation pair count, for AVOID_L_PREFIX
+	my $sym_start_block = 0;
+
 	sanitise_line_reset();
 	my $line;
 	foreach my $rawline (@rawlines) {
@@ -3590,6 +3593,25 @@ sub process {
 			}
 		}
 
+# check for .L prefix local symbols in .S files
+		if ($realfile =~ /\.S$/) {
+			if ($line =~ /SYM_.*_START/ ||
+			    (defined $context_function && $context_function =~ /SYM_.*_START/)) {
+				$sym_start_block++;
+			}
+
+			if ($line=~ /\.L\S+/ &&		# line contains .L prefixed local symbol
+			    $sym_start_block > 0) {	# lies between SYM_*_START and SYM_*_END pair
+				WARN("AVOID_L_PREFIX",
+					"Avoid using '.L' prefixed local symbol names for denoting a range of code via 'SYM_*_START/END' annotations; see Documentation/asm-annotations.rst\n" . $herecurr);
+			}
+
+			if ($line =~ /SYM_.*_END/ ||
+			    (defined $context_function && $context_function =~ /SYM_.*_END/)) {
+				$sym_start_block--;
+			}
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
