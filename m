Return-Path: <SRS0=cM1+=3K=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581E7C2D0CE
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:25:29 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 161322073A
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 21 Jan 2020 12:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vcJByH8E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 161322073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id D2EAE1FF59;
	Tue, 21 Jan 2020 12:25:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZL7Se1dJ6UP; Tue, 21 Jan 2020 12:25:23 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 8EEE3204DC;
	Tue, 21 Jan 2020 12:25:23 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 681E6C0176;
	Tue, 21 Jan 2020 12:25:23 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 91276C0174
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:25:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 8A11D86762
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:25:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8rjoHOHUuPbH
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:25:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
 [209.85.215.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 686858618C
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 12:25:16 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id r11so1419743pgf.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Jan 2020 04:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1brXa2k7mZVlrYO/2Iox/x78nooL7rko+woUwHappp8=;
 b=vcJByH8EX/HyjBddbY8rRwClzMwpAORu307BToJxvW4wNwk5XdOOL4kYv9g9OllwZd
 849ZH2dKM6amiQCblT4eKtKe3bPE+l+L+Ot40ogX7B+UybW8UCW/CXtv7FfnWhakXAf/
 lqOZ/wQnnOt6J1OiKaAcHTQYlS9VYSfRFl1dSBKe2hHTCVbXMqzpTgqBntPfhSeL6rno
 6bydeMZrDkEOR0EXxdARRafei5GsPsTAqgyhF+DC1JLQujFad0o6KOGHyb/i+dm9AUOZ
 tZjZHhWto2pqzN+MZqrvuhK2x0bWtRIX/84krJ/AW7CvGvM3o5Iv9y/cjS0AyKmI3P/o
 YVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1brXa2k7mZVlrYO/2Iox/x78nooL7rko+woUwHappp8=;
 b=CO3R4YkAr3YW2CQuQoiJki+7U9rSv8DAJUj5WOLYbyFbOxyfGUVnKmDTlShaJI8kH3
 PoNq8m13Rf1ZqDu2y2M7FOBqPxaQHIxgONWjRKGYul2GOEmcIQibu4qWhk8425Mv3vsT
 OoeN65nyDTMR0RRVBjjDkkALl4x6IDpU4pQ6IO/IxmX0rXmWei4dmqigNkpq7HAI8Sgy
 CCn++YkUl6eutMiinYxbrG6EKdkdvZ84NUSAKSltYThrWTSiWZsADa+J5etuLgK5PkmF
 CZmZ8MVhLMp7nepk57X+ZVTFxvdMbq4+s+c6mlxvC9K4uD6zvmUV+It6Y1SsPaxY8TXR
 yqRg==
X-Gm-Message-State: APjAAAXX2cgZosNKRRsLH8GLVgZecLqanjUtfgS/+9+U/qhyJ+kcakWn
 ErIeEAOI2tIPs0C1fSi1FOw=
X-Google-Smtp-Source: APXvYqxGWol6flMmuT0EUQSjed7DunPgVYs1ZdoMOi+/6oR8cqLxrzGAVaNBDKW5NHz9kD9L1hsaGw==
X-Received: by 2002:a65:4c82:: with SMTP id m2mr4987048pgt.432.1579609515942; 
 Tue, 21 Jan 2020 04:25:15 -0800 (PST)
Received: from localhost.localdomain ([2402:3a80:167e:da7:fcf8:ab67:c0bb:e29])
 by smtp.gmail.com with ESMTPSA id
 h11sm40479560pgv.38.2020.01.21.04.25.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 04:25:15 -0800 (PST)
From: Jaskaran Singh <jaskaransingh7654321@gmail.com>
To: cocci@systeme.lip6.fr
Date: Tue, 21 Jan 2020 17:54:56 +0530
Message-Id: <20200121122458.5513-1-jaskaransingh7654321@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
References: <20200121080455.24748-1-jaskaransingh7654321@gmail.com>
MIME-Version: 1.0
Cc: julia.lawall@inria.fr, linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v3 0/3] cocci: Improve management of
	macros before typedefs
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

This patch series is for improving the management of the following
case:

<macro> <typedef> <ident>

If <typedef> is a known typedef (such as u8 or *_t) then label <macro> as a
CppMacro. Subsequent cases will continue to label <typedef> correctly as a
typedef identifier.

Also add bool to the list of known typedefs so that cases of

<macro> bool <ident>

are handled correctly just like any known typedef will be.

Changes in v3:
--------------
- Change "subsequent cases will label" to "subsequent cases will continue to
  label" in commit messages of Patch 0/3 and Patch 1/3.
- Change the term "typedef ident" to "typedef identifier" wherever
  suitable.
- Add metavariable symbol false to tests/macro_before_bool.cocci to
  suppress warning.

Changes in v2:
--------------
- Group these patches as a series for clarity
- Add a test case for <macro> bool <ident> (Patch 3/3)
- Explain what has been improved with Patch 2/3

 parsing_c/parsing_hacks.ml    |   37 ++++++++++++++++++++++++++++++++++++-
 tests/macro_before_bool.c     |    4 ++++
 tests/macro_before_bool.cocci |   10 ++++++++++
 tests/macro_before_bool.res   |    5 +++++
 4 files changed, 55 insertions(+), 1 deletion(-)


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
