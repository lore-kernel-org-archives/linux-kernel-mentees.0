Return-Path: <SRS0=kxRd=AR=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961F2C433DF
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:50:21 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F36320663
	for <linux-kernel-mentees@archiver.kernel.org>; Mon,  6 Jul 2020 18:50:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pPzgZ6lc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F36320663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 2C45A89464;
	Mon,  6 Jul 2020 18:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hSpO70ZCaMRh; Mon,  6 Jul 2020 18:50:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DCFE589395;
	Mon,  6 Jul 2020 18:50:11 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8490C0891;
	Mon,  6 Jul 2020 18:50:11 +0000 (UTC)
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BBC13C016F
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id AFB612667D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:50:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-1W0IKLyPmb
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:50:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
 [209.85.215.194])
 by silver.osuosl.org (Postfix) with ESMTPS id E8C6725B01
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  6 Jul 2020 18:50:08 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id j19so11928063pgm.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 06 Jul 2020 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zAMnwEL/tvrQbQoilRczoLI0yzSxDe94r+ZB0fk0iKI=;
 b=pPzgZ6lctESCf4yNSZvocgda48XgdgEV9pxgJHB43CKb5fzBDvle7NpL9VgmCQrYIA
 oh2sEwrVWxY364GuCglJI9bhVz1ua/hgc6RSIWmOEMWhGe1n2OA2PpbXAHw69+b2IblE
 PXhHhG8/KmmNf08+MKwIpafaTZWbt6apgzLrZx/AXAkltuBjukuCGgm4CAJ/HKXhhXyq
 a/K6N8vgTIaitj8ddbqWy2cSTnGcEPNfre7rcta8F+/FZeITOAE66/pkCTsy2jbmTpVY
 6FZpzSZwa6ibK5uc2hXCODkLBR9tbBssojMJklECyNE19TRIK4xpzkSaYnU9q8HC86YY
 c6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zAMnwEL/tvrQbQoilRczoLI0yzSxDe94r+ZB0fk0iKI=;
 b=lJQrPNyMEUK2LqPWfhs3ZmjNwHJfR54az/KuaWnWfYrTCZ6Y5r+ijD+8NeYJgFeiGp
 cQ+hJy7l5NnnK+POB3QJvc0KUT+PwukKaktY5hbA7c4KJVdFtumbAbMXv5i2XdA94HAt
 VHJT5bQ+s2ZGPhwWee1Vu5Bb76JzLGL1N+elX6TN4YCzjY8KhROFeD1Hc5LkeIIaDWEa
 2+LmogXXnZz1Albn79mIY83rzyWFEq+42GHFa2X88x38kzISDYr5b/wcQFN9Dh5tPDeo
 f3XsfcjWhb/ryfAr9xfbX2xglz/jKOXn+85/u49BgQGNclI0CqreoVnMFRRSd7BpvXAk
 voGA==
X-Gm-Message-State: AOAM532+5+q4B32TpRahmHB75Yr72OrNSHXkkNKLzvIKvzgXyy06DF7M
 KNAcCzi30bArrjCuxhig7VE=
X-Google-Smtp-Source: ABdhPJx8jqUNnxr33Dd0Sxj14TdJZMYzGKpNHJEeiBKN9vydCiKtSnozIg/wxuZYz3AvERlasC5j3Q==
X-Received: by 2002:a63:4521:: with SMTP id s33mr33563250pga.388.1594061408416; 
 Mon, 06 Jul 2020 11:50:08 -0700 (PDT)
Received: from localhost.localdomain ([210.56.100.149])
 by smtp.googlemail.com with ESMTPSA id
 f131sm20634923pgc.14.2020.07.06.11.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 11:50:08 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Date: Tue,  7 Jul 2020 00:19:56 +0530
Message-Id: <20200706184956.6928-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Cc: linux-doc@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, Puranjay Mohan <puranjay12@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH v2] Security: Documentation: Replace
	deprecated :c:func: Usage
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

Replace :c:func: with ``func()`` as the previous usage is deprecated.
Remove an extra ')' to fix broken cross reference.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
V2: Remove ``quotes`` around function names
V1: Change the subject line and remove deprecated :c:func: usage
---
 Documentation/security/credentials.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/security/credentials.rst b/Documentation/security/credentials.rst
index 282e79feee6a..15175b11336c 100644
--- a/Documentation/security/credentials.rst
+++ b/Documentation/security/credentials.rst
@@ -453,9 +453,9 @@ still at this point.
 
 When replacing the group list, the new list must be sorted before it
 is added to the credential, as a binary search is used to test for
-membership.  In practice, this means :c:func:`groups_sort` should be
-called before :c:func:`set_groups` or :c:func:`set_current_groups`.
-:c:func:`groups_sort)` must not be called on a ``struct group_list`` which
+membership.  In practice, this means groups_sort() should be
+called before set_groups() or set_current_groups().
+groups_sort() must not be called on a ``struct group_list`` which
 is shared as it may permute elements as part of the sorting process
 even if the array is already sorted.
 
-- 
2.27.0

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
