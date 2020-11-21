Return-Path: <SRS0=QJT4=E3=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C10C8C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 18:14:14 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 346EE22201
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 18:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipeZBrlt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 346EE22201
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A9B5B20443;
	Sat, 21 Nov 2020 18:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UbQbBxZsLHBt; Sat, 21 Nov 2020 18:14:12 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C9FE220381;
	Sat, 21 Nov 2020 18:14:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AB71CC1825;
	Sat, 21 Nov 2020 18:14:12 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4C969C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 2A84820443
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:14:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F8C5C4teeSeZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:14:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by silver.osuosl.org (Postfix) with ESMTPS id 72A8D20381
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 18:14:08 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id f17so1800137pge.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 10:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+/ZgAn65K2RfMWm1/R12+2z9h8SUdfpl5HlRWBvrjuw=;
 b=ipeZBrltvCVVMRe3DxVaGeYIQVgjnJwR/dPqF5qt+o4olKQYYgeeOZTKGTqyJhvy4s
 6NvLD+fgKLjcqfxy+UA3vdiTSauFu3fBV6RJ6HbTiSbjbv7Qpa4zfMIxXotH+nAV0eW+
 H7QPjB4q1W2kMC87QZtaflCKLXCQx2ICMQaCU03+0PCpOvP6Tj2uTmVnpsGqQr1OazIN
 vvp2xGui3bgNqQouxM9BxKwwbnZWetKpeLGd0nWQ7KgM7JXOdrmPY/GUTbXGGKV3+nkf
 +FmINOytMGewrr2SeEzfuZ3cBOqxn1l9BSXKHULT2Bcbkw00XkqRITGC3osy9etvFNWd
 gdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+/ZgAn65K2RfMWm1/R12+2z9h8SUdfpl5HlRWBvrjuw=;
 b=jQMpWoRZtYQnveG2/4pV5mcz8hY0+jzinikHaYl3oR08sfBDtOBxj5OnSOdTqi980j
 a381x99GReM1KDeZE2Y4Fq16vb4o9yN73tIMa59wBpL4UECnlWHoWNjZqvEp/e2I+cnN
 t9Faya+Rd16GPZFjWhIwiRnVV+w3B+t69e3jhyyuhfaF80rwP4ah+WbQEgx+dzmp3nx9
 ZZKd4KJZqntpCa/qcQgQMBI6cx3+D+e20Y/J4FlLRzViJEkNjotwkqL+QEjnV9SPPpEb
 vYab82SI137jA8HZIkRIeBXQk6Y/ue5EsGkUjbiiCRKdlrqO8hJjELlIT6CQODIOie4n
 Z+Bg==
X-Gm-Message-State: AOAM530nX8SgKjuLRAKw+l7gOQK5RQ4gxzmDiLYk4otgzPg6c6oQX614
 COW0lGHnJ6kfJ5Jqd5Roaas=
X-Google-Smtp-Source: ABdhPJzmDqpomjK6zMP+8OPnxE+MasuFLkfHmO+4FpgGlFmBCydCw0jcgsqH7UXDwJUCke7W98J+Pw==
X-Received: by 2002:a62:7883:0:b029:18a:e054:edf1 with SMTP id
 t125-20020a6278830000b029018ae054edf1mr18916039pfc.70.1605982447804; 
 Sat, 21 Nov 2020 10:14:07 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:40c:d321:ed91:20bf:333c:1bc4])
 by smtp.googlemail.com with ESMTPSA id q19sm7311072pfh.37.2020.11.21.10.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 10:14:07 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sat, 21 Nov 2020 23:43:57 +0530
Message-Id: <20201121181357.7621-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <d68afd4b87e2ce3fc846d8ca5ab9a401ce04344a.camel@perches.com>
References: <d68afd4b87e2ce3fc846d8ca5ab9a401ce04344a.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v3] checkpatch: add fix option for
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

 scripts/checkpatch.pl | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5b1a5a65e69a..533c4a6bbf12 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3553,8 +3553,22 @@ sub process {
 
 # check for && or || at the start of a line
 		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
-			CHK("LOGICAL_CONTINUATIONS",
-			    "Logical continuations should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("LOGICAL_CONTINUATIONS",
+				"Logical continuations should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# add logical operator to the previous line, remove from current line
+				# if last line ends with a comment
+				if ($prevrawline =~ /(\/\/.*)$/) {
+					my $comment = trim($1);
+					$fixed[$fixlinenr - 1] =~ s/\s*$comment//;
+					$fixed[$fixlinenr - 1] .= " $operator $comment";
+				}
+				else {
+					$fixed[$fixlinenr - 1] .= " $operator";
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
