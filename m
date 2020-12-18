Return-Path: <SRS0=3x+R=FW=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0120AC4361B
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 12:11:49 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78E4123443
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 18 Dec 2020 12:11:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78E4123443
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 04808868D6;
	Fri, 18 Dec 2020 12:11:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ihbnSw6NfHni; Fri, 18 Dec 2020 12:11:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2E0CC868AC;
	Fri, 18 Dec 2020 12:11:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1E4E2C1787;
	Fri, 18 Dec 2020 12:11:47 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D29C9C0893
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 12:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BA276878C9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 12:11:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VNReRyttWd8h
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 12:11:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
 [209.85.215.178])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 056D687897
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 12:11:45 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id f17so1205466pge.6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 18 Dec 2020 04:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Lir5dGRHwLjSomlPAkXb06BknP7+1ImyKhCDlWgaNdw=;
 b=PSR0j3LssWf3n590Kl/5HCRReDzxWwIkwGaewAN+IN3Yy+sxrJlRPXbRjbiC1s79za
 2UaABryTthjhSPMkjP5XonAQ7mZN+WDg/mIF02RrEldHCN0Uy1i+Z+++tdQEyvwYWA5m
 Vhu7B6D9mFTE2pMOy0hesGU4t3o9a5e2vcYvZvT4ptu5FqeXxx7BCBNJfqVFh4Jd6va7
 +ZkQSIKlYm91N8WMQzgcPkKN7Zev2lnxIONot5kOV6K4khpdcL9pMt5vQVAzNqbwjh0J
 DUmCEuFkFVK90GZYxhMawjGxumtnbd4nqM9Xy4cjqXd1LDo0JE0GQODzEExCTkrpLCYs
 qdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Lir5dGRHwLjSomlPAkXb06BknP7+1ImyKhCDlWgaNdw=;
 b=CsrLqAOoV/rUSrSixeORRIJT3Ilwhz9up2dwJNBsfzivgxNQJ3l7ygKVx1HUhsxi4Y
 yLC+j5iRGgoTdVAblW4EDD1LKtCRY/ujn1bK54LFcACWANLB5sIg/4+t3RWTlzJxmpwI
 SK2t7qTkFf4tz6QxSwoosl9iJeh2XM+yxMoPzG1gUruJtW279hw5J+4V4SoWdUnMM5Rv
 xTpQ7uYRL9jpydDxWXQUtDoknIGd0uylAl24K2rN1dfbn3o2a3sSeTJIyZTKLKYztg9a
 Rz1BqgrHFcRTh00Pwja7k72UhWW5BwNs9Ubzv3HgH1Yf2oderTJcm2htHAumV12+WQs9
 GkXw==
X-Gm-Message-State: AOAM531f+WnjvfbPFO2YFPDTMrh7OdGNTN4ATVgper1yOLKp9YdVo0bx
 8nkhTDRDJNuXN0GmbtVNmNQ=
X-Google-Smtp-Source: ABdhPJzBZdc9Bq2SaJxqCFnEuJzfYhbCSMGi9LhhyjhuoaYCDAAElnBYpnVoZTqOGoVfXCH27Z3ItQ==
X-Received: by 2002:a63:f745:: with SMTP id f5mr3818665pgk.119.1608293504443; 
 Fri, 18 Dec 2020 04:11:44 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:40b:fec:bcbf:34af:77f4:28f0])
 by smtp.googlemail.com with ESMTPSA id
 x1sm8499834pfc.112.2020.12.18.04.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 04:11:43 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Fri, 18 Dec 2020 17:41:33 +0530
Message-Id: <20201218121133.18614-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1ce4502a-d75a-7e27-5844-f195607c4c99@gmail.com>
References: <1ce4502a-d75a-7e27-5844-f195607c4c99@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v2] checkpatch: fix false positive
	for COMMIT_LOG_LONG_LINE with URLs
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

Currently checkpatch warns for long line in commit messages even for
URL lines.

An evaluation over v4.13..v5.8 showed that out of 11729 warnings for
this class, around 299 are due to line starting with URL.

E.g., running checkpatch on commit 3cde818cd02b ("ASoC: topology:
Consolidate how dtexts and dvalues are freed") reports this warning:

WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-January/144761.html

Avoid giving users warning for character limit for such cases, instead
suggest them to prefix the URLs with "Link:"

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
changes in v2:
- Fix coding style ('} else {')
- Make the URL check follow RFC 3986 style
- Give warning only if the URL is first non-whitespace of the line
- Set $commit_log_long_line only for else case
- Fix the warning count with exact figures and according to first non-space char as URL

 scripts/checkpatch.pl | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index abd5a3d2e913..bf77bd0b22cf 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3032,9 +3032,14 @@ sub process {
 		      $line =~ /^\s*(?:Fixes:|Link:|$signature_tags)/i ||
 					# A Fixes: or Link: line or signature tag line
 		      $commit_log_possible_stack_dump)) {
-			WARN("COMMIT_LOG_LONG_LINE",
-			     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
-			$commit_log_long_line = 1;
+			if ($line =~ /^\s*\b[a-z][\w\.\+\-]*:\/\/\S+/i) {
+				WARN("COMMIT_LOG_LONG_LINE",
+				     "Consider prefixing the URL with 'Link:'\n" . $herecurr);
+			} else {
+				WARN("COMMIT_LOG_LONG_LINE",
+				     "Possible unwrapped commit description (prefer a maximum 75 chars per line)\n" . $herecurr);
+				$commit_log_long_line = 1;
+			}
 		}
 
 # Reset possible stack dump if a blank line is found
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
