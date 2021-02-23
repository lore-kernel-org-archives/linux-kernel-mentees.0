Return-Path: <SRS0=pe2G=HZ=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297E6C433DB
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Feb 2021 06:43:50 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CD8B64E21
	for <linux-kernel-mentees@archiver.kernel.org>; Tue, 23 Feb 2021 06:43:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CD8B64E21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 3F12687146;
	Tue, 23 Feb 2021 06:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eUR458VLacRq; Tue, 23 Feb 2021 06:43:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 6DF4787144;
	Tue, 23 Feb 2021 06:43:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 529E4C000B;
	Tue, 23 Feb 2021 06:43:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F22B1C0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 06:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D76E883118
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 06:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9j65YNkv9Is0
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 06:43:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DD1983103
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 23 Feb 2021 06:43:44 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id p21so9503978lfu.11
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 22 Feb 2021 22:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TzOCAdEwWA3QxxBM+Z2WR+5WQ3jj+pgReYpklWmgk8=;
 b=Y0S3XTcLq+EFh5ihi+XrK4RzccttbfIVXNtXH/2cxLWWxX6JpdP62cyzgo4NDBI1E+
 58mqgj/22I7yzUH3M4/Z4lymlgR22mPNuDBvMtkD+EIqIyGRMJeDRt0nQyf4fS9BEnPJ
 CySFJ9c1XQIj+7PO/kMs6e8ul6aUk7VehpObnTmrJ0dIEr6hSr18Z6+Ytlizsk81cFiX
 cB7ICQmvNZBVzSz5h6zqGr285kRnxdfkH6KaIuogx2jDKV13xqK2/viZlE830pyQAi5e
 IdlUd87XKYE9j7U0aiJF9qMkTk4IqnuM2ToiyQXucAKrSMfWuCZax4gsml9qgX6JykpS
 m0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+TzOCAdEwWA3QxxBM+Z2WR+5WQ3jj+pgReYpklWmgk8=;
 b=m7vnXtMrVArBfi1HlyvytWqqBL7sh9izzrjB+p2nMmHCIeJZp5K52fyBZlHUDfof2d
 D6TZ7OVnLl74ILp0/FnWMB4Bn39lwKuLqY367Itu4LMjT3my9YIhz+fRImq55oxriDg/
 fCth/OZQ0wfmziFjKRRETZJAd/6YFDoK+t2DmwvrKGqhLVmw5gB3vSy082QZBtlFQCX8
 U4toeXk4TsH7oqOWY/cUrHaX0NwN7BWMwqSvCqk3OsWJxlT5gv3RfcR0LXzuYFF5/j3o
 OqVyhj+JkCgbfLVhRsoeue0G/V2msyqCqwUAlx6U+STx7bhRbCizoEXoLkEnnkLRFklF
 6qqw==
X-Gm-Message-State: AOAM533SnZBcC3BvkjjfqbyE4Fr7VUMAjOar7/B8ggmpiSyST+w7asPE
 HoP5B3gIMv56iVp1fVAfoAE=
X-Google-Smtp-Source: ABdhPJxRL1hRSxTPI+v0Fvh2bhJ9gzXMjm4xZjdZj02NMNox916xjKwB5LSZz0dgxfIjYZK5/PSaMg==
X-Received: by 2002:ac2:4561:: with SMTP id k1mr701601lfm.544.1614062621805;
 Mon, 22 Feb 2021 22:43:41 -0800 (PST)
Received: from localhost.localdomain (cable-hki-50dc98-67.dhcp.inet.fi.
 [80.220.152.67])
 by smtp.gmail.com with ESMTPSA id c9sm1574876lfc.208.2021.02.22.22.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 22:43:41 -0800 (PST)
From: Hassan Shahbazi <h.shahbazi.git@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 23 Feb 2021 08:42:29 +0200
Message-Id: <20210223064227.62631-1-h.shahbazi.git@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Cc: devel@driverdev.osuosl.org, Hassan Shahbazi <h.shahbazi.git@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org
Subject: [Linux-kernel-mentees] [PATCH] drivers: staging: wimax: fix code
	style issues
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

Fixes 'WARNING: Missing a blank line after declarations' generated by
checkpatch.pl script.

Signed-off-by: Hassan Shahbazi <h.shahbazi.git@gmail.com>
---
 drivers/staging/wimax/stack.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/wimax/stack.c b/drivers/staging/wimax/stack.c
index ace24a6dfd2d..0d0f6ab79bf5 100644
--- a/drivers/staging/wimax/stack.c
+++ b/drivers/staging/wimax/stack.c
@@ -156,6 +156,7 @@ int wimax_gnl_re_state_change_send(
 {
 	int result = 0;
 	struct device *dev = wimax_dev_to_dev(wimax_dev);
+
 	d_fnstart(3, dev, "(wimax_dev %p report_skb %p)\n",
 		  wimax_dev, report_skb);
 	if (report_skb == NULL) {
@@ -362,6 +363,7 @@ EXPORT_SYMBOL_GPL(wimax_state_change);
 enum wimax_st wimax_state_get(struct wimax_dev *wimax_dev)
 {
 	enum wimax_st state;
+
 	mutex_lock(&wimax_dev->mutex);
 	state = wimax_dev->state;
 	mutex_unlock(&wimax_dev->mutex);
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
