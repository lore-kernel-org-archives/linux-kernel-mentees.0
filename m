Return-Path: <SRS0=uOMe=B5=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B41F1C433E1
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:46:43 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4844E207BB
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 Aug 2020 19:46:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=massaru-org.20150623.gappssmtp.com header.i=@massaru-org.20150623.gappssmtp.com header.b="c/WAoo8K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4844E207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=massaru.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id E7030870A9;
	Wed, 19 Aug 2020 19:46:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ez6eyOxsUyya; Wed, 19 Aug 2020 19:46:42 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 66B9186DC6;
	Wed, 19 Aug 2020 19:46:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 4B53CC0889;
	Wed, 19 Aug 2020 19:46:42 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 27B40C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 1663E86166
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:46:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6LGBIp00-oYa
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:46:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id CD3A486160
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 19:46:39 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id 77so22726815qkm.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 Aug 2020 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=massaru-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwdlULMTaTE30yELl6QtQGZwxv6wjr+YnW2F2X4a+zg=;
 b=c/WAoo8K/Yqw75x+/yTAPBMGd8P18fZS2iAYS5ipm3w9Ruq3JxzeY1uwAFab9Luan/
 q1Fke9T39saOlrB5er41jfEkGH7Oa8bzUUqQI99WQkWv5uIRX8Bp1nMKYey3cKqqe5Qg
 pT3TD8hxoFTgm6BkOdgWgE5+XQjB37NDanXj5Wd3Q5D+i/0ndalNkrkIYN6pVMhaeBjI
 LJ5bAt1W8x6IESQXPWp/1EJEdl/L1kkbBgyhYoptE07q6EhGOblUKFDCMbtnIfJUVeIU
 5KCHiHL6FiVDBhBtcAjx91kT1gnPB3n2RMJq4eCFM0tKusGe3od9t9WITGeWrhv4jUkE
 EMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BwdlULMTaTE30yELl6QtQGZwxv6wjr+YnW2F2X4a+zg=;
 b=sZXSyMRX1tOLiSSrrq3mCT/M/MtLrGmq0t5jZQ5omJkXpSX8VdubNRs1mwt+EDQXo9
 b4qgePn7diSDzFMqI5tS9g01N7XpHoiruH/vDVkV0mSQCaVWyN9Uc4OsHiyLYm3B+p8A
 wb9mHr3YLLbBt2pI1QE6OptB9712fKpG5DQ25DNFrrbKBDEBCfJJPg4EaBM+ytoQMw9G
 4aDwiTAQnF7R7UCej2f1Ld6nTDHzeY+QUEVSTqhlnuxu4qGw49rRidtCO+dCLxmWn1jW
 csupV3efS1OmcJRiy0p+9ocFRTXb4hBVrqK3wtAqaattxhzrGCTHitblbgtFWXLDuJyV
 U8rQ==
X-Gm-Message-State: AOAM531sAGK095ArMTexHpdkZ51LT+90HBHepWM/8wcFwAMamc5gWevu
 iBg0Gkpp0LEUg269ScPKKeH3wg==
X-Google-Smtp-Source: ABdhPJyKX/MDCHQWdQ7HhGON2G6xeCj2o3kWMNc+YE32/pZH7fM1NWt9kefHSiCJXUl04z31vwRgZA==
X-Received: by 2002:a37:a64a:: with SMTP id p71mr23616034qke.296.1597866398525; 
 Wed, 19 Aug 2020 12:46:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:4a5:288::1001])
 by smtp.gmail.com with ESMTPSA id x28sm25448344qki.55.2020.08.19.12.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 12:46:38 -0700 (PDT)
From: Vitor Massaru Iha <vitor@massaru.org>
To: kunit-dev@googlegroups.com
Date: Wed, 19 Aug 2020 16:46:34 -0300
Message-Id: <20200819194634.68976-1-vitor@massaru.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: linux-kernel-mentees@lists.linuxfoundation.org, brendanhiggins@google.com,
 linux-kselftest@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] kunit: fix:
	kunit_binary_assert_format() only prints signed int
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

Some tests, such as overflow_kunit(), uses unsigned int,
But kunit_binary_assert_format() only prints signed int,
this commit also deals with the unsigned int print.

Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
---
 lib/kunit/assert.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/lib/kunit/assert.c b/lib/kunit/assert.c
index 202f9fdeed0e..3ae90c09986a 100644
--- a/lib/kunit/assert.c
+++ b/lib/kunit/assert.c
@@ -104,12 +104,23 @@ void kunit_binary_assert_format(const struct kunit_assert *assert,
 				  binary_assert->left_text,
 				  binary_assert->operation,
 				  binary_assert->right_text);
-		string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
+
+		if (binary_assert->left_value - 1 < 0) {
+			string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld\n",
+				  binary_assert->left_text,
+				  binary_assert->left_value);
+			string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
+				  binary_assert->right_text,
+				  binary_assert->right_value);
+		}
+		else {
+			string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu\n",
 				  binary_assert->left_text,
 				  binary_assert->left_value);
-		string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %lld",
+			string_stream_add(stream, KUNIT_SUBSUBTEST_INDENT "%s == %llu",
 				  binary_assert->right_text,
 				  binary_assert->right_value);
+		}
 	}
 	kunit_assert_print_msg(assert, stream);
 }

base-commit: d43c7fb05765152d4d4a39a8ef957c4ea14d8847
prerequisite-patch-id: bf4b0962b0b955e4e45f5d25fece889562118158
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
