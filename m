Return-Path: <SRS0=PXb8=DI=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD54C47423
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:44:00 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A65A20759
	for <linux-kernel-mentees@archiver.kernel.org>; Thu,  1 Oct 2020 19:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tX1GvFWP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A65A20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id ED69686933;
	Thu,  1 Oct 2020 19:43:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0UUNjjR_zHTV; Thu,  1 Oct 2020 19:43:55 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id B6B008665E;
	Thu,  1 Oct 2020 19:43:55 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9D0AEC016F;
	Thu,  1 Oct 2020 19:43:55 +0000 (UTC)
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 50959C0051
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:43:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 4C1B886B33
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:43:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdnf29Mbrxfd
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:43:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 1708286B31
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu,  1 Oct 2020 19:43:50 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id d6so5572982pfn.9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 01 Oct 2020 12:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzsQFq5TcOeOYdaiQDeN/QbyXwYMVKi6+YdbJZoiwuY=;
 b=tX1GvFWPwIyzM0OHct28YSx+gEK8MvlEAzCcADfC6X+zLiC0nzFmjpiHc0Cr0oxTEw
 ex5aYR8Whxc7BquvHCD/4e9vKYN9JLw//Hl5iAodd+aa0+cx7ZCtRp/6eXN5C9sfZz2T
 dS3rXbv5C4j9AWNGk9sbKfOiJYae0Gej7QwyqGlnBfppPt+i0FZum05GT9VNuqT8joaq
 MQSgW1AtqxhO9sV/l3/3MkFO3wp/IlutjgjHipK8oT/ngiB0YwuIwQRhtEvmuAdNCtj+
 nMPP62yqIlXLpUzRZril0+xe6f7xANruMG5uzWu0W5/Nh2w6EaP9NRr8J1zdIrwe7aHw
 p9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CzsQFq5TcOeOYdaiQDeN/QbyXwYMVKi6+YdbJZoiwuY=;
 b=jecOu9wSXV/MSUfPndb2ZVNaZz3O2wl5ycclDnYNWRrNgcOXbwv1luSnZrNlGnyw+k
 GT92uYY7ijMDE4t9LpFnYh7CINzGoCK6C+4WP2QxeR84m51X0SgL3f/JeVvOF4agxr+K
 ItI2k5f3/CoZhNOLHVtnrMKPdCVHprgbyjHohxMskRqg0CX8BrG7aybeLxkhgQwZWC1/
 b1gYilNkw/e9ZY2Z9urzMgnTXlpNCWuAF5ZWPokox6vgRoHAnIKxiO6H/TZX2lprdSSL
 V1dLsD+jZE/MyDmxM+2e8dvLoQazAKxRxv8PwleRnuUe2ZHoz1EGp5Gp7sVV2Zq2x0aI
 z3RA==
X-Gm-Message-State: AOAM532HrJ0PMpCYMlT+A7b0umZcIy6V1bfvgoAM9bLAXzESOzwtClW4
 zzKvDnwFnjL4rUcUrJhcly86cEKLMQMImnJwgcY=
X-Google-Smtp-Source: ABdhPJyduhQq86lDaODuQjpM/0yPytt2ShHGue+aD+PiP6gmiSEFi3UuZfNEVSGvFkVs3gvGkZKtCg==
X-Received: by 2002:a63:ef51:: with SMTP id c17mr7403957pgk.36.1601581429050; 
 Thu, 01 Oct 2020 12:43:49 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.69])
 by smtp.gmail.com with ESMTPSA id q65sm1591670pfq.219.2020.10.01.12.43.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Oct 2020 12:43:48 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: 
Date: Fri,  2 Oct 2020 01:13:28 +0530
Message-Id: <20201001194329.9328-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com,
 Johan Hedberg <johan.hedberg@gmail.com>, linux-bluetooth@vger.kernel.org,
 Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: [Linux-kernel-mentees] [PATCH v2] bluetooth: hci_h5: close serdev
	device and free hu in h5_close
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

When h5_close() gets called, the memory allocated for the hu gets 
freed only if hu->serdev doesn't exist. This leads to a memory leak.
So when h5_close() is requested, close the serdev device instance and
free the memory allocated to the hu entirely instead.

Fixes: ce945552fde4 ("Bluetooth: hci_h5: Add support for serdev enumerated devices")
Reported-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Tested-by: syzbot+6ce141c55b2f7aafd1c4@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
Changes in v2:
	* Fixed the Fixes tag

 drivers/bluetooth/hci_h5.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/hci_h5.c b/drivers/bluetooth/hci_h5.c
index e41854e0d79a..3d1585add572 100644
--- a/drivers/bluetooth/hci_h5.c
+++ b/drivers/bluetooth/hci_h5.c
@@ -248,8 +248,12 @@ static int h5_close(struct hci_uart *hu)
 	if (h5->vnd && h5->vnd->close)
 		h5->vnd->close(h5);
 
-	if (!hu->serdev)
-		kfree(h5);
+	if (hu->serdev)
+		serdev_device_close(hu->serdev);
+
+	kfree_skb(h5->rx_skb);
+	kfree(h5);
+	h5 = NULL;
 
 	return 0;
 }
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
