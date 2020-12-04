Return-Path: <SRS0=7gRg=FI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E146BC2BB40
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 14:40:14 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91DBC22B2D
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  4 Dec 2020 14:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91DBC22B2D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4A56A8838C;
	Fri,  4 Dec 2020 14:40:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9smtEdTU5ZtD; Fri,  4 Dec 2020 14:40:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id C57FB8839B;
	Fri,  4 Dec 2020 14:40:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A95EBC0FA8;
	Fri,  4 Dec 2020 14:40:13 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9FBA5C013B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 14:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 9B17A87CB5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 14:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xOLj3KnlWeYz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 14:40:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 7037A87CB3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  4 Dec 2020 14:40:10 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id v3so3177608plz.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Dec 2020 06:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QbGG+QSHQ3ZiuhAQdumnEcGwmaXAKMHyqeMSedOarG8=;
 b=pCdeO8ca1BLD8/+3MrfyO1Oaf0o02KRsUH5zSuWitu5IAXiq09fT7hetTlPVAhu78m
 UkAa+0hmWkUOcjGK6uS6M7wv9/yr5RTAUh8eoK294muZY44AXcWQAb2eAx7C+XxEbev4
 B0Ris1Hf5ZpeC/bV/Yy4vHxqYsDiCFQqjwGCUDKYNFmsJKvvonzq9X0o9ZZZnMJHIYsj
 Ifcz5vjSBevjTC4i0GRX6yE90mIhXMIZG8CiYhzJoEEyABVEVbDK1CT9ZkgQ5ADpSLUs
 l4b7J8QeNCZyVVdPJ7xChghuZyEEcO73WEhovoanHmE+k5sJX+3DJkk8lyu5MR0zdYzj
 bKig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QbGG+QSHQ3ZiuhAQdumnEcGwmaXAKMHyqeMSedOarG8=;
 b=CX8tWMTxodjBaJnzTDxMlJf7tzXyz5JJAjFvLhboiz5IUIzvtGYSOCRf5we5hCWOhn
 iT1RNFAsd71xFFsYD5F6mWF4wWx5i9LsIaLYiXCBGakQjOWE78BiROBtq2HPeXNfIFkD
 FsRN3xYR/9ui1YUWnOhQ6c9gj2R7OGoQJybryTVIxn1iDZeJGRXsPcLFm5ylFyrPpDmp
 JcXIrafsqGka6oEbdMrNcWY0STPG7goHj3GN87yfFJ7fFC4fZUSsMs89zPtnAd0oanMo
 ADRjGV7k1+SjYj4nvoZLxcbu0SxLs/a7Nv0+KI56UZRuIVhOfNfNQqktpoKU3buQ3j/E
 1lEQ==
X-Gm-Message-State: AOAM5313ACZleug5+1ayKRveQ++OkMFc+n6NJ9CZtcly4ORAD0Uek0QO
 U+9V3Dux6LFdKC2B8DJs59Q=
X-Google-Smtp-Source: ABdhPJwX7nzTsLtA7yQjhbEF6V6IBUFuFwSQNYLS1ZauHkXgYQ4viF1Zz/SNOraBkisdVNmarie8QA==
X-Received: by 2002:a17:902:76c1:b029:da:2f5:ed5d with SMTP id
 j1-20020a17090276c1b02900da02f5ed5dmr4231470plt.25.1607092809768; 
 Fri, 04 Dec 2020 06:40:09 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:43f:b9bb:d059:d26:c75b:b30a])
 by smtp.googlemail.com with ESMTPSA id
 y69sm2435140pfg.75.2020.12.04.06.40.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 06:40:09 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Fri,  4 Dec 2020 20:10:00 +0530
Message-Id: <20201204144000.21734-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
References: <a2c74693-93ae-cd5a-7836-4ffff643fc09@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v6] checkpatch: add fix for
	non-standard signature - co-authored-by
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

Currently, checkpatch.pl warns us for BAD_SIGN_OFF on the usage of
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
applies perfectly on the latest next-20201204 branch

changes in v2: replace commit specific example with brief evaluation

changes in v3: provide rationale to users for every signature tag suggestion;
modify commit message describing arrival to conclusion in a structured way

changes in v4: modify rationale for certain suggestions

changes in v5: remove the tag deletion suggestions, ie "Generated-by" and "Celebrated-by"; rebase on last accepted changes; modify commit message

changes in v6: reduce tag suggestions to only "Co-authored-by"; modify commit message accordingly; include complete version changelog

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
