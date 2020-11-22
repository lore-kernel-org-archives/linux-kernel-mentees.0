Return-Path: <SRS0=zGdC=E4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCADC63777
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 11:10:40 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C7EF20936
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 11:10:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OiUOiiJI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C7EF20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 17EEB86365;
	Sun, 22 Nov 2020 11:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uSPbhF9P-bpU; Sun, 22 Nov 2020 11:10:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id A0C35862E4;
	Sun, 22 Nov 2020 11:10:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 85A54C0891;
	Sun, 22 Nov 2020 11:10:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 01551C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id DA8BB86365
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:10:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AxZMC2kAMPpW
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:10:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4D63E862E4
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 11:10:36 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id w6so12216165pfu.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 03:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=CVH5IQJC2i5boVYg8xv9KMvfHv3c/wN7xTCKIYiu7zc=;
 b=OiUOiiJIxe11MFzjnGn7H9TIvg6lg4fvYqXN/hv8RCrCYEFro2emd/WlxcLD8BjGP+
 HHgg1CLPj4tsZxJnBLonkHL3z/p5J27H7vlkbslenXwk379S2/im1gojqoAjzeW2qcUP
 OjtSKPTQf5QHzN/HefLgFs5t+RErArliGednD71jTAZWU7B5jO8KosRgcG52ax+buvH5
 8baF2E4wVg79MhYDqNzy0ybLklFDUTrw0pRj8tUS+gdJzO0CavBeaPAcgqdRy13T5rcu
 +kUFBLO1uMxfaDfQ2fmV1VsDq8D9JoXHpYUpqK8VRDhbNEvxl4fDJdX9z2+vo5QaQejm
 h0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=CVH5IQJC2i5boVYg8xv9KMvfHv3c/wN7xTCKIYiu7zc=;
 b=QQ/8sfjLbEHlBrmqjS1ADboNCGP1spXZrhBWLUpe3ZVao5+FweP5IJKVcQ4ua+L7c2
 FdOv8p5a+YTJ2kCk6jP1AGv8NMc/3PccRhk5mVPxMICChM99VJjCnFAqk8X/loAKbT0H
 MAYQr8LKHTdVOytLcAdec2JJe8fb6965jC6+AA3IXbKUUFVVxEKsUQx+8mSdd+w7rdPm
 gBBe6z/VhVFAb1cKKbAt5ZKPRf3OVB4EC7JSPAVtWka1zJh18+lP6wHtwo7tW2no2kck
 Ko86RZjeV0nNd85ptNe4D9LCDjMQjbhO3njN+DGi8dGEcPC8e6uZXmnr6M5WYYOVX9T+
 tPhQ==
X-Gm-Message-State: AOAM533tFEvMivHMCAJ7J3FV61cprAdeE96QM7R6Y+77Nd2dJpyztBPf
 2B6+ALUGdMOK23+6oAVBn5k=
X-Google-Smtp-Source: ABdhPJwdTrsqTE9+bKbXqvLz1hwnA4mcRhGZwRcARKYmnNDKa79EKogodTPl1u9nfaQSsSsam6DtnQ==
X-Received: by 2002:a63:f20:: with SMTP id e32mr23711028pgl.130.1606043435693; 
 Sun, 22 Nov 2020 03:10:35 -0800 (PST)
Received: from localhost.localdomain ([42.111.137.80])
 by smtp.googlemail.com with ESMTPSA id 5sm9520234pfx.63.2020.11.22.03.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 03:10:35 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sun, 22 Nov 2020 16:40:25 +0530
Message-Id: <20201122111025.17978-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1823e72eb92280d30457dda49e0a0036dee15dd3.camel@perches.com>
References: <1823e72eb92280d30457dda49e0a0036dee15dd3.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v5] checkpatch: add fix option for
	LOGICAL_CONTINUATIONS
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

Currently, checkpatch warns if logical continuations are placed at the
start of a line and not at the end of previous line.

E.g., running checkpatch on commit 3485507fc272 ("staging:
bcm2835-camera: Reduce length of enum names") reports:

CHECK:LOGICAL_CONTINUATIONS: Logical continuations should be on the
previous line
+	if (!ret
+	    && camera_port ==

Provide a simple fix by adding logical operator at the end of previous
line and removing from current line, if both the lines are additions
(ie start with '+')

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2: quote $operator at substitution

changes in v3: add a check for previous line ending with comment;
If so, insert $operator at the last non-comment, non-whitespace char of the previous line

changes in v4: improve the matching mechanism by matching line termination at comment or white space;
insert the operator before comments (if any) separated by a whitespace;
append the comment and its pre-whitespace after the inserted operator (if comment was present),
ie if no comment was present nothing will be inserted after the operator

changes in v5: improve regex for comment and line end with '$;'

 scripts/checkpatch.pl | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5b1a5a65e69a..708a56f31466 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3553,8 +3553,17 @@ sub process {
 
 # check for && or || at the start of a line
 		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
-			CHK("LOGICAL_CONTINUATIONS",
-			    "Logical continuations should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("LOGICAL_CONTINUATIONS",
+				"Logical continuations should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# add logical operator to the previous line, remove from current line
+				if ($prevline =~ /[\s$;]*$/) {
+					my $line_end = substr($prevrawline, $-[0]);
+					$fixed[$fixlinenr - 1] =~ s/\Q$line_end\E/ $operator$line_end/;
+				}
+				$fixed[$fixlinenr] =~ s/\Q$operator\E\s*//;
+			}
 		}
 
 # check indentation starts on a tab stop
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
