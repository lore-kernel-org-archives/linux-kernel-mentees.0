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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A89C388F9
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:04:26 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9021122226
	for <linux-kernel-mentees@archiver.kernel.org>; Sat, 21 Nov 2020 12:04:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AM18rV8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9021122226
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1D01985F98;
	Sat, 21 Nov 2020 12:04:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zcU3wjRg4XOF; Sat, 21 Nov 2020 12:04:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 52A6C85A80;
	Sat, 21 Nov 2020 12:04:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4E9E8C163C;
	Sat, 21 Nov 2020 12:04:20 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CAE10C0891
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id B7BD685A80
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:04:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AeLQcelOl3K6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:04:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0DCF2857E2
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 12:04:18 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id j19so9780421pgg.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 21 Nov 2020 04:04:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vB6erz0iSltUmu1ups0rIJoifSN+h/NyHvYUgOGpG0U=;
 b=AM18rV8EoPHDgb8rbLV1eD9SADIObHan1JDSifwQ4wEpc/PU43mcI2qhEP9yWDTbLm
 ul/aDEpZdon8RpIlmTQLWwjEQYj9mjva0LAvF2a96zEoW3KFMmfg5XEYedE/NAZlA5i9
 XJd/kNopIfEzxn927gnlI0HeP94omfvCJw0G3q6SY/n6Zax1YbAR3Y5QhqRqPMzYO3Qm
 OQPZoRpJvdQd1o2CxDGrIKjBIjGWYHkby6E/1Xt6o5FlgTGT1GpWYm8pMcY3ezxtTHaX
 8ql0YawT3L7hyc3vDwcS515iRw9xxSZjDQ8MXGwrjKU4fDiC3rjVHwGiFPJpfeQ5sKHI
 vb0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vB6erz0iSltUmu1ups0rIJoifSN+h/NyHvYUgOGpG0U=;
 b=kmBcT4pn0nuZR+JvxV6uUk3SgMZ31dVMIPRuZfe3LWQNTT7GM9DLCBfevB0yo2PvUo
 JNCTix6ErrzXsCcB8lfFia3eiJtg8uGgwEbEcAUw/W0L5FxQX7oH+0ww1wkUX9eVw0Vi
 zNSVttGtaWaFoB1ZFaTDQ5Sd3iD2Dn3CniMWSHVuKMQdzxdHkr7B2rTQneXXpLef/QsM
 CT3w6kI3xi0ZFIBhnyI/+OrDxnQu2E6rKLqptgdB3k1bZBh1lteZqQiEd9V0dDzNrsxk
 BbxdBZWduZUkLi9HeY2jryyZRMcakmOHGnpr/51W7WdQ/FGQ7Vl9i7U5FFWn6q239xBM
 F+bA==
X-Gm-Message-State: AOAM532/BF2Df3KSBr/+l4wDGuqLrdhkCBuX6tby/JPHFDVYInuRrS8S
 JDGkI8VAujmp54pQwVNVVn4=
X-Google-Smtp-Source: ABdhPJz2OyHbBcTaKG10mjWhy7fajs265EV2JNvpT80dysb/xRrR5X8qVxGMJg+9V31RDbEUstZWUw==
X-Received: by 2002:aa7:9395:0:b029:18b:bd17:2ea with SMTP id
 t21-20020aa793950000b029018bbd1702eamr18304344pfe.48.1605960257558; 
 Sat, 21 Nov 2020 04:04:17 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:400:4498:ed91:20bf:333c:1bc4])
 by smtp.googlemail.com with ESMTPSA id 15sm15460199pjy.0.2020.11.21.04.04.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2020 04:04:16 -0800 (PST)
From: Aditya Srivastava <yashsri421@gmail.com>
To: joe@perches.com
Date: Sat, 21 Nov 2020 17:34:07 +0530
Message-Id: <20201121120407.22942-1-yashsri421@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <1d7692d0-359f-6b6a-32d4-1627ebd8b100@gmail.com>
References: <1d7692d0-359f-6b6a-32d4-1627ebd8b100@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com
Subject: [Linux-kernel-mentees] [PATCH v4] checkpatch: add fix option for
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

Changes in v3:
quote $operator; test with division assignment operator ('/=')

Changes in v4:
fix incorrect use of quote

 scripts/checkpatch.pl | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 2749f32dffe9..d4c8d42cb13e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3533,8 +3533,14 @@ sub process {
 
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
+				$fixed[$fixlinenr] =~ s/\Q$operator\E\s*//;
+			}
 		}
 
 # check for && or || at the start of a line
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
