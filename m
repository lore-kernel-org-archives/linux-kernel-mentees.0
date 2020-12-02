Return-Path: <SRS0=wdXo=FG=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187D4C64E7C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 09:08:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 58204221FB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  2 Dec 2020 09:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 58204221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8D18C87079;
	Wed,  2 Dec 2020 09:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uHbjnE8xrOPA; Wed,  2 Dec 2020 09:08:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id EDA3686D94;
	Wed,  2 Dec 2020 09:08:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id DA0A2C163C;
	Wed,  2 Dec 2020 09:08:42 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 007AFC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E39E386973
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:08:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mHbVuwF91GPe
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:08:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com
 [209.85.216.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 4CEC085CE1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  2 Dec 2020 09:08:41 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id iq13so653196pjb.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 02 Dec 2020 01:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3mcUM6oeEmRge/4wz3fLnB/v0v3NUBVG/sr+eT0f5yE=;
 b=K+6yaLfjFFmoCPFG2eFHLYhErQC5d56aj03yC7JvGWi6qAxOrZ/En3fsSQJpOpoFqU
 b1ajv7az/h7vDJlwK5wmU2x7QoFx3Ukt18CDtNI6OS1bi6gBcLzD+a6eKYfDx88RqVR1
 G2Z2iduixYkMK9m3t014zntz19Yd+7pGunLlA9qCOmXRiVjSgaO35FgP4cEevI7UuicS
 DoDBucfGOlSDrlaF2/tMBzuoqJrpazXF9k5erzqkgE1p5mtzTDDjadd6MsSuG2rhGsBw
 T7LgRy3jCKA/lkbwnyUPGH2thOK8l8QTYJPPY8GGIhRCyjcPWR72s2BQFNDcUlgvc++F
 6AwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3mcUM6oeEmRge/4wz3fLnB/v0v3NUBVG/sr+eT0f5yE=;
 b=Q0O8tfP0PDOxL4zM3MjJtt0c20A+UTwQyVFyj9IXV69/PlR55mB0g8YZ2K2BXClYbg
 AhhhnCPVhSzZ+zTUZwSoJBKDx8kk4WfTBT3F7O31KLoUypToB8TaKoXue//O9ClxFcAm
 2L1+Kv040LK35sLuh9qXEnJjuvNYeIyNz/ruUTeSgdscHv9reQzgNFyiDxLc+uU4fTDY
 29fOI2yeSzTe+BF/0iBdlM11FxrzUQqkYWR+ksCi5p1nwSwjO74sWPSghmbnIY4dQjcC
 e+e4vrDXIpRIBAQD3/9WOEcLnTDhd/7Sm1gFvhdLpawjUy4EPrsxPkBOXSNfw8Aohsml
 qqug==
X-Gm-Message-State: AOAM532CE1wk9oijywSw4S38D1hTqg5X+pPa1u7DMSw+p0+eiySUNn7R
 6l6OVbNxOwoRzzSRQ5q+lW8=
X-Google-Smtp-Source: ABdhPJy6/quREt9/+mnXIv96ZPnZKmwPzXGfnDi4SZh+iljxcsMqy5DD0AHJ7unRABAEltyytAKIVA==
X-Received: by 2002:a17:90b:1888:: with SMTP id
 mn8mr1572830pjb.158.1606900120751; 
 Wed, 02 Dec 2020 01:08:40 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:430:be3c:9984:8aed:2f75:bf22])
 by smtp.googlemail.com with ESMTPSA id d7sm1578010pfd.214.2020.12.02.01.08.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 01:08:40 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Wed,  2 Dec 2020 14:38:28 +0530
Message-Id: <20201202090828.12934-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <ceb3ffcdae151d6ea1d7f1a45bf61b3d2a1c183c.camel@perches.com>
References: <ceb3ffcdae151d6ea1d7f1a45bf61b3d2a1c183c.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix for non-standard
	signature - co-authored-by
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

Currently, checkpatch.pl warns for BAD_SIGN_OFF on the usage of
non-standard signatures.

An evaluation on v4.13..v5.8 showed that out of 539 warnings due to
non-standard signatures, 43 are due to the use of 'Co-authored-by'
tag, which may seem correct, but is not standard.

The standard signature equivalent for 'Co-authored-by' is
'Co-developed-by'.

Provide a fix by suggesting users with this signature alternative and
replacing.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 4a026926139f..fc036d545d2d 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2832,6 +2832,9 @@ sub process {
 
 			if ($sign_off !~ /$signature_tags/) {
 				my $suggested_signature = find_standard_signature($sign_off);
+				if ($sign_off =~ /co-authored-by:/i) {
+					$suggested_signature = "Co-developed-by:";
+				}
 				if ($suggested_signature eq "") {
 					WARN("BAD_SIGN_OFF",
 					     "Non-standard signature: $sign_off\n" . $herecurr);
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
