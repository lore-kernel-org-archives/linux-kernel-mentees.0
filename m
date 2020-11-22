Return-Path: <SRS0=zGdC=E4=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42885C5519F
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 12:59:23 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8AEB2078D
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 22 Nov 2020 12:59:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEGr/uo+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8AEB2078D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5E8EC86A0F;
	Sun, 22 Nov 2020 12:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sdU9PPqctuXO; Sun, 22 Nov 2020 12:59:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DDADB86864;
	Sun, 22 Nov 2020 12:59:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C09CFC163C;
	Sun, 22 Nov 2020 12:59:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E5DCDC0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 12:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E1BF28691A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 12:59:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ocxKRbwpyQ4b
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 12:59:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1493186864
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 12:59:19 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id x24so37539pfn.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 22 Nov 2020 04:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=9SmLUL6dJlY5EsVIhDBNTqL4CGAyd1Gb/jZPmSbLDd0=;
 b=XEGr/uo+SXkDkE5mWL1n1SpeZTTmMBYncL3HeB8Xz5QEcxGsRUFYqFGGAQHPLVk11O
 ojGEaZa9SV+TsO2GR2gyOOiGuqmEltEt5dRj8PH4S4WbqPUCIJwncH8VNTbhf7dUJvw6
 vexEBu4saj+Mj9+4LcbiEqbs8V33qaAxoHFbVCCICnOHFZ3WPur9TdcvXSiU4xTadi8E
 p667UKccaZNOh2E/xicPs5ztrH/eX9BkOKEOtusXsxnq5LLeNzYhWSi5WwveZxe2ubcp
 iemc4Q7pC8s9Dmv8uuO+q7mrHpRRLELzQhTj8c01lzcmVjPOqkDwnNNMekqhxkVLdb12
 XFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=9SmLUL6dJlY5EsVIhDBNTqL4CGAyd1Gb/jZPmSbLDd0=;
 b=g0/m8/NZUSmo23zKgC1kBL2c6i2V1UUWjh1TAl/TWhURDqH8qwfu2HZh1mTogmJ2Aq
 ZiGdPOgCaZ/Hbju4iAkpMQlV8gQFkvEP3B0m7mDIqz7BJOo/Wq1QkVvV2mKioieelDYM
 Zz4Y5zrtB22KrCsPZX9ZqgLxBJ8oN9fEg+Xx/3evh91k9UQfxH0npJF+La2wpnvX47RE
 BI3CBHfqYXdcAn9mdtKKVyHvqnLdRY44slWEgT3G2w7lDLkd75EH+Mm5nsvOWReZoiZZ
 jQMovQxiDKwRTd94Ab2ZMFJjJ5rxwthItbyUywOwRdQA8uQWr4rvf/VfXDDIs4L0D3Iu
 +Lkg==
X-Gm-Message-State: AOAM531eVt9qHHkPXl+Uf38pSfRncOwHnrrbaJNbv0lcHgrLIj4TPGOP
 WpLT5GEh8b7qjmoptjtsVd8=
X-Google-Smtp-Source: ABdhPJz5cEgu3Toa32UC45hXb2CDE3MnjEgP5ZLLiIHoU/tY510iRyWXgOPSOUDjZe2ydBHwG+un5A==
X-Received: by 2002:aa7:9709:0:b029:196:45d6:88d4 with SMTP id
 a9-20020aa797090000b029019645d688d4mr21214992pfg.27.1606049958535; 
 Sun, 22 Nov 2020 04:59:18 -0800 (PST)
Received: from localhost.localdomain ([42.111.137.80])
 by smtp.googlemail.com with ESMTPSA id 12sm10961472pjn.19.2020.11.22.04.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Nov 2020 04:59:18 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sun, 22 Nov 2020 18:29:08 +0530
Message-Id: <20201122125908.22212-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <368300090d93ad66f7fb19076d076d4321a04c42.camel@perches.com>
References: <368300090d93ad66f7fb19076d076d4321a04c42.camel@perches.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v6] checkpatch: add fix option for
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

Provide a simple fix by inserting logical operator at the last
non-comment, non-whitespace char of the previous line and removing from
current line, if both the lines are additions(ie start with '+')

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

changes in v6: remove if-check; modify commit message

 scripts/checkpatch.pl | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 5b1a5a65e69a..dc5b031b45b9 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3553,8 +3553,16 @@ sub process {
 
 # check for && or || at the start of a line
 		if ($rawline =~ /^\+\s*(&&|\|\|)/) {
-			CHK("LOGICAL_CONTINUATIONS",
-			    "Logical continuations should be on the previous line\n" . $hereprev);
+			my $operator = $1;
+			if (CHK("LOGICAL_CONTINUATIONS",
+				"Logical continuations should be on the previous line\n" . $hereprev) &&
+			    $fix && $prevrawline =~ /^\+/) {
+				# insert logical operator at last non-comment, non-whitepsace char on previous line
+				$prevline =~ /[\s$;]*$/;
+				my $line_end = substr($prevrawline, $-[0]);
+				$fixed[$fixlinenr - 1] =~ s/\Q$line_end\E/ $operator$line_end/;
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
