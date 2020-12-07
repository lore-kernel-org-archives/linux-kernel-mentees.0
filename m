Return-Path: <SRS0=2gri=FL=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A1AC433FE
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 12:43:15 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93981233FC
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  7 Dec 2020 12:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93981233FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0FF36871B6;
	Mon,  7 Dec 2020 12:43:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LDxvU5oBC5V3; Mon,  7 Dec 2020 12:43:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5035186658;
	Mon,  7 Dec 2020 12:43:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 441D0C0FA7;
	Mon,  7 Dec 2020 12:43:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 28768C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 0D600871B6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQAdvnFK3wG3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:43:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
 [209.85.210.195])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 6DAEE86658
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  7 Dec 2020 12:43:12 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id p4so3933716pfg.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 07 Dec 2020 04:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=EtHkpbQVHdOjE1432G4/EXe1E4U0+TAz1KLL3fy5IOw=;
 b=dgYYwbvtSFmecZkLHRY4gyuGZhNXJMx/RPiKfVgrxEAU0qncd4LSSNjISE9/xkImlm
 ActxipdckNxbNBdLFTmaBxvBbDcrGXh38BEsKemg2UN2fmLAjTWxnVMWK0SByRnG27Km
 MVcrNJuaGbfbWcGYhd44FeOwTsmYzGapPbe0V7APxUVrzPdlA8Z0dAz6lOBnImpYqxvE
 ne3VFqfFiMO0jHKnINlqAtu6Y/hSkxw34AgNWgT3r7qNWpozT3NDPuuhQo/JY2wNfHKP
 aL9zFCetgJkHSKdxQrfuO7ipuxDlLl1L2+HIXgS/iJAbhvGh82kQsfSTU1Gf4SLoSdFe
 gQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=EtHkpbQVHdOjE1432G4/EXe1E4U0+TAz1KLL3fy5IOw=;
 b=QeU9HE5eKyRsRhzgKw3OTDEbYMge+5pAevJNau7KrcbVkPLZPMulfTx3sSx6Id4Ve9
 TpQfMVx8q3kzMELGPH5TOi3Uq4h8AQKsgHBURXcW9+1398C4HTD2Q/esr091fRxbzdOd
 PtHe9Rxq7KzGzcoQriYwKmPxVq7YzIfFl5dA1lXD/g+3TVRsyQ3jI99qFwRstPO6RIDY
 sukeukjySjnDngJbPcJDTVRxxj4oTu+zrrJBQhfV5HkX1zqexOwvvZMBZtHlrp5a+6oU
 hF7IsVz0Sf9UT33K3Barl38P7GAx5tOR7Sevml5ysbG2nKHHDpJGLrtBQ4XIwl7qDy38
 wHPA==
X-Gm-Message-State: AOAM531l0soxKHqaPtb6T+L/AFXubvPj5D5FZpdOlUzP1k8KwYOceeVG
 9I6ZIjpqRUXIOU7O83jbaU0=
X-Google-Smtp-Source: ABdhPJy4aszif4V8lIr7TJc1yhCObaK4stx86zk/dLE1YtFCkjaPp9kC5cHHig1tajLf3dAWjVE0Og==
X-Received: by 2002:aa7:8297:0:b029:198:15b2:ed0a with SMTP id
 s23-20020aa782970000b029019815b2ed0amr15705342pfm.47.1607344991823; 
 Mon, 07 Dec 2020 04:43:11 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:405:9e9e:1071:c250:5e01:a402])
 by smtp.googlemail.com with ESMTPSA id
 d186sm14704686pfa.25.2020.12.07.04.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 04:43:11 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Mon,  7 Dec 2020 18:13:02 +0530
Message-Id: <20201207124302.17128-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	CONSIDER_KSTRTO
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

Checkpatch recommends the usage of kstrto* over simple_strto* and
strict_strto*, as these are obsolete.

E.g., running checkpatch on commit f79b3f338564 ("ftrace: Allow
enabling of filters via index of available_filter_functions") reports
this warning:

WARNING: simple_strtoul is obsolete, use kstrtoul instead
+	long index = simple_strtoul(func_g->search, NULL, 0);

Provide a fix by replacing simple_strto* and strict_strto* with kstrto*

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7b086d1cd6c2..ca5bb5a3f8f6 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6980,8 +6980,12 @@ sub process {
 
 # recommend kstrto* over simple_strto* and strict_strto*
 		if ($line =~ /\b((simple|strict)_(strto(l|ll|ul|ull)))\s*\(/) {
-			WARN("CONSIDER_KSTRTO",
-			     "$1 is obsolete, use k$3 instead\n" . $herecurr);
+			if (WARN("CONSIDER_KSTRTO",
+				 "$1 is obsolete, use k$3 instead\n" . $herecurr) &&
+			    $fix) {
+				my $kstrto = "k$3";
+				$fixed[$fixlinenr] =~ s/$1/$kstrto/;
+			}
 		}
 
 # check for __initcall(), use device_initcall() explicitly or more appropriate function please
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
