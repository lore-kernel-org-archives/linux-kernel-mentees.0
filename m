Return-Path: <SRS0=/ghF=DT=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C56C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 19:15:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33A22206C1
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 12 Oct 2020 19:15:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXbYaD1W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33A22206C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id A0B3B8641F;
	Mon, 12 Oct 2020 19:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Waje1zRN9z2I; Mon, 12 Oct 2020 19:15:04 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 36388862F4;
	Mon, 12 Oct 2020 19:15:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2B8D7C07FF;
	Mon, 12 Oct 2020 19:15:04 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 84049C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 71F68858C6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Ty5exOH8ghM
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:15:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0A57F85888
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 19:15:02 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id g29so15317390pgl.2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 12 Oct 2020 12:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0W9VIQQ1F92giMMXeSWdWmbGQa5CVj0mL0tk7E83wCM=;
 b=cXbYaD1W+sXjB1oa1fGEQEYvsVzcl4x+ZLIqLuJg0k0vu52uwdfK8egFw4qkSU74cK
 DQfNifBZ+AbS9e18I4wCFu+NkRHHlOcVSG2LMNLK/F+ceRtTKocuRVb/8J5tMDQlimx5
 QXghZFyblg4XoIozq8lE6uwVwF0cFv1tXKqnz6U+OhEk9BgV0eeeL8sRj28XhNLvefbV
 jHJBn6pfMvOv02Xz5oLRAOe8GXodgxcA8L9ca0PvzT0mHeMPq1LQmBTFzEYJs0Xxb6lo
 rO0E8zmQTrSLF1FGzNlCdDdviyyUNFsWL2X/VjD/x0oFwmsnGB3InZKdMxfh2LCkqUjT
 cA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0W9VIQQ1F92giMMXeSWdWmbGQa5CVj0mL0tk7E83wCM=;
 b=raW3Up8GSFoMthl+Tu+MiwHirrfQagC1R9DNoN/ynvnfBz+g6RB5EoDUu4F+PqE+0q
 lycdXBAp0W43ZJlcbVvygpBTOPg4KW+ejkB9U0NGP9gU7TAjoKQLede4nTD55cgY47Zo
 jDpxDlbt7Z4bXSBRh784h19ryjd7Zqoste1r8FCG8QBEGPNLl9dXC9r/ZJFsOrxqNdGQ
 9q2PB7BSF+BUxKgEN1uVMSlcfHPhXf9Xc5L+TxmiNuSmZR6FUGplEu1M7WXpak/4Xfyf
 cHTlo2EeRPof00ieVH8kDk0gFyFb8w/ExT86Cf25qLN19v85o7EwiKM4Rc7X9pPIxAIL
 xaKw==
X-Gm-Message-State: AOAM531G2JFRbLEv1URseH7Vc7qbnoDDxoOlW/60rFpaIUhEkO3OPuP+
 X7U+mqPTlsgRdmV8zANMLhw=
X-Google-Smtp-Source: ABdhPJyjLZOuE6PTDtLg3WxH711WjPHbl/SsktmpBj1T9ShTY5cbWbuYuo7IBTCmoOYobLs/BJMx0w==
X-Received: by 2002:a63:1e0c:: with SMTP id e12mr14588630pge.386.1602530101422; 
 Mon, 12 Oct 2020 12:15:01 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:9004:60cf:bb87:436f:3a5f:b4e6])
 by smtp.gmail.com with ESMTPSA id p14sm25334110pjo.46.2020.10.12.12.14.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 12:15:00 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 13 Oct 2020 00:44:34 +0530
Message-Id: <20201012191434.365769-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: formatted email should
	have a whitespace separating address and comment
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

commit 0c01921 ("checkpatch: add new warnings to author signoff checks.")
introduced new checks for author sign off. The format_email procedure
was modified to add comment blocks to the formatted email. But no
space was added between email address and the mail comment.

This caused issues in some cases where the email was in the form
of "author@example.com (Comment block)". The formatted email removed
the space at the end of address.

An evaluation on checkpatch brought up this case. For example,
on commit 1129d31b55d5 ("ima: Fix ima digest hash table key calculation"),
the following warning was reported:

WARNING:BAD_SIGN_OFF: email address 'David.Laight@aculab.com (big endian
system concerns)' might be better as 'David.Laight@aculab.com(big endian
system concerns)'

Resolved this by adding a single space in between the address and comment
when the extracted comment is not empty.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 scripts/checkpatch.pl | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 124ff9432b51..6000addf1af3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1201,7 +1201,9 @@ sub format_email {
 	} else {
 		$formatted_email = "$name$name_comment <$address>";
 	}
-	$formatted_email .= "$comment";
+	if ("$comment" ne "") {
+		$formatted_email .= " $comment";
+	}
 	return $formatted_email;
 }
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
