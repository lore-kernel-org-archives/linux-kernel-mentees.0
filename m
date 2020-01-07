Return-Path: <SRS0=MteQ=24=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE761C33C8C
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 17:35:25 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB39C208C4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Jan 2020 17:35:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fdk5/inR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB39C208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7C4EB860A3;
	Tue,  7 Jan 2020 17:35:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m2DI3Pc-ZlBM; Tue,  7 Jan 2020 17:35:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id DCFF48609F;
	Tue,  7 Jan 2020 17:35:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8FBDC1796;
	Tue,  7 Jan 2020 17:35:24 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 38E64C0881
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 1EA6486096
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sayF5BXs1QGR
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:35:22 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
 [209.85.214.196])
 by whitealder.osuosl.org (Postfix) with ESMTPS id B78A085F8E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Jan 2020 17:35:22 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id y8so23445982pll.13
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 07 Jan 2020 09:35:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=SJ2X7WpLg0FrWfJBUWgKBYL6TqlxNNJeppsfwwD9mMQ=;
 b=fdk5/inRsxMjh8bZaDJiNZavvsDYMaz1z6Q+wBlSAg5iKy/QmC8eN/MI/tSXtPPCtL
 wX8rVuAW1NnotCHdQRlBfJY49oe15AO0lrC/dmW901u//sL4p+jkOL741iC6+IjfcHxA
 QlJXk3Kim3KbspQspAEmnxJOLp3/EL8kfzT1VAya63ai58/jnoRIfgbBXO2AnAUx6sGz
 mNitcp2SzJA0gvOERxLUAOzVQPfx20B0TQrWRf1uiPmtJNvb75XLSoJICJFoq/Heve8N
 PG4S70cGp2UxpdEDlTWbEwC+tLCRVIJt23Pwv5P85RXhlbbhtHRwsxMUA9Xroft2Tjwe
 OYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=SJ2X7WpLg0FrWfJBUWgKBYL6TqlxNNJeppsfwwD9mMQ=;
 b=CkCIaTVQdawym9ZwuTIeOIm+6TfsHGc3MT/LxTYaR/hVqxpg4GbnYbNf5Oscpd19b2
 Z+nSYcyEYYfl2QCc1c2UGBANOwigIN6O5Lq5oWzYJsAobHha2yrYTyDNeuTJZnrmdC0W
 qA8v63OkfHoIsmDL5X7jWyUvsRPehXtu0zVgBxe86NRWaO+0mpwqA98jOW+A7wQz6wxp
 XY4n+oGndkA//JrJ9vGizA5owM9S3qUwrJemVDakHQ+NUHh+0VnhdX8exma3YMOZ0Dlr
 EzfchWr6j/7EixwrRBZSAno8bBE4XFQcEjQmzmsCZAfISA8yJMGrcQPOwWyO7rM/7aoZ
 vWdA==
X-Gm-Message-State: APjAAAWHUYbO9DMwZVvnz/x9Zx6hV6dahYE9vFE6xMh8qD6pHaVM+zB6
 xctykbzDApCZq+utBbWddiQ=
X-Google-Smtp-Source: APXvYqxIicyrXMpE6DtoTVEUGxByj1tKZgLrrAE+L6a1P/+ajmE1S+RY0vKL6wMwNYQj7M3UH/UUqA==
X-Received: by 2002:a17:90a:fb45:: with SMTP id
 iq5mr884671pjb.93.1578418522122; 
 Tue, 07 Jan 2020 09:35:22 -0800 (PST)
Received: from madhuparna-HP-Notebook.nitk.ac.in
 ([2402:3a80:1ee3:fd53:981d:523f:a647:bef8])
 by smtp.gmail.com with ESMTPSA id d3sm130091pfn.113.2020.01.07.09.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jan 2020 09:35:21 -0800 (PST)
From: madhuparnabhowmik04@gmail.com
To: dennis.dalessandro@intel.com, mike.marciniszyn@intel.com,
 dledford@redhat.com, paulmck@kernel.org
Date: Tue,  7 Jan 2020 23:05:08 +0530
Message-Id: <20200107173510.20320-1-madhuparnabhowmik04@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
 rcu@vger.kernel.org, joel@joelfernandes.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH 1/3] infiniband: hw: hfi1: verbs.c:
	Use built-in RCU list checking
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

From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>

list_for_each_entry_rcu has built-in RCU and lock checking.
Pass cond argument to list_for_each_entry_rcu.

Signed-off-by: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
---
 drivers/infiniband/hw/hfi1/verbs.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/hfi1/verbs.c b/drivers/infiniband/hw/hfi1/verbs.c
index 089e201d7550..cab2ff185240 100644
--- a/drivers/infiniband/hw/hfi1/verbs.c
+++ b/drivers/infiniband/hw/hfi1/verbs.c
@@ -515,7 +515,8 @@ static inline void hfi1_handle_packet(struct hfi1_packet *packet,
 				       opa_get_lid(packet->dlid, 9B));
 		if (!mcast)
 			goto drop;
-		list_for_each_entry_rcu(p, &mcast->qp_list, list) {
+		list_for_each_entry_rcu(p, &mcast->qp_list, list
+								lock_is_held(&(ibp->rvp.lock).dep_map)) {
 			packet->qp = p->qp;
 			if (hfi1_do_pkey_check(packet))
 				goto drop;
-- 
2.17.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
