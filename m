Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010C3E7D0AB
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 21 Sep 2023 21:51:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67ED942112;
	Thu, 21 Sep 2023 21:51:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67ED942112
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net header.a=rsa-sha256 header.s=zmail header.b=S11nX0eD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QYTRxyZP4WCR; Thu, 21 Sep 2023 21:51:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id DAC2A4192F;
	Thu, 21 Sep 2023 21:51:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAC2A4192F
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C582EC0039;
	Thu, 21 Sep 2023 21:51:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA21BC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 21:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A179640486
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 21:51:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A179640486
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=marliere.net header.i=ricardo@marliere.net
 header.a=rsa-sha256 header.s=zmail header.b=S11nX0eD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPX14GinbKFL
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 21:51:26 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com
 [136.143.188.14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FEF2400FB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 21 Sep 2023 21:51:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FEF2400FB
ARC-Seal: i=1; a=rsa-sha256; t=1695333083; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gX6+BOoGsBn0uortAnvPUdfHjSPgPW79dUduHqYJvsZbr/G3RfhLMJ0NfveFVfLQfSKH2Iq9lX5Q52btGel+8cWKeYdAS40x4L3MI72pgNG7JwjOLzOUrbrrXCrd3fmkRPC03YlfzRA9YYU+xWVCzZFxtdDOZIjKvGuvXjK+QUU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1695333083;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=83ahYGlczM3SQWeLxhqGnOqeWsBxzxx/VPu9+s0F5f4=; 
 b=M7wbwKC4L6AxId10/pebVVeKSZhNRXJtzcioS/JT3MnPFA57XPPJjwlQ7MtrmDyNmAHA0garAtguEuH5liTFgF7TI9rFo1qFsIBTnOFHd+eFIVxc6wHH6NUKk8i6VTsyUaiCt76cC2ULoEt1jyUrUFwOVCHqXM//HpVoV5wB/Yc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=marliere.net;
 spf=pass  smtp.mailfrom=ricardo@marliere.net;
 dmarc=pass header.from=<ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695333083; 
 s=zmail; d=marliere.net; i=ricardo@marliere.net;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=83ahYGlczM3SQWeLxhqGnOqeWsBxzxx/VPu9+s0F5f4=;
 b=S11nX0eDVZn9nKEwv9CPMAbaumXLSi/jvP+Cc+EEu8YZgW9SE8arGlKuff5/4XmK
 7lodd5GAnr2QXou7m58JrgzAYpckQhHHihxijdIvgrnrC4gPNNBNg5pjz+S0EvuhCT7
 17jafPd0UXJ6877EjZF9iRpFGNazgEMoD1BDR9wE=
Received: from localhost (177.104.93.54 [177.104.93.54]) by mx.zohomail.com
 with SMTPS id 1695333081229725.1175260813508;
 Thu, 21 Sep 2023 14:51:21 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH] drivers: media: init mutex in imon_init_intf1
Date: Thu, 21 Sep 2023 18:50:03 -0300
Message-Id: <20230921215001.127982-1-ricardo@marliere.net>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-ZohoMailClient: External
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
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

The imon_probe function relies on imon_init_intf0 and imon_init_intf1 to
init an imon_context for the device interface. However, the ictx->lock
mutex is only initialized under imon_init_intf0. This patch fixes the
following warning:

