Return-Path: <SRS0=HGl2=KO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE256C433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 May 2021 09:20:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D70560FE4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 May 2021 09:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2D70560FE4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D1740154;
	Wed, 19 May 2021 09:20:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSN4OXYsJdR6; Wed, 19 May 2021 09:20:43 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1FDB400FD;
	Wed, 19 May 2021 09:20:42 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B6162C000E;
	Wed, 19 May 2021 09:20:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id DEC8BC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 09:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4C7683E21
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 09:20:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pKkgJWFC3fvC
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 09:20:39 +0000 (UTC)
X-Greylist: delayed 00:09:35 by SQLgrey-1.8.0
Received: from r3-11.sinamail.sina.com.cn (r3-11.sinamail.sina.com.cn
 [202.108.3.11]) by smtp1.osuosl.org (Postfix) with SMTP id C28EA83A99
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 09:20:38 +0000 (UTC)
Received: from unknown (HELO localhost.localdomain)([221.199.207.228])
 by sina.com (172.16.97.27) with ESMTP
 id 60A4D61F0002395B; Wed, 19 May 2021 17:11:00 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 48871949283315
From: Hillf Danton <hdanton@sina.com>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v4] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
Date: Wed, 19 May 2021 17:10:47 +0800
Message-Id: <20210519091047.1477-1-hdanton@sina.com>
In-Reply-To: <20210518155921.4181-1-mail@anirudhrb.com>
References: <20210518155921.4181-1-mail@anirudhrb.com>
MIME-Version: 1.0
Cc: syzbot+de271708674e2093097b@syzkaller.appspotmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Junyong Sun <sunjy516@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
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

