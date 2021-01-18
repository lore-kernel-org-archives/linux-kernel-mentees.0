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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82AC9C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 14:44:31 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 202BE21D93
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 18 Jan 2021 14:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 202BE21D93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 98E0520029;
	Mon, 18 Jan 2021 14:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3g1svw4lgGK; Mon, 18 Jan 2021 14:44:28 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id DA68520488;
	Mon, 18 Jan 2021 14:44:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5721C088B;
	Mon, 18 Jan 2021 14:44:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8E2ADC013A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 14:44:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 7C2D087061
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 14:44:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enSQFPnp6ohB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 14:44:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 949F186FE4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 14:44:19 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id m6so10321604pfk.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 Jan 2021 06:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3rQBQnxieXxYDGZS0j0G53BJrSbcTi5baD6q7wHgB5c=;
 b=E/PVFBZKDsU54vvmjvHDHkxizt7hUcpgQPkRa5d42MCFXhPWta5QAdiiA1qDYL6N7c
 LCOqyHDiCiLljZ64lm1dyyzgXyHjSNHkQBF3/BVY8oooeMVCXczuAsH+uWv5h1Kh3YEo
 A94vSFN5pcSVakWT+Xdq8wQHIahihFJMXalU9mgir9glO1NmhwWL+CSF9OXHb5dmY1+y
 vnjVChMiCH+3z0/DJEWlhoZaE4zG8Hkfj3oufnVtDNtHmtLO59QdOEk8sV+pn+BmQGtl
 OP85xApNuyl6JwuE5H0qfaSAFk2VOxX8QoCQfAPue8G64jRkzG0pZa1ZMTO57pupO/CD
 bYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3rQBQnxieXxYDGZS0j0G53BJrSbcTi5baD6q7wHgB5c=;
 b=GWUNQKCKTKWVmwk5GdOdhqJyec1qQ315i3IFOgTzOzCc2EfDH0tN2cAnvvgCqodQbY
 Ee2yxlBvSfSU2q92AnOXAG0OnR0vC/TrYULZEeTgRIAL0DMv61KwO8I54yZgxzJgk6eL
 9VzFyzd/3H3Y20YH/31byysG2BskQdZcdNI1cHIERFsLEN5O3b2MyZJvBh5xkanaIzDY
 D0D+UMlFgvNwrcwc0/L7jmndoJNYTrirWx8Kqh4ifMjfPHtsP2fcmPunAzmJaokD6dgi
 zU3qLIozmJsVR7W7JRYj/sjmvYngUDcM65R/cmQRP8TNhvgxLW9fcSppBYKKQIB+GszN
 T/aA==
X-Gm-Message-State: AOAM533wsOC9WhQTp8DCtA/UeiUbLN/Ikh6O7hTjXV5e9g59FPjZMdRc
 TAa/YaI6762SA9c1HfxmWQ0=
X-Google-Smtp-Source: ABdhPJxbkFuBsP99QPVu3gILf86klRM23RHeu+3UhV8Xich/LYTFBn/LtrMVFNo/ioaGMMuB6IX6og==
X-Received: by 2002:a63:e849:: with SMTP id a9mr16430pgk.231.1610981059029;
 Mon, 18 Jan 2021 06:44:19 -0800 (PST)
Received: from localhost.localdomain ([2405:201:600d:a089:10a6:4f0a:582a:a5a7])
 by smtp.googlemail.com with ESMTPSA id gz5sm17010603pjb.15.2021.01.18.06.44.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 06:44:18 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon, 18 Jan 2021 20:14:10 +0530
Message-Id: <20210118144410.19217-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAKXUXMxA=QrANbxudRZPp90Ox7JqjSt_QNek2=xbUuypA527aA@mail.gmail.com>
References: <CAKXUXMxA=QrANbxudRZPp90Ox7JqjSt_QNek2=xbUuypA527aA@mail.gmail.com>
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

Add a new check to emit warning on finding the usage of '.L' symbols
in '.S' files, if it lies within SYM_*_START/END annotation pair.

Suggested-by: Mark Brown <bro...@kernel.org>
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
