Return-Path: <SRS0=dWhK=EW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05C48C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 07:19:47 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 591092224F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 16 Nov 2020 07:19:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JA0DAUBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 591092224F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B82C42043D;
	Mon, 16 Nov 2020 07:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5RFo-PNhaWsf; Mon, 16 Nov 2020 07:19:44 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id D0B7A20110;
	Mon, 16 Nov 2020 07:19:44 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEED0C0800;
	Mon, 16 Nov 2020 07:19:44 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DF683C07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id C5D7386892
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:19:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R8AgXp2tTFB7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:19:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B93E186824
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 16 Nov 2020 07:19:41 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c66so13320505pfa.4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Nov 2020 23:19:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Ile4Ueq+/H9c/6jUa0JhYl+yDKP365ziXuBYqJNeYSA=;
 b=JA0DAUBsEcHXWmqdQ3n39F1dG4ciBapQmokLnbyPs9+YFQI/TI5x1RHhdDDGaYeVX6
 U9yut+5D6c1klXCFLHR5So3CcGIWwTneMTAZK/aWoDvEJOzOF/9/ctwPYu8skltM/sb7
 qGnDc/krLon9EaD7C4MsfAtxpW4RhxvypkcAqWXeBaGRBoQ6Z0SLqK09j6gvJ1Hl4XFP
 64lrwyS1z7/QFknaDlOkRKyVdu/kHvvpvnocYtw3HXCltryGqWjBeTWRiYwu6PSQIlYr
 /R0JLthmSd/75GWl1B4uEw8ORmo2wKh19UzwfG5g0wJ2CSbaXJLjKgc9IMRDD3I5hGPP
 cwtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Ile4Ueq+/H9c/6jUa0JhYl+yDKP365ziXuBYqJNeYSA=;
 b=fPGID8wxaCfKonGLRlEyDi8VluKvbIz5pQRCz2X3bHGxFxLb6rpORMW2QMgd5vcFEg
 kx4rhl+WWTpAHUR18REQkHmchmsI1iKszXwIGUsS8Q1Wr7AWhpLqv+5MZAsRsHXH01Ma
 jFZBcR5KGKE8UilqfBVm6HkkXLZQTKa3xuHWFxOIozQoUFNiPIn4bcHdNnOyiCYL2v1z
 zFedwl9QYnwkGkKsuGoUoiVr0fJJp+ffXfPr2smfn/vr3SoBCGxHtqHrIGE7Oaeclx2+
 AYiEuwAlFQe8PgW8Z5KAK+GwKBi+qCwTmUsttxpVqH6l99rXXpTxDgbBIVOav82OjyTU
 2k2Q==
X-Gm-Message-State: AOAM530IF5iaU/wjPpi8CpmR+EDdDVBJv/qLNYiXC1kuyXPFa/DoZv0S
 W+ZRJivL2il+J51GbKa8GpA=
X-Google-Smtp-Source: ABdhPJxHTMwYDWcUfrvbDbM3Sq5ARMULdkdn2bGTpryXXxout4M6vS1+u+JMvdz3frmMtGuGYhxMEg==
X-Received: by 2002:a17:90a:ca0b:: with SMTP id
 x11mr14352394pjt.155.1605511181163; 
 Sun, 15 Nov 2020 23:19:41 -0800 (PST)
Received: from localhost.localdomain ([42.111.137.21])
 by smtp.googlemail.com with ESMTPSA id t13sm5030298pjq.15.2020.11.15.23.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 23:19:40 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Mon, 16 Nov 2020 12:49:30 +0530
Message-Id: <20201116071930.7733-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option for
	MAINTAINERS_STYLE
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

Checkpatch expects entries in MAINTAINERS file in a specific order and
warns if the changes made do not follow the specified order.

E.g., running checkpatch on commit 6f736909f0a4 ("MAINTAINERS: Add
patchwork link for PWM entry") reports this warning:

WARNING: Misordered MAINTAINERS entry - list 'Q:' before 'T:'
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linux-pwm.git
+Q:	https://patchwork.ozlabs.org/project/linux-pwm/list/

Provide a simple fix by swapping the unordered lines

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
modified commit message

 scripts/checkpatch.pl | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2749f32dffe9..c9aaaa443265 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3299,13 +3299,22 @@ sub process {
 					     "Unknown MAINTAINERS entry type: '$cur'\n" . $herecurr);
 				} else {
 					if ($previndex >= 0 && $curindex < $previndex) {
-						WARN("MAINTAINERS_STYLE",
-						     "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev);
+						if (WARN("MAINTAINERS_STYLE",
+							 "Misordered MAINTAINERS entry - list '$cur:' before '$prev:'\n" . $hereprev) &&
+						    $fix) {
+							# swap these lines
+							$fixed[$fixlinenr - 1] = $rawline;
+							$fixed[$fixlinenr] = $prevrawline;
+						}
 					} elsif ((($prev eq 'F' && $cur eq 'F') ||
 						  ($prev eq 'X' && $cur eq 'X')) &&
 						 ($prevval cmp $curval) > 0) {
-						WARN("MAINTAINERS_STYLE",
-						     "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev);
+						if (WARN("MAINTAINERS_STYLE",
+							 "Misordered MAINTAINERS entry - list file patterns in alphabetic order\n" . $hereprev) &&
+						    $fix) {
+							$fixed[$fixlinenr - 1] = $rawline;
+							$fixed[$fixlinenr] = $prevrawline;
+						}
 					}
 				}
 			}
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