On  Tue, 18 May 2021 21:29:20 +0530 Anirudh Rayabharam wrote:
>This use-after-free happens when a fw_priv object has been freed but
>hasn't been removed from the pending list (pending_fw_head). The next
>time fw_load_sysfs_fallback tries to insert into the list, it ends up
>accessing the pending_list member of the previoiusly freed fw_priv.
>
>The root cause here is that all code paths that abort the fw load
>don't delete it from the pending list. For example:
>
>	_request_firmware()
>	  -> fw_abort_batch_reqs()
>	      -> fw_state_aborted()
>
>To fix this, delete the fw_priv from the list in __fw_set_state() if
>the new state is DONE or ABORTED. This way, all aborts will remove
>the fw_priv from the list. Accordingly, remove calls to list_del_init
>that were being made before calling fw_state_(aborted|done)().
>
>Also, in fw_load_sysfs_fallback, don't add the fw_priv to the list
>if it is already aborted. Instead, just jump out and return early.
>
>Fixes: bcfbd3523f3c ("firmware: fix a double abort case with fw_load_sysfs_fallback")
>Reported-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
>Tested-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
>Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
>---
>
>Changes in v4:
>Documented the reasons behind the error codes returned from
>fw_sysfs_wait_timeout() as suggested by Luis Chamberlain.
>
>Changes in v3:
>Modified the patch to incorporate suggestions by Luis Chamberlain in
>order to fix the root cause instead of applying a "band-aid" kind of
>fix.
>https://lore.kernel.org/lkml/20210403013143.GV4332@42.do-not-panic.com/
>
>Changes in v2:
>1. Fixed 1 error and 1 warning (in the commit message) reported by
>checkpatch.pl. The error was regarding the format for referring to
>another commit "commit <sha> ("oneline")". The warning was for line
>longer than 75 chars. 
>
>---
> drivers/base/firmware_loader/fallback.c | 46 ++++++++++++++++++-------
> drivers/base/firmware_loader/firmware.h |  6 +++-
> drivers/base/firmware_loader/main.c     |  2 ++
> 3 files changed, 40 insertions(+), 14 deletions(-)
>
>diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
>index 91899d185e31..f244c7b89ba5 100644
>--- a/drivers/base/firmware_loader/fallback.c
>+++ b/drivers/base/firmware_loader/fallback.c
>@@ -70,7 +70,31 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_priv)
> 
> static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long timeout)
> {
>-	return __fw_state_wait_common(fw_priv, timeout);
>+	int ret = __fw_state_wait_common(fw_priv, timeout);
>+
>+	/*
>+	 * A signal could be sent to abort a wait. Consider Android's init
>+	 * gettting a SIGCHLD, which in turn was the same process issuing the
>+	 * sysfs store call for the fallback. In such cases we want to be able
>+	 * to tell apart in userspace when a signal caused a failure on the
>+	 * wait. In such cases we'd get -ERESTARTSYS.
>+	 *
>+	 * Likewise though another race can happen and abort the load earlier.
>+	 *
>+	 * In either case the situation is interrupted so we just inform
>+	 * userspace of that and we end things right away.
>+	 *
>+	 * When we really time out just tell userspace it should try again,
>+	 * perhaps later.
>+	 */
>+	if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
>+		ret = -EINTR;
>+	else if (ret == -ETIMEDOUT)
>+		ret = -EAGAIN;
>+	else if (fw_priv->is_paged_buf && !fw_priv->data)
>+		ret = -ENOMEM;
>+
>+	return ret;
> }
> 
> struct fw_sysfs {
>@@ -91,10 +115,9 @@ static void __fw_load_abort(struct fw_priv *fw_priv)
> 	 * There is a small window in which user can write to 'loading'
> 	 * between loading done and disappearance of 'loading'
> 	 */
>-	if (fw_sysfs_done(fw_priv))
>+	if (fw_state_is_aborted(fw_priv) || fw_sysfs_done(fw_priv))
> 		return;
> 
>-	list_del_init(&fw_priv->pending_list);
> 	fw_state_aborted(fw_priv);
> }
> 
>@@ -280,7 +303,6 @@ static ssize_t firmware_loading_store(struct device *dev,
> 			 * Same logic as fw_load_abort, only the DONE bit
> 			 * is ignored and we set ABORT only on failure.
> 			 */
>-			list_del_init(&fw_priv->pending_list);
> 			if (rc) {
> 				fw_state_aborted(fw_priv);
> 				written = rc;
>@@ -513,6 +535,11 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
> 	}
> 
> 	mutex_lock(&fw_lock);
>+	if (fw_state_is_aborted(fw_priv)) {
>+		mutex_unlock(&fw_lock);
>+		retval = -EINTR;
>+		goto out;
>+	}
> 	list_add(&fw_priv->pending_list, &pending_fw_head);

This looks like prepare_to_wait().

> 	mutex_unlock(&fw_lock);
> 
>@@ -526,20 +553,13 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
> 	}
> 
> 	retval = fw_sysfs_wait_timeout(fw_priv, timeout);
>-	if (retval < 0 && retval != -ENOENT) {
>+	if (retval < 0) {
> 		mutex_lock(&fw_lock);
> 		fw_load_abort(fw_sysfs);
		  __fw_load_abort();
		    fw_state_aborted();
		      __fw_state_set();

Is this your finish_wait() part? See what you add below.

> 		mutex_unlock(&fw_lock);
> 	}
> 
>-	if (fw_state_is_aborted(fw_priv)) {
>-		if (retval == -ERESTARTSYS)
>-			retval = -EINTR;
>-		else
>-			retval = -EAGAIN;
>-	} else if (fw_priv->is_paged_buf && !fw_priv->data)
>-		retval = -ENOMEM;
>-
>+out:
> 	device_del(f_dev);
> err_put_dev:
> 	put_device(f_dev);
>diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
>index 63bd29fdcb9c..36bdb413c998 100644
>--- a/drivers/base/firmware_loader/firmware.h
>+++ b/drivers/base/firmware_loader/firmware.h
>@@ -117,8 +117,12 @@ static inline void __fw_state_set(struct fw_priv *fw_priv,
> 
> 	WRITE_ONCE(fw_st->status, status);
> 
>-	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED)
>+	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED) {
>+#ifdef CONFIG_FW_LOADER_USER_HELPER
>+		list_del_init(&fw_priv->pending_list);
>+#endif
> 		complete_all(&fw_st->completion);
>+	}

Fine, apart from what you are fixing, you are adding something like
finish_wait() into the waker's backyard. Why are you calling
complete_all() on the waiter side?

> }
> 
> static inline void fw_state_aborted(struct fw_priv *fw_priv)
>diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
>index 4fdb8219cd08..68c549d71230 100644
>--- a/drivers/base/firmware_loader/main.c
>+++ b/drivers/base/firmware_loader/main.c
>@@ -783,8 +783,10 @@ static void fw_abort_batch_reqs(struct firmware *fw)
> 		return;
> 
> 	fw_priv = fw->priv;
>+	mutex_lock(&fw_lock);
> 	if (!fw_state_is_aborted(fw_priv))
> 		fw_state_aborted(fw_priv);
>+	mutex_unlock(&fw_lock);
> }
> 
> /* called from request_firmware() and request_firmware_work_func() */
>-- 
>2.26.2
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
