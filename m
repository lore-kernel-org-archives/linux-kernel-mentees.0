Return-Path: <SRS0=AIAE=EJ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55785C2D0A3
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 15:19:18 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1C5320757
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  3 Nov 2020 15:19:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZ/ngWQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1C5320757
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2617E861E3;
	Tue,  3 Nov 2020 15:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 97KLWFqV_7Yq; Tue,  3 Nov 2020 15:19:14 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9766E86151;
	Tue,  3 Nov 2020 15:19:14 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 770D3C088B;
	Tue,  3 Nov 2020 15:19:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 8A00AC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6EE242051E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rxm3X7yWGTTe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:19:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
 [209.85.214.195])
 by silver.osuosl.org (Postfix) with ESMTPS id 5EACB20485
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  3 Nov 2020 15:19:11 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id f21so8693469plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 03 Nov 2020 07:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=l+luA0aDmxEcAcUDm3+jzRfzSQQgm67YqDkV7cvKBQk=;
 b=eZ/ngWQQuDIbdbF8eVSpI4FKrtLup356cKw/ZhnMG4CJVWLEfuFUMegls5PSe7EWzt
 nXz3vS6vC+h3vk44Hl8rV39x5jt17Cd99ErV18ytmHa0kXbqhqrmtrcrtepZgtnnM7tB
 659u0KHDX2ZiTGvQw90SicfmMmttxa2iS94IUtiX7QP+HDOIfCGHaZhA4mt0cPFKKpW6
 JPJIsf6XzfU4GoD2wR5QF91CT4FkCYVMWADwif5u+4sL577E5Oq4dt/wPQDENqUc5UgC
 KnzEeuXOdjtiI1Y+dvDed5+AgHaglkc1IdAn9+Yq/958dYI4sgtel9wEEEPLwx57Gk3t
 kj5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=l+luA0aDmxEcAcUDm3+jzRfzSQQgm67YqDkV7cvKBQk=;
 b=WzZBNzgdIhQUm2MuyKluh//hTKlmfotXYZvAbpqru7buq3d593oq/EbYxyYAMdWvnz
 h7NbKmEFfysY37n+aIkD1kbKp+VYEcfGsjx66cJqOO6emVFY0yUT9+azywKNKtKJMGJ/
 z+XhSycUFLx4HIbzF0zFWQKLSuVYIJMvbGi8Xav0+JPMDA1EytqxH01CTT388xB8nIu0
 hmzVGRnVe+z+ggGDtaysh8i3paVifMSlv0ySsk1LqGBgpRJadNkV7oYe0URvwet4A4b5
 cZEuML/PAtMebAcw4jm2luuQjIxYfOIV4VX8CInItOn6LwPU/cGUrnqm+Ggqkb76NQ5g
 G86w==
X-Gm-Message-State: AOAM5322iC4hTtVCeM/2f8PbmnIe4lYdM1xE/P214WwS/N5lK5albunK
 189QxfBw2CfqxBjjGzLz0a0=
X-Google-Smtp-Source: ABdhPJyQRvQmmRmMKkrTyxlTKPJMmKhmpAFJnmagawJrkCc2otmRoqz+RAIp1Rso/D5bzlMJ4G1aeQ==
X-Received: by 2002:a17:902:423:b029:d5:f967:86fe with SMTP id
 32-20020a1709020423b02900d5f96786femr25504394ple.55.1604416750661; 
 Tue, 03 Nov 2020 07:19:10 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:41d:f163:ac:13ab:8c6a:34ab])
 by smtp.googlemail.com with ESMTPSA id
 w66sm8275674pfb.48.2020.11.03.07.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 07:19:10 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue,  3 Nov 2020 20:48:58 +0530
Message-Id: <20201103151858.25375-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for BAD_SIGN_OFF
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

Currently, checkpatch warns us if the author of the commit signs-off
as co-developed-by.
E.g. for commit 6e88559470f5 ("Documentation: Add section about
CPU vulnerabilities for Spectre") we get:

WARNING: Co-developed-by: should not be used to attribute nominal
patch author 'Tim Chen <tim.c.chen@linux.intel.com>'
Co-developed-by: Tim Chen <tim.c.chen@linux.intel.com>

Provide a simple fix by removing the co-developed-by line from the
commit message

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 58095d9d8f34..1030d4fc2abf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2827,8 +2827,11 @@ sub process {
 # Check Co-developed-by: immediately followed by Signed-off-by: with same name and email
 			if ($sign_off =~ /^co-developed-by:$/i) {
 				if ($email eq $author) {
-					WARN("BAD_SIGN_OFF",
-					      "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline);
+					if (WARN("BAD_SIGN_OFF",
+						 "Co-developed-by: should not be used to attribute nominal patch author '$author'\n" . "$here\n" . $rawline) &&
+					    $fix) {
+						fix_delete_line($fixlinenr, $rawline);
+					}
 				}
 				if (!defined $lines[$linenr]) {
 					WARN("BAD_SIGN_OFF",
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
