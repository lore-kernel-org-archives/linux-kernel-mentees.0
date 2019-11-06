Return-Path: <SRS0=n4Lq=Y6=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 745F7C5DF63
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 11:59:04 +0000 (UTC)
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48EE9217F4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  6 Nov 2019 11:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48EE9217F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 184B3B88;
	Wed,  6 Nov 2019 11:59:04 +0000 (UTC)
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DBC05B79
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 11:59:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 15FE6196
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Wed,  6 Nov 2019 11:59:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 02267B162;
	Wed,  6 Nov 2019 11:59:00 +0000 (UTC)
Message-ID: <1573040577.3090.22.camel@suse.com>
From: Oliver Neukum <oneukum@suse.com>
To: Phong Tran <tranmanphong@gmail.com>, 
	syzbot+495dab1f175edc9c2f13@syzkaller.appspotmail.com
Date: Wed, 06 Nov 2019 12:42:57 +0100
In-Reply-To: <20191105233652.21033-1-tranmanphong@gmail.com>
References: <00000000000042d60805933945b5@google.com>
	<20191105233652.21033-1-tranmanphong@gmail.com>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Cc: alex.theissen@me.com, andreyknvl@google.com, linux-usb@vger.kernel.org,
	2pi@mok.nu, linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [Linux-kernel-mentees] [PATCH] usb: appledisplay: fix
 use-after-free in bl_get_brightness
X-BeenThere: linux-kernel-mentees@lists.linuxfoundation.org
X-Mailman-Version: 2.1.12
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
Sender: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org

Am Mittwoch, den 06.11.2019, 06:36 +0700 schrieb Phong Tran:
> In context of USB disconnect, the delaywork trigger and calling
> appledisplay_bl_get_brightness() and the msgdata was freed.
> 
> add the checking return value of usb_control_msg() and only update the
> data while the retval is valid.

Hi,

I am afraid there are some issues with your patch. First, let me stress
that you found the right place to fix an issue and you partially fixed
an issue. But the the fix you applied is incomplete and left another
issue open.

Your patch still allows doing IO to a device that may already be bound
to another driver. That is bad, especially as the buffer is already
free. Yes, if IO is failing, you have fixed that narrow issue.
But it need not fail.

If you look into appledisplay_probe() you will see that it can fail
because backlight_device_register() fails. The error handling will
thereupon kill the URB and free memory. But it will not kill an already
scheduled work. The scheduled work will then call usb_control_msg()
on pdata->msgdata, which has been freed. If that IO fails, all is well.
If not, the issue still exists.

Secondly, your error check is off by 2. You are checking only for
usb_control_msg() failing. But it can return only one byte instead
of two. If that happens, the value you return is stale, although
the buffer is correctly allocated.

	Regards
		Oliver

The correct fix for both issues would be:

#syz test: https://github.com/google/kasan.git e0bd8d79

From 2497a62bdbeb9bd94f690c22d96dd1b8cf22861f Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Wed, 6 Nov 2019 12:36:28 +0100
Subject: [PATCH] appledisplay: fix error handling in the scheduled work

The work item can operate on

1. stale memory left over from the last transfer
the actual length of the data transfered needs to be checked
2. memory already freed
the error handling in appledisplay_probe() needs
to cancel the work in that case

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/usb/misc/appledisplay.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/appledisplay.c b/drivers/usb/misc/appledisplay.c
index ac92725458b5..ba1eaabc7796 100644
--- a/drivers/usb/misc/appledisplay.c
+++ b/drivers/usb/misc/appledisplay.c
@@ -164,7 +164,12 @@ static int appledisplay_bl_get_brightness(struct backlight_device *bd)
 		0,
 		pdata->msgdata, 2,
 		ACD_USB_TIMEOUT);
-	brightness = pdata->msgdata[1];
+	if (retval < 2) {
+		if (retval >= 0)
+			retval = -EMSGSIZE;
+	} else {
+		brightness = pdata->msgdata[1];
+	}
 	mutex_unlock(&pdata->sysfslock);
 
 	if (retval < 0)
@@ -299,6 +304,7 @@ static int appledisplay_probe(struct usb_interface *iface,
 	if (pdata) {
 		if (pdata->urb) {
 			usb_kill_urb(pdata->urb);
+			cancel_delayed_work_sync(&pdata->work);
 			if (pdata->urbdata)
 				usb_free_coherent(pdata->udev, ACD_URB_BUFFER_LEN,
 					pdata->urbdata, pdata->urb->transfer_dma);
-- 
2.16.4


_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
