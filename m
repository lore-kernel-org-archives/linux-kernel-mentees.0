Return-Path: <SRS0=5Mz1=BF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C864C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 07:58:19 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF292065C
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 26 Jul 2020 07:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VsW/EWWO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FF292065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 052532014B;
	Sun, 26 Jul 2020 07:58:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLvA8KKLjSef; Sun, 26 Jul 2020 07:58:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 2CBF02010F;
	Sun, 26 Jul 2020 07:58:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 126A3C004E;
	Sun, 26 Jul 2020 07:58:16 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 5C18BC004C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 07:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 00324860B2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 07:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkfnALWc7cKv
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 07:58:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4627B85F63
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 07:58:13 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id z5so7687402pgb.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 26 Jul 2020 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fezsu7b/WW42N9rhD5TOGFxH3anBPThGSbW+1nph4K8=;
 b=VsW/EWWOes45uTqWqw4ceK1KIqe8/tWhS/Lrw2FjAgoCuHWtE+UzfWlLolBHsUJ7/d
 0+90IqkiuYGg6GzpO1BpKogQZr3OIAad2/f29/qs5KZ+d7b/B1na/zgK7ChvL3teqKat
 5emAu56FUgsvu2cn+BvxN3p2cO4vfj+bzxfZwCej5sZJ7oC7310s0Q5ungXyXAUZAfQM
 KYlI/2HF/LRCGZFljR0UddZ1NN7wD03Lk8Ig5Hiy26wEPcl1k4YVJmgpEORQPwcliNZ7
 dBjtrJ9aN+v1lXmq6lr3iliOZuxCFHvZByyNjYLTNjgkd0W57+kch8GSrW5G4r8aEY0U
 swhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Fezsu7b/WW42N9rhD5TOGFxH3anBPThGSbW+1nph4K8=;
 b=YWS/w8TV8gy4JziNyTBtdqOFlTJEsAfv23ZnpG5T2G4lAP1PtEB2lE3DFGrsLGTadj
 gCt5k4h5OPG8IyWMqiVdbz+ocslNmu+fho2pHv8TKJwW0yTEqVDd4my66CSzbWgCHHyf
 IJirVq7X23zAHbDQZz236zQQD+EaqY+r5umfuUjaTtOCNWQkgOhwLm9i4A86uoe6ws9H
 qp83ayYU5MGEN4wJVzTRyrVXMYqTJenZhuhxfi+//sIo9wPfnRg2LLMc3ATnWQSTU75H
 970OOQ6Dryct2U2V/DLtKxYy4tDAmhlY/43pbs8GtWIW102rq8ZPXWTXYS1Q7U37UAzW
 TFEQ==
X-Gm-Message-State: AOAM533u9i//vmbv9ilsbLwWMobrPySQYvlna7HHAvC4ytrTh8+LYDzL
 LAGx+jz5a3b4NoypokLSv+E=
X-Google-Smtp-Source: ABdhPJwesJdKjVb7PKp2jsmRc84h9xNZk3R8byw6O7qCyu6Z/HNutGlbkk/J4TGeMTd+eM7Jnvm0/Q==
X-Received: by 2002:a65:5604:: with SMTP id l4mr9741597pgs.268.1595750292833; 
 Sun, 26 Jul 2020 00:58:12 -0700 (PDT)
Received: from endurance.iB-W4G311N.setup.in ([59.95.233.160])
 by smtp.googlemail.com with ESMTPSA id f71sm33624105pje.0.2020.07.26.00.58.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jul 2020 00:58:12 -0700 (PDT)
From: Nachiket Naganure <nachiketun8@gmail.com>
To: lukas.bulwahn@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Date: Sun, 26 Jul 2020 13:28:02 +0530
Message-Id: <20200726075802.396907-1-nachiketun8@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Linux-kernel-mentees] [PATCH] Script: Checkpatch: Disables commit
	log length check in case of valid signature tags
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

Checkpatch.pl outputs warnings for commit description lines that exceed
beyond 75 characters. Sometimes these lines might contain signature tags
that cannot be shortened. The patch checks if the line has any valid
signature tags and disables the warning in such a case.

For instance in commit ID ac854131d984, the patch
contains a Reported by tag line which exceeds 75 chars. And there is no
valid way to shorten the length.

To fix this, we need to check if the $line variable has any valid
signature tags which are already stored in $signature_tags variable.

Signed-off-by: Nachiket Naganure <nachiketun8@gmail.com>
---
 scripts/checkpatch.pl | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 197436b20288..b6d5e2a8fce8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2806,6 +2806,8 @@ sub process {
 					# filename then :
 		      $line =~ /^\s*(?:Fixes:|Link:)/i ||
 					# A Fixes: or Link: line
+          $line =~ /$signature_tags/ ||
+          # Checks for signature_tags
 		      $commit_log_possible_stack_dump)) {
 			WARN("COMMIT_LOG_LONG_LINE",
 			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
