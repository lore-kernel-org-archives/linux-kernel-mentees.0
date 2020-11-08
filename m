Return-Path: <SRS0=ep41=EO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EB53C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 13:42:10 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02770206E3
	for <linux-kernel-mentees@archiver.kernel.org>; Sun,  8 Nov 2020 13:42:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fewasmt+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02770206E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9FE4B86126;
	Sun,  8 Nov 2020 13:42:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jKgSuY11IcxL; Sun,  8 Nov 2020 13:42:09 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2897B86109;
	Sun,  8 Nov 2020 13:42:09 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0E0DEC088B;
	Sun,  8 Nov 2020 13:42:09 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29FA8C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1BD4186126
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:42:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9OHIOwxhn075
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:42:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 7A9B886109
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun,  8 Nov 2020 13:42:07 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id 10so5498829pfp.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 08 Nov 2020 05:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=e0vmOXUAgAOOzA9cqQrS6Zywvk+7YcaoYXyrZKYC2Eo=;
 b=Fewasmt+OjqxbRxAG5dCb2UdIKD0Vh9Jt9Vjpb9L+JsnfKaFUmT4hQasTKKJ4A+c4z
 gtc8FubyIHTS0lsdFw7QJNDdicWBg4/dSYBqX7vLeorhjRogvJ64TXOetyoAr2006Q6H
 4lvEwftg382gAYnWo34RlgTL15z8iDFoKbWpaopfkn2R8KY5OE7FoSUA8xyYyIE9UYG0
 Wnk741kX89VJFFmn6dB0jYMo+cHO/WjHvoSYdnZom9I2tC0c0CkTIJ8/gOtrkQBpwJcV
 CdGExHHlgp5s/0U73Sv93Q1F/gNzqoR0XO3Y9pGqmH1Iu2u/+VlF69Msx0QrDmeZ+lNC
 fhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=e0vmOXUAgAOOzA9cqQrS6Zywvk+7YcaoYXyrZKYC2Eo=;
 b=WCrTqA9/vwvbvBaUNnsftNrob48HSgWvZncDcMv6GFE1tj+8Svn/OC6USBeK9zjEMr
 gnSwlonWCYQAv52igjO0aFgEX8OzUkjFR0+1Q/3SMp8VbJZyGotnw2MaKzAHG4ve0/ot
 yjlpj9b99nzy3MED7bil1jHFOGh/0rDCNaRg7yP59YqL4ucMnEmXMmtGZMJAIRm8fOh2
 kTMOgqdPjPD7t37OmUCDJt9xk7ehQbil2BfB2gyvji8oayY4uCYGHeJ/9Hw3wokxKwrV
 cAqHmrxNrzPtrNKXzHTsxu3XyV2cHpphPG+pvsPyG0xxBl+xeLH0TyTvU4NHktzAugec
 XUEw==
X-Gm-Message-State: AOAM532L4B/kagzAOZ0hJB0yceFglmNIyNca9ifTcXb+pipi9fcn+I0o
 FqKk4QrCrYF0SBPWwmcZTvY=
X-Google-Smtp-Source: ABdhPJzRXCN0tgqWS45swsYqVKUpzb1Nqe9PGvYP0qQDNbPbf+EZDV0PSogQf8Wox4thTSk1qjb2iA==
X-Received: by 2002:a63:4d0e:: with SMTP id a14mr8898456pgb.91.1604842926950; 
 Sun, 08 Nov 2020 05:42:06 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:42f:431f:a8c7:19b8:cb80:f5a3])
 by smtp.googlemail.com with ESMTPSA id t74sm8418148pfc.47.2020.11.08.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2020 05:42:06 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sun,  8 Nov 2020 19:11:57 +0530
Message-Id: <20201108134157.25308-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: dwaipayanray1@gmail.com, linux-kernel-mentees@lists.linuxfoundation.org,
 yashsri421@gmail.com
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

A quick evaluation on v4.13..v5.8 showed that this fix was getting
triggered 6 times.
A quick manual check found out that all fixes were correct in those
cases.

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
