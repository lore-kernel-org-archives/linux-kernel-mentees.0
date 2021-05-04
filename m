Return-Path: <SRS0=aW4b=J7=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94A1AC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 May 2021 17:09:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E6E8613AA
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  4 May 2021 17:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E6E8613AA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECE024183C;
	Tue,  4 May 2021 17:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESuV9lbu1msJ; Tue,  4 May 2021 17:09:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id D021941830;
	Tue,  4 May 2021 17:09:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A74FDC000E;
	Tue,  4 May 2021 17:09:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0DECCC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 17:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E3F89607AF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 17:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vYqAdIM2NYCu
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 17:09:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0666605C5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  4 May 2021 17:09:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1620148182; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=JGbDoXdCLlqGA1OO5uC8QlBGaIQQT/WUwHts9dFRO/tUTk364G4JggA9DvqR5zpBdOS39btX08RRLuJFXANwy+ZNESQJjDCEKZuU4HWC+npwksC5RCgmkXO4Z1XZJzbcH4g0yoXAljGGFhQgQa/V9GVOojUBJvm6d/tgukHV8C8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1620148182;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=bP5q0oCy6JjgM/bUrdYdiiOBH0QufNCdsTsJImsXwQs=; 
 b=lC9k/Kf2JokY3mMPUumOYxyWinTtfhLf8ZD2sMHgeMeJXhNDOaNfdEQm3XJVU3Or3Zx/xnWjsoxAp8eGUwjRiy2nzsdxvQep5628JFTRJzsQrYZ7jJCHpcsJR4Lri+TOqiw+oNYGK7x+Vy+trfMh29fHuRpxX5t/Iy4TKbSrUz0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com> header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1620148182; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Transfer-Encoding;
 bh=bP5q0oCy6JjgM/bUrdYdiiOBH0QufNCdsTsJImsXwQs=;
 b=bHkpEaY3QRRksQpbitMoxmi0wyZsZkvywxg8OLsKVNP/9tueaWk59cdk1OUbwanG
 MjQuAbZU5/zf4Qxnl1WDTN0ncMjAR7FcxguF23kbJMTDRu+Rq/wLfKR48mrPItd+o+s
 8zu2kNKlMZLHbClbt5jF+5TL2+xpVrSB5BuPNR5o=
Received: from localhost.localdomain (49.207.214.96 [49.207.214.96]) by
 mx.zohomail.com with SMTPS id 1620148175776768.7889874703077;
 Tue, 4 May 2021 10:09:35 -0700 (PDT)
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Mike Isely <isely@pobox.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v2 resend] media: pvrusb2: fix warning in pvr2_i2c_core_done
Date: Tue,  4 May 2021 22:38:58 +0530
Message-Id: <20210504170858.23826-1-mail@anirudhrb.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org,
 linux-media@vger.kernel.org
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

syzbot has reported the following warning in pvr2_i2c_done:

	sysfs group 'power' not found for kobject '1-0043'

When the device is disconnected (pvr_hdw_disconnect), the i2c adapter is
not unregistered along with the USB and v4l2 teardown. As part of the USB
device disconnect, the sysfs files of the subdevices are also deleted.
So, by the time pvr_i2c_core_done is called by pvr_context_destroy, the
sysfs files have been deleted.

To fix this, unregister the i2c adapter too in pvr_hdw_disconnect. Make
the device deregistration code shared by calling pvr_hdw_disconnect from
pvr2_hdw_destroy.

Reported-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
Tested-by: syzbot+e74a998ca8f1df9cc332@syzkaller.appspotmail.com
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
---

syzbot test run result:
https://groups.google.com/g/syzkaller-bugs/c/ZRtPuAv8k7g/m/_MIsLKJtAAAJ

Changes in v2:
- Corrected typos in the patch description
- Added the received "Reviewed-by:" tags 
- Retain the call to v4l2_device_unregister() in pvr2_hdw_destroy()
  since pvr2_hdw_disconnect doesn't call it as pointed out by Hans.

---
 drivers/media/usb/pvrusb2/pvrusb2-hdw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
index f4a727918e35..d38dee1792e4 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-hdw.c
@@ -2676,9 +2676,8 @@ void pvr2_hdw_destroy(struct pvr2_hdw *hdw)
 		pvr2_stream_destroy(hdw->vid_stream);
 		hdw->vid_stream = NULL;
 	}
-	pvr2_i2c_core_done(hdw);
 	v4l2_device_unregister(&hdw->v4l2_dev);
-	pvr2_hdw_remove_usb_stuff(hdw);
+	pvr2_hdw_disconnect(hdw);
 	mutex_lock(&pvr2_unit_mtx);
 	do {
 		if ((hdw->unit_number >= 0) &&
@@ -2705,6 +2704,7 @@ void pvr2_hdw_disconnect(struct pvr2_hdw *hdw)
 {
 	pvr2_trace(PVR2_TRACE_INIT,"pvr2_hdw_disconnect(hdw=%p)",hdw);
 	LOCK_TAKE(hdw->big_lock);
+	pvr2_i2c_core_done(hdw);
 	LOCK_TAKE(hdw->ctl_lock);
 	pvr2_hdw_remove_usb_stuff(hdw);
 	LOCK_GIVE(hdw->ctl_lock);
-- 
2.26.2

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