DEBUG_LOCKS_WARN_ON(lock->magic != lock)
WARNING: CPU: 1 PID: 51 at kernel/locking/mutex.c:582 __mutex_lock+0xc84/0x12c0
Modules linked in:
CPU: 1 PID: 51 Comm: kworker/1:1 Not tainted 6.6.0-rc2-next-20230919 #6
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.2-14-g1e1da7a9-dirty-20230915_141834-debian 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:__mutex_lock+0xc84/0x12c0
Code: 08 84 d2 0f 85 97 05 00 00 8b 05 bb 4a 79 04 85 c0 0f 85 dd f4 ff ff 48 c7 c6 40 a6 cc 8a 48 c7 c7 00 a4 cc 8a e8 3c b9 b9 f6 <0f> 0b e9 c3 f4 ff ff 31 c9 31 d2 4c 89 ff e8 a9 dc d3 f6 84 c0 0f
RSP: 0018:ffffc90000676e50 EFLAGS: 00010286
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000000
RDX: ffff888040a88000 RSI: ffffffff81509c96 RDI: ffffffff81509c89
RBP: ffffc90000676fb0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
R13: dffffc0000000000 R14: ffffffff91228420 R15: ffff888042f5ea48
FS:  0000000000000000(0000) GS:ffff88807ec00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000565208db36d8 CR3: 000000004c058000 CR4: 00000000000006e0
Call Trace:
 <TASK>
 ? show_regs+0x9c/0xb0
 ? __warn+0xea/0x390
 ? find_bug+0x32a/0x4b0
 ? __mutex_lock+0xc84/0x12c0
 ? report_bug+0x3af/0x570
 ? handle_bug+0x71/0x90
 ? exc_invalid_op+0x1c/0x50
 ? asm_exc_invalid_op+0x1f/0x30
 ? __warn_printk+0x1a6/0x350
 ? __warn_printk+0x199/0x350
 ? __mutex_lock+0xc84/0x12c0
 ? imon_probe+0x1e7/0x38f0
 ? mutex_lock_io_nested+0x1110/0x1110
 ? debug_smp_processor_id+0x1b/0x20
 ? rcu_is_watching+0x17/0xc0
 mutex_lock_nested+0x1a/0x20
 ? mutex_lock_nested+0x1a/0x20
 imon_probe+0x1e7/0x38f0
 ? pm_runtime_enable+0xd4/0x2d0
 ? __pm_runtime_set_status+0x461/0xd10
 usb_probe_interface+0x30e/0x940
 ? usb_match_dynamic_id+0x1a0/0x1a0
 really_probe+0x24b/0xca0
 ? __sanitizer_cov_trace_const_cmp1+0x1e/0x20
 __driver_probe_device+0x1e9/0x4b0
 driver_probe_device+0x51/0x1c0
 __device_attach_driver+0x1d3/0x2e0
 bus_for_each_drv+0x169/0x1f0
 ? driver_probe_device+0x1c0/0x1c0
 ? bus_for_each_dev+0x1e0/0x1e0
 ? _raw_spin_unlock_irqrestore+0x40/0x80
 __device_attach+0x1f4/0x4e0
 ? device_driver_attach+0x210/0x210
 ? do_raw_spin_unlock+0x58/0x230
 device_initial_probe+0x1e/0x30
 bus_probe_device+0x186/0x1c0
 device_add+0x1239/0x1c40
 ? __fw_devlink_link_to_consumers.isra.0+0x280/0x280
 ? __this_cpu_preempt_check+0x17/0x20
 ? __sanitizer_cov_trace_const_cmp1+0x1e/0x20
 ? create_intf_ep_devs.isra.0+0x19a/0x1f0
 usb_set_configuration+0x1166/0x1c80
 usb_generic_driver_probe+0xd8/0x140
 usb_probe_device+0xe5/0x2d0
 ? usb_driver_release_interface+0x1a0/0x1a0
 really_probe+0x24b/0xca0
 ? __sanitizer_cov_trace_const_cmp1+0x1e/0x20
 __driver_probe_device+0x1e9/0x4b0
 driver_probe_device+0x51/0x1c0
 __device_attach_driver+0x1d3/0x2e0
 bus_for_each_drv+0x169/0x1f0
 ? driver_probe_device+0x1c0/0x1c0
 ? bus_for_each_dev+0x1e0/0x1e0
 ? _raw_spin_unlock_irqrestore+0x40/0x80
 __device_attach+0x1f4/0x4e0
 ? device_driver_attach+0x210/0x210
 ? do_raw_spin_unlock+0x58/0x230
 device_initial_probe+0x1e/0x30
 bus_probe_device+0x186/0x1c0
 device_add+0x1239/0x1c40
 ? __fw_devlink_link_to_consumers.isra.0+0x280/0x280
 ? add_device_randomness+0xb9/0xf0
 ? rng_is_initialized+0x50/0x50
 usb_new_device+0xe08/0x1a90
 ? hub_disconnect+0x550/0x550
 ? __this_cpu_preempt_check+0x17/0x20
 hub_event+0x2fa2/0x50b0
 ? hub_port_debounce+0x450/0x450
 ? mark_lock+0x8a1/0x1950
 ? lock_sync+0x180/0x180
 ? reacquire_held_locks+0x4b0/0x4b0
 ? __this_cpu_preempt_check+0x17/0x20
 ? process_one_work+0x7db/0x16e0
 ? debug_smp_processor_id+0x1b/0x20
 ? _raw_spin_unlock_irq+0x26/0x50
 ? process_one_work+0x7db/0x16e0
 ? __this_cpu_preempt_check+0x17/0x20
 process_one_work+0x8f1/0x16e0
 ? init_worker_pool+0x780/0x780
 ? move_linked_works+0x232/0x300
 ? assign_work+0x1a1/0x240
 worker_thread+0x8ba/0x12a0
 ? _raw_spin_unlock_irqrestore+0x55/0x80
 ? __this_cpu_preempt_check+0x17/0x20
 ? lockdep_hardirqs_on+0x82/0x110
 ? process_one_work+0x16e0/0x16e0
 kthread+0x352/0x450
 ? kthread_complete_and_exit+0x40/0x40
 ret_from_fork+0x4e/0x80
 ? kthread_complete_and_exit+0x40/0x40
 ret_from_fork_asm+0x11/0x20
 </TASK>
irq event stamp: 302003
hardirqs last  enabled at (302003): [<ffffffff8a980585>] _raw_spin_unlock_irqrestore+0x55/0x80
hardirqs last disabled at (302002): [<ffffffff8a9802d9>] _raw_spin_lock_irqsave+0x59/0x60
softirqs last  enabled at (301978): [<ffffffff8152931f>] irq_exit_rcu+0xbf/0x130
softirqs last disabled at (301971): [<ffffffff8152931f>] irq_exit_rcu+0xbf/0x130
---[ end trace 0000000000000000 ]---

Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/media/rc/imon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
index 74546f7e3469..30a385fb73f1 100644
--- a/drivers/media/rc/imon.c
+++ b/drivers/media/rc/imon.c
@@ -2318,6 +2318,7 @@ static struct imon_context *imon_init_intf1(struct usb_interface *intf,
 	if (!rx_urb)
 		goto rx_urb_alloc_failed;
 
+	mutex_init(&ictx->lock);
 	mutex_lock(&ictx->lock);
 
 	if (ictx->display_type == IMON_DISPLAY_TYPE_VGA) {
-- 
2.40.1

_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
