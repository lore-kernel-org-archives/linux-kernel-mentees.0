Return-Path: <SRS0=Swos=DS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12436C43457
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:31:23 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B0AA2083B
	for <linux-kernel-mentees@archiver.kernel.org>; Sun, 11 Oct 2020 17:31:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SS4zNG6y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B0AA2083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3F02E85CFF;
	Sun, 11 Oct 2020 17:31:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kCVwocgkRj96; Sun, 11 Oct 2020 17:31:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1506185CA8;
	Sun, 11 Oct 2020 17:31:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 03F3DC07FF;
	Sun, 11 Oct 2020 17:31:21 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 7C63EC0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:31:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 5D1AB8728E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:31:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZTCu9O2+7jXn
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:31:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 96C8E871C3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 17:31:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id e7so2250518pfn.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 11 Oct 2020 10:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hNTm1OzW+wIMxya0eR8AK1iqMeCHqexcmEvSu7nlCOI=;
 b=SS4zNG6yU7IlMUMGVW6ioKDCIvsh6QQh5FGnzmIuX9Wdj2VqDtAWSmv9y/CPFbzynp
 nhPED5aHrpRnxbWAmdWR2X532HxCN8qGvuwEFVPNRfXmMwbtmaTzV/xrPqpGAhqNYvcH
 /e+eFA7zuCmcHV1JLZBgYjSfDijfdtLKfoNIRXykS/Qa+Q5vdkEwmn7qwkvOACum3KJi
 EvOmtxt7ce4meYIiLSx95OJoEOhFo4dtPjwj5Fb8ZE7QB70RKy2zYxIIUe+6sXWcddXP
 za2NKRDedkBdAUi6YD/bU+zRll8xbcsKW8IG9QTUh5XMAc1/KgiNSZWwyulp57zsPrXi
 vdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hNTm1OzW+wIMxya0eR8AK1iqMeCHqexcmEvSu7nlCOI=;
 b=Zs47/FkwdOJSaBJC1tsYRJVrOaf6xxGNmYjxyPZDJYntyV5Ej9pHmAaTNkGXoVlSjy
 17zbsk1IAnv1Ih/cZSS97yKEEA4vRkhi+tiT0XyRbjbakL7lQgXfrEOKCoHxSt9/Eq24
 PbyHzZ9IGt42dsMkJFeLJ5pCSSMKDEY0LyB3zrjR3/WJgHZiLfkJYjs5Vt9tE+MTuuKJ
 2LAC3mNSxBgymzt6iEmtoX7sqairbNLcBhDG8N4CLrRrdEqvDF4Ek9EdDJUdFMNnSUZV
 JDSDYHbmgV67bkQjyR+3XfV25LcCHBp5nbz6EWuLrCJtkqTjZCXvrsJjheRVctMTg9of
 0LPg==
X-Gm-Message-State: AOAM532Qv0cGn+//dwEYTzZNjXjwdSLqoa2Pzzw26onqjPhoeKXURa0U
 ISj/h/q09p9F4XFRPS6ABBk=
X-Google-Smtp-Source: ABdhPJyScJzovZz5qBJKCIIr5LHMY6WEG9NGnXsgVyz5deAPZsN/Cc6yNciErzsZqHZ9auTeUwl/ig==
X-Received: by 2002:a63:6c6:: with SMTP id 189mr10631535pgg.133.1602437478954; 
 Sun, 11 Oct 2020 10:31:18 -0700 (PDT)
Received: from localhost.localdomain ([49.207.200.2])
 by smtp.gmail.com with ESMTPSA id j23sm9103666pgm.76.2020.10.11.10.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 10:31:18 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: petkan@nucleusys.com,
	davem@davemloft.net,
	kuba@kernel.org
Date: Sun, 11 Oct 2020 23:00:30 +0530
Message-Id: <20201011173030.141582-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
References: <20201010064459.6563-1-anant.thazhemadam@gmail.com>
MIME-Version: 1.0
Cc: sfr@canb.auug.org.au, Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] net: usb: rtl8150: don't
	incorrectly assign random MAC addresses
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

In set_ethernet_addr(), if get_registers() succeeds, the ethernet address
that was read must be copied over. Otherwise, a random ethernet address
must be assigned.

get_registers() returns 0 if successful, and negative error number
otherwise. However, in set_ethernet_addr(), this return value is
incorrectly checked.

Since this return value will never be equal to sizeof(node_id), a
random MAC address will always be generated and assigned to the
device; even in cases when get_registers() is successful.

Correctly modifying the condition that checks if get_registers() was
successful or not fixes this problem, and copies the ethernet address
appropriately.

Fixes: f45a4248ea4c ("net: usb: rtl8150: set random MAC address when set_ethernet_addr() fails")
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes in v2:
        * Fixed the format of the Fixes tag
        * Modified the commit message to better describe the issue being 
          fixed

+CCing Stephen and linux-next, since the commit fixed isn't in the networking
tree, but is present in linux-next.

 drivers/net/usb/rtl8150.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/rtl8150.c b/drivers/net/usb/rtl8150.c
index f020401adf04..bf8a60533f3e 100644
--- a/drivers/net/usb/rtl8150.c
+++ b/drivers/net/usb/rtl8150.c
@@ -261,7 +261,7 @@ static void set_ethernet_addr(rtl8150_t *dev)
 
 	ret = get_registers(dev, IDR, sizeof(node_id), node_id);
 
-	if (ret == sizeof(node_id)) {
+	if (!ret) {
 		ether_addr_copy(dev->netdev->dev_addr, node_id);
 	} else {
 		eth_hw_addr_random(dev->netdev);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
