Return-Path: <SRS0=gqjg=EX=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39E7AC2D0E4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:57:26 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95E8022240
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 17 Nov 2020 09:57:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHhev92J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95E8022240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id F0F79865C4;
	Tue, 17 Nov 2020 09:57:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WaOmAvvklksk; Tue, 17 Nov 2020 09:57:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 803C68656A;
	Tue, 17 Nov 2020 09:57:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 66A7FC0800;
	Tue, 17 Nov 2020 09:57:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6C85DC07FF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 5809D870E8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g7lpI0N67EeO
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:57:21 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id B77DA870E7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 09:57:21 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id d17so8439945plr.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 17 Nov 2020 01:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=wcMZTaIPkIt9BoToXvaICe5+QNibl67EVvBUxobxY0o=;
 b=DHhev92J1F9y0CvOcw1ySvTmr7N1EyXGoaboobHhTbxmAX7bS4CV1gXeks/TCOG38L
 iOrk7ES96vc2iNEr0qYu+wg2NsgPzSjyJF0py6r/d4UBy8I3qME3whwa8IFoZhjvZv3I
 LacESmFMBniTiYHaNfPt/oSlDwhfR7wmVaQVBfwPAQotv3o6ukmOdKtbuJrarJz3+Mgn
 kUgmfjApojiNWi/70uQGNA6fovcG5rVe3cVbgX9+JcY/bUU1jed04WJrrYZDc1M/RpKH
 t4JHNTdZ4PAUumoRi8TY96Y8qaYU4GHN4WE+3OtN7CvnEpvwrL+S6g0BJqUEu/O1ujdW
 7dAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=wcMZTaIPkIt9BoToXvaICe5+QNibl67EVvBUxobxY0o=;
 b=HL7WpJTrGIfR3WXGQ2udNVrcnD4UnR9r1//iyLKv0hgoCL5T4fVRZ0oHjoVwQABBsR
 +1zC/VUsw+RApAgJbjDXLY0HZmVIe10IF6WccUCxz7n6ut5ODFrC+cgfwzg9lGAXy/Dl
 VkFTLN7dPNlfgbLmwi1ylYqstC+Nc4BPTRS9JJkDMLBbVIeaoE3lcVZtCFhqqJWyhbmw
 VcD+pQ384Vr/g3BDsxQFBMsOWI8dM3T+hFC90lJ5y2yZU3qrfz1bjNIvcSM50abVlJRD
 BHdiW5J82lNeb7hLZ2SMU9XMpyEPXEZGeyi/OAOmizHnOZbKlWc1HzVP9Ovr1Q/jpMKg
 gYUQ==
X-Gm-Message-State: AOAM532o5PXoMcXbnXkgf7Dipd10TJPoi2syMIBS5ADjGKYLR2/kTtlg
 2GsSdxOUFdgUBije3mO22Sc=
X-Google-Smtp-Source: ABdhPJwlCA1nEptsJzyICp1Rx4NE3Ree3rI2P32hSpLqUGHaf+J9D3Cf2PTUrbl2GH5UxV8f5DXGGw==
X-Received: by 2002:a17:90a:8543:: with SMTP id
 a3mr3883946pjw.13.1605607041131; 
 Tue, 17 Nov 2020 01:57:21 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:43e:59af:bc1b:1de0:7718:e8a1])
 by smtp.googlemail.com with ESMTPSA id o62sm2838013pjo.7.2020.11.17.01.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2020 01:57:20 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: lukas.bulwahn@gmail.com
Date: Tue, 17 Nov 2020 15:27:08 +0530
Message-Id: <20201117095708.30454-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: add fix option for
	ASSIGNMENT_CONTINUATIONS
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

Currently, checkpatch warns us if an assignment operator is placed
at the start of a line and not at the end of previous line.

E.g., running checkpatch on commit 8195b1396ec8 ("hv_netvsc: fix
deadlock on hotplug") reports:

CHECK: Assignment operator '=' should be on the previous line
+	struct netvsc_device *nvdev
+		= container_of(w, struct netvsc_device, subchan_work);

Provide a simple fix by appending assignment operator to the previous
line and removing from the current line, if both the lines are additions
(ie start with '+')

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
Changes in v2:
add check if both the lines are additions (ie start with '+')

 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index c9aaaa443265..e0cb36369b2f 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3542,8 +3542,14 @@ sub process {
 
 # check for assignments on the start of a line
 		if ($sline =~ /^\+\s+($Assignment)[^=]/) {
-			CHK("ASSIGNMENT_CONTINUATIONS",
-			    "Assignment operator '$1' should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("ASSIGNMENT_CONTINUATIONS",
+				"Assignment operator '$1' should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# add assignment operator to the previous line, remove from current line
+				$fixed[$fixlinenr - 1] .= " $operator";
+				$fixed[$fixlinenr] =~ s/$operator\s*//;
+			}
 		}
 
 # check for && or || at the start of a line
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
