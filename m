Return-Path: <SRS0=Z8QS=CO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D594EC433E2
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Sep 2020 02:04:39 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49B852074A
	for <linux-kernel-mentees@archiver.kernel.org>; Sat,  5 Sep 2020 02:04:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uhSZsLne"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49B852074A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id D0BE9873E4;
	Sat,  5 Sep 2020 02:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bl5TJkxSVD1e; Sat,  5 Sep 2020 02:04:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 567DC873D2;
	Sat,  5 Sep 2020 02:04:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 29FCBC0890;
	Sat,  5 Sep 2020 02:04:38 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DAE19C0052
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Sep 2020 02:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id C384386237
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Sep 2020 02:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CouWzpsW0oLZ
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Sep 2020 02:04:35 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A1B04861F6
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  5 Sep 2020 02:04:35 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id a9so803749pjg.1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 04 Sep 2020 19:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+kZoKqKGDj4sxz/spgYXr9LUZZuZ+0ogBgOuprttQg=;
 b=uhSZsLneznox8j/wfTxJSSTDG30ykKmjtFg76kdzEeZLYy/fOrBdy2QgFGXwCKlf00
 TBtbJTueT11YFsFBkNqv2h7LKAf4bUOoigdlQZxT3U99VyTdqLoEeKJMYm/RYODVk6Fs
 LwjgGVYTI9gNPsPUxZFkT92XD244ihXCTgyY/bDaeEZ0LLT2OUgeWv5JDxBnbua2IP8i
 FrCxFp05KjRAaU5qD/0WwO8oHm86YSF9W3aksgUToopVNjzUclLczjEciCwoUGMlh5IJ
 6QSlRmCNY5K7ztgh6WsrLaCr38Jf+9hTlyY/D7Qr9r17CPEPIEErx7p2wCVsD538JqFb
 llRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n+kZoKqKGDj4sxz/spgYXr9LUZZuZ+0ogBgOuprttQg=;
 b=i31m0Fnh6jPHx5WKUKrD0C8FdnoRbapMVoXeDrykAo/ZwcpU81SYwgGVg4o+kJHpSd
 t1Q7bGpfA0boZAnPQsKu4X/B+NkU7oGlOqrmHsxM+kSbuUT1EObzy31L841D5gz7WCF/
 I+NASzzVcJyIXIrc7fOd/E8elCNUav4oxGeN7r9sySRQ/gxvn+BPpiY7B3SijPsGuojY
 Bgd0YywKyM9td0iqIy5Zct2TBYRFba1uOVnRHdpN2ux6YcuI3940ryfvNqz6dC1lPnvP
 eEo5oZliG9LIu6ky8+FblN8opV6q6bEhps5BZS3ubrHPboy53V1068yqkz8YPQHur9IM
 uGwQ==
X-Gm-Message-State: AOAM533FtDi3fvLIxsmozLTA9Pp6zakuCMdXA8bmsj6ICfQi7sXoum9i
 0VUi6anEfAVu2QDY/wRuDuOuYv70rvIqeY8s
X-Google-Smtp-Source: ABdhPJxseGxIt0034578p+AgKbObcHKZ69MVPLi1F41nrP4o5X6UV+hRLg5jABu0zSRgG8VcoBhCAw==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr10517822pjb.174.1599271474699; 
 Fri, 04 Sep 2020 19:04:34 -0700 (PDT)
Received: from localhost.localdomain ([49.207.195.77])
 by smtp.gmail.com with ESMTPSA id x19sm2245332pge.22.2020.09.04.19.04.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 19:04:33 -0700 (PDT)
From: Anant Thazhemadam <anant.thazhemadam@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Date: Sat,  5 Sep 2020 07:34:10 +0530
Message-Id: <20200905020410.20350-1-anant.thazhemadam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-bluetooth@vger.kernel.org,
 Anant Thazhemadam <anant.thazhemadam@gmail.com>,
 Marcel Holtmann <marcel@holtmann.org>, linux-kernel@vger.kernel.org,
 Johan Hedberg <johan.hedberg@gmail.com>
Subject: [Linux-kernel-mentees] [PATCH] Fix uninit-value in
	hci_chan_lookup_handle
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

When the amount of data stored in the location corresponding to
iov_iter *from is less then 4, some data seems to go uninitialized.

Updating this condition accordingly, makes sense both intuitively and 
logically as well, since the other check for extreme condition done is if
len > HCI_MAX_FRAME_SIZE, which is HCI_MAX_ACL_SIZE (which is 1024) + 4;
which itself gives some idea about what must be the ideal mininum size.

Reported-and-tested by: syzbot+4c14a8f574461e1c3659@syzkaller.appspotmail.com
Signed-off-by: Anant Thazhemadam <anant.thazhemadam@gmail.com>
---
If there is some explicit reason why len < 4 doesn't work, and only len < 2 works, 
please do let me know.
The commit message that introduced the initial change 
(512b2268156a4e15ebf897f9a883bdee153a54b7) wasn't exactly very helpful in this 
respect, and I couldn't find a whole lot of discussion regarding this either.

 drivers/bluetooth/hci_vhci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index 8ab26dec5f6e..0c49821d7b98 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -159,7 +159,7 @@ static inline ssize_t vhci_get_user(struct vhci_data *data,
 	__u8 pkt_type, opcode;
 	int ret;
 
-	if (len < 2 || len > HCI_MAX_FRAME_SIZE)
+	if (len < 4 || len > HCI_MAX_FRAME_SIZE)
 		return -EINVAL;
 
 	skb = bt_skb_alloc(len, GFP_KERNEL);
-- 
2.25.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
