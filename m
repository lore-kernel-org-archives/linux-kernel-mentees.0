Return-Path: <SRS0=Fejl=GX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6933AC433E0
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 07:26:03 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C619422C9E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 20 Jan 2021 07:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C619422C9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 5E24C86FDF;
	Wed, 20 Jan 2021 07:26:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G1K2OIhnxEXI; Wed, 20 Jan 2021 07:26:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 7712B86FDC;
	Wed, 20 Jan 2021 07:26:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 59E2AC088B;
	Wed, 20 Jan 2021 07:26:01 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3BADAC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 07:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 1BB67203DB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 07:26:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zBDNj+hjwwNR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 07:25:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by silver.osuosl.org (Postfix) with ESMTPS id 5B019203CE
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 20 Jan 2021 07:25:59 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id g15so1647596pjd.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Jan 2021 23:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=WlLbPCtA5zX530YpM9Rqf78MCKfOyhRy2nl/un5gf4Y=;
 b=KOE6EmQvvvEAZSvv/7MDpGtLd4BDooRQucvauDCbrLW42m9e3IcwrFIgSkLqBMIbBq
 v+WmH1EwsuJLHnRbARfIuVCMAqfSNZBI3kjCo2UC6GG60owEN8cEYi9rV2jGQ2Wq9Oqy
 bvAejENnpxT6ekUPqfEwCOfauCfo7mnCEeJfNf0vvw9YdQHWRzApCTjg1Xi9HXZ+Ro5Y
 bceqiBvDMOWrlFvbT3EUIPyxhG0Lo1U8BM5WqFmihj7nxAEhQiX+Cvo0i4M0BZX1CKdt
 xy6p3chXpuuprReXoZvglpOoMPWJpy3tULXLZBJJ93qwrHW0bdCte8vaN/y49w4/qvvN
 Y4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=WlLbPCtA5zX530YpM9Rqf78MCKfOyhRy2nl/un5gf4Y=;
 b=qSFOckU0se00wY/mkzngCnZ8SYoU3yZ34V+ya7pgA9syrAIp9xeFkWvnX4azc35Vcn
 T/Hqn0QJPLE3OAFRLFjeNcNbPWDZosqgyabDkaHjFfyKM8OzVncLPT5hYAqzGSpd7rzp
 GPT13jqp+jIi2+zhS7wg+s9emtNQVeY+pBiOHy80wBBhA5YaH0igb3eJb/AFDWrT0hlk
 2L5sHdPECOHJH4Ufmam8Np2Y5yi51e4G1k9qPaAlx/EuRPBoANIdcvkT5kLdsUt1EYiO
 p0MZS5D65hcsjKRKROOSgPhg2W3hgb3kydIiFQLLm9QKxFNCrT2fv81bnkLdhf5EPWCH
 Sxlw==
X-Gm-Message-State: AOAM533TQSqn6U7T5oZuO7TpFoMEScY0ehdWpRQZZaPvN9Dn3pvbYVxK
 d5X4IYiUlxbdvKT98NbXGwU=
X-Google-Smtp-Source: ABdhPJzQ+nuPF9L38pDYw5xhJmJDWz5tiY/BflYGMnNp1cSNMrt68gG0BN7hoZMwKDyZRAsV3Wpb3A==
X-Received: by 2002:a17:90a:a10e:: with SMTP id
 s14mr4103098pjp.133.1611127558777; 
 Tue, 19 Jan 2021 23:25:58 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:7054:d78f:3538:6af3])
 by smtp.googlemail.com with ESMTPSA id 192sm1199519pfv.209.2021.01.19.23.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 23:25:58 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Wed, 20 Jan 2021 12:55:47 +0530
Message-Id: <20210120072547.10221-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: yashsri421@gmail.com, dwaipayanray1@gmail.com,
 clang-built-linux@googlegroups.com, broonie@kernel.org, joe@perches.com,
 linux-kernel-mentees@lists.linuxfoundation.org
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
