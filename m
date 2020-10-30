Return-Path: <SRS0=/L4e=EF=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DF84C4742C
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:45:05 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CACEE2087E
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 30 Oct 2020 11:45:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l3FY7hEq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CACEE2087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 36D6A86943;
	Fri, 30 Oct 2020 11:45:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtJNviVED4tM; Fri, 30 Oct 2020 11:45:03 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 5487886877;
	Fri, 30 Oct 2020 11:45:03 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 283E4C1AD5;
	Fri, 30 Oct 2020 11:45:03 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E98EFC0859
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:45:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D939E84C99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:45:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K+g1+FR2TGdz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:44:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 3B34F867C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 11:44:58 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id r186so5010887pgr.0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 30 Oct 2020 04:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rAXM+9VMNaPbsfyoH/HWf0b+QAumMPRuShgqJW6Vef4=;
 b=l3FY7hEqq4Gy26gPUfe+oYIFkiOmx41+whEQvJIPdVAIGPtKmalOPVukJjlbxLMLA5
 chxvz6l2VhA+VqfKKA/A/7qd7kJ32RunmW1OcH4YSMyzUkMP4PQsqPL9xItJSTj8dhAg
 E3QMqvTzRJgd2pEYze+cdbrA8Vx8x9VSYzWgqe5/TcdgU/2R/vBVCJx6k0wimYorQG1/
 bK6JsDjM0MLJFgEiIskW7BehMEdmDsBhpe6HIwaF9VX6CQLdfmcNL1J+sdlocMotU0Uk
 drV0I42d8qLtnTjYF7lpWfOhKZoIGNV8N5zZyu+EHqSLDwGhtsGoPBYMkjrEUcS8EI2u
 1nCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rAXM+9VMNaPbsfyoH/HWf0b+QAumMPRuShgqJW6Vef4=;
 b=dSOPrR0zyyv/a95PbSWTwbg2Ytjc0N4lNQE19V9W56KzjkDuPpAoff+bQrcoMZCLUW
 6T/I2LMNX3ti702hzwPswrbFimkdG900pQeVQmxuaiDZoBXe0nUhOEQBDtCniGEAGeHY
 zBmrZEIYmKmZgtbxtBljdTNqkcezlfmpuEbY1QxXjqL8FFIg/JIsXptW5C7HT8jmMeOj
 AX4o0/fsSjwFCnUEvDzTHYq6E7tmnvYMwdpM0HsQoDt0ta44hXL9CuKYsPAsOomIw6AN
 qFHKQ21ljjmq8yFsk/gZxVVlW1BP+fq4sf5SoA258jXkOxDUCXLoIX0xiefYhwzpV2ac
 zn/A==
X-Gm-Message-State: AOAM531M6I52wSUdnNLPhYkFdFhnACCN1yv97kfWrSD5F1uk21RqrVEB
 /2T2NrhfC6n/HceNO5kPRqU=
X-Google-Smtp-Source: ABdhPJwL8jWaZ6AzwkMA8y2syPtLZUqNZ9UrHMYgVcQVoPjgoUbsZ4ze4hdMYi9V0QOvo79rinkCDg==
X-Received: by 2002:a17:90b:378c:: with SMTP id
 mz12mr2449011pjb.137.1604058297578; 
 Fri, 30 Oct 2020 04:44:57 -0700 (PDT)
Received: from localhost.localdomain ([2402:3a80:43d:9a7f:2d51:fcbb:1c2a:666a])
 by smtp.googlemail.com with ESMTPSA id a10sm3135390pjq.17.2020.10.30.04.44.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 04:44:57 -0700 (PDT)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Fri, 30 Oct 2020 17:14:47 +0530
Message-Id: <20201030114447.24199-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Aditya Srivastava <yashsri421@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] checkpatch: add fix option for
	GERRIT_CHANGE_ID
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

Currently, whenever a Gerrit Change-Id is present in a commit,
checkpatch.pl warns to remove the Change-Id before submitting the patch.

E.g., running checkpatch on commit adc311a5bbf6 ("iwlwifi: bump FW
API to 53 for 22000 series") reports this error:

ERROR: Remove Gerrit Change-Id's before submitting upstream
Change-Id: I5725e46394f3f53c3069723fd513cc53c7df383d

Provide a simple fix option by simply deleting the indicated line.

Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
---
 scripts/checkpatch.pl | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 7800a090e8fe..5329927fc1c1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -2852,8 +2852,11 @@ sub process {
 
 # Check for Gerrit Change-Ids not in any patch context
 		if ($realfile eq '' && !$has_patch_separator && $line =~ /^\s*change-id:/i) {
-			ERROR("GERRIT_CHANGE_ID",
-			      "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr);
+			if (ERROR("GERRIT_CHANGE_ID",
+			          "Remove Gerrit Change-Id's before submitting upstream\n" . $herecurr) &&
+			    $fix) {
+                                fix_delete_line($fixlinenr, $rawline);
+                        }
 		}
 
 # Check if the commit log is in a possible stack dump
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
