Return-Path: <SRS0=HGl2=KO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5725BC433B4
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 May 2021 03:20:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90F16124C
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 19 May 2021 03:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D90F16124C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B6E483BBF;
	Wed, 19 May 2021 03:20:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bXOPfxkJnPGy; Wed, 19 May 2021 03:20:20 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id 883BA83DF3;
	Wed, 19 May 2021 03:20:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 63E32C000D;
	Wed, 19 May 2021 03:20:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 161BCC0001
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 03:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F15D140343
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 03:20:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Te56ejckfUn3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 03:20:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC10C402D8
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 19 May 2021 03:20:17 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id j12so8439434pgh.7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 18 May 2021 20:20:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CY0I0qnvOJjs0awMJVhG9W02v8JnOlrb5Dov/3FHGN0=;
 b=Bg1KmZdrrZ3T1xMQ/2+8gC2cHXSFBT9BHkJa2JD463vblQK2QExEEFZ159dAk4vEn6
 L3/VoAnHrw8V8lLz8aQdeD/rRwHxmcu24s5V5MmITliJLPRgO+AnjN9f7sfR/4Hj6fV7
 cu7MH38N7Jt8SHsa24POOaOZk+qMzF1tYuGdO/uRZtsBd3r8x0UtLL6tVuCYsKLrdA5x
 +Oq/wRi+np2TmBe57NYM1M7Oi6mMP3ikAT+cjGMZ9fJARVRpftfunHh7Q33N27SzH0lX
 fTqoL4lyTKf4ziBpweieWOREqOTm5kERORArWBP+Es8oXlAxvJKYvcOUYts2KhfVP1BR
 xZ8g==
X-Gm-Message-State: AOAM533vwgCmKxtcsu1alZVTjtLbxlvwKAsS2r6ijiudATAXMxy7GoVA
 p5dJAH00d1X+Srg8MbTePOI=
X-Google-Smtp-Source: ABdhPJyFuZibObiP+rK045q3crj2aQIaqZAvG99fQWC/7qIEgImBnWppCASfJ1f+PObcftkMmv+YgA==
X-Received: by 2002:a62:6d05:0:b029:250:d196:1fc8 with SMTP id
 i5-20020a626d050000b0290250d1961fc8mr8591282pfc.21.1621394416903; 
 Tue, 18 May 2021 20:20:16 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
 by smtp.gmail.com with ESMTPSA id a2sm1106336pfv.156.2021.05.18.20.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 20:20:15 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
 id B96DD40321; Wed, 19 May 2021 03:20:14 +0000 (UTC)
Date: Wed, 19 May 2021 03:20:14 +0000
From: Luis Chamberlain <mcgrof@kernel.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v4] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
Message-ID: <20210519032014.GS4332@42.do-not-panic.com>
References: <20210518155921.4181-1-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518155921.4181-1-mail@anirudhrb.com>
Cc: syzbot+de271708674e2093097b@syzkaller.appspotmail.com,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 Junyong Sun <sunjy516@gmail.com>,
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

On Tue, May 18, 2021 at 09:29:20PM +0530, Anirudh Rayabharam wrote:
> This use-after-free happens when a fw_priv object has been freed but
> hasn't been removed from the pending list (pending_fw_head). The next
> time fw_load_sysfs_fallback tries to insert into the list, it ends up
> accessing the pending_list member of the previoiusly freed fw_priv.
> 
> The root cause here is that all code paths that abort the fw load
> don't delete it from the pending list. For example:
> 
> 	_request_firmware()
> 	  -> fw_abort_batch_reqs()
> 	      -> fw_state_aborted()
> 
> To fix this, delete the fw_priv from the list in __fw_set_state() if
> the new state is DONE or ABORTED. This way, all aborts will remove
> the fw_priv from the list. Accordingly, remove calls to list_del_init
> that were being made before calling fw_state_(aborted|done)().
> 
> Also, in fw_load_sysfs_fallback, don't add the fw_priv to the list
> if it is already aborted. Instead, just jump out and return early.
> 
> Fixes: bcfbd3523f3c ("firmware: fix a double abort case with fw_load_sysfs_fallback")
> Reported-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> Tested-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
> 
> Changes in v4:
> Documented the reasons behind the error codes returned from
> fw_sysfs_wait_timeout() as suggested by Luis Chamberlain.
> 
> Changes in v3:
> Modified the patch to incorporate suggestions by Luis Chamberlain in
> order to fix the root cause instead of applying a "band-aid" kind of
> fix.
> https://lore.kernel.org/lkml/20210403013143.GV4332@42.do-not-panic.com/
> 
> Changes in v2:
> 1. Fixed 1 error and 1 warning (in the commit message) reported by
> checkpatch.pl. The error was regarding the format for referring to
> another commit "commit <sha> ("oneline")". The warning was for line
> longer than 75 chars. 
> 
> ---
>  drivers/base/firmware_loader/fallback.c | 46 ++++++++++++++++++-------
>  drivers/base/firmware_loader/firmware.h |  6 +++-
>  drivers/base/firmware_loader/main.c     |  2 ++
>  3 files changed, 40 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> index 91899d185e31..f244c7b89ba5 100644
> --- a/drivers/base/firmware_loader/fallback.c
> +++ b/drivers/base/firmware_loader/fallback.c
> @@ -70,7 +70,31 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_priv)
>  
>  static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long timeout)
>  {
> -	return __fw_state_wait_common(fw_priv, timeout);
> +	int ret = __fw_state_wait_common(fw_priv, timeout);
> +
> +	/*
> +	 * A signal could be sent to abort a wait. Consider Android's init
> +	 * gettting a SIGCHLD, which in turn was the same process issuing the
> +	 * sysfs store call for the fallback. In such cases we want to be able
> +	 * to tell apart in userspace when a signal caused a failure on the
> +	 * wait. In such cases we'd get -ERESTARTSYS.
> +	 *
> +	 * Likewise though another race can happen and abort the load earlier.
> +	 *
> +	 * In either case the situation is interrupted so we just inform
> +	 * userspace of that and we end things right away.
> +	 *
> +	 * When we really time out just tell userspace it should try again,
> +	 * perhaps later.
> +	 */
> +	if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
> +		ret = -EINTR;
> +	else if (ret == -ETIMEDOUT)
> +		ret = -EAGAIN;


Shuah has explained to me that the only motivation on her part with
using -EAGAIN on commit 0542ad88fbdd81bb ("firmware loader: Fix
_request_firmware_load() return val for fw load abort") was to
distinguish the error from -ENOMEM, and so there was no real
reason to stick to -EAGAIN. Given -EAGAIN is used typically to
ask user to retry, but it makes no sense in this case since the
sysfs interface is ephemeral, I think we should do away with it
and document this rationale.

I think we should stick to use -ETIMEDOUT. Its more telling of what
happened. And so I think just removing the check should do it, but
augmenting the comment should suffice.

Since this change is already big, it would be good for this other
change to go in as a separate change. If you can test to ensure the
-ETIMEDOUT does indeed get propagated that'd be appreciated.

Otherwise looks good. Thanks for your patience!

  Luis

> +	else if (fw_priv->is_paged_buf && !fw_priv->data)
> +		ret = -ENOMEM;
> +
> +	return ret;
>  }
>  
>  struct fw_sysfs {
> @@ -91,10 +115,9 @@ static void __fw_load_abort(struct fw_priv *fw_priv)
>  	 * There is a small window in which user can write to 'loading'
>  	 * between loading done and disappearance of 'loading'
>  	 */
> -	if (fw_sysfs_done(fw_priv))
> +	if (fw_state_is_aborted(fw_priv) || fw_sysfs_done(fw_priv))
>  		return;
>  
> -	list_del_init(&fw_priv->pending_list);
>  	fw_state_aborted(fw_priv);
>  }
>  
> @@ -280,7 +303,6 @@ static ssize_t firmware_loading_store(struct device *dev,
>  			 * Same logic as fw_load_abort, only the DONE bit
>  			 * is ignored and we set ABORT only on failure.
>  			 */
> -			list_del_init(&fw_priv->pending_list);
>  			if (rc) {
>  				fw_state_aborted(fw_priv);
>  				written = rc;
> @@ -513,6 +535,11 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
>  	}
>  
>  	mutex_lock(&fw_lock);
> +	if (fw_state_is_aborted(fw_priv)) {
> +		mutex_unlock(&fw_lock);
> +		retval = -EINTR;
> +		goto out;
> +	}
>  	list_add(&fw_priv->pending_list, &pending_fw_head);
>  	mutex_unlock(&fw_lock);
>  
> @@ -526,20 +553,13 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
>  	}
>  
>  	retval = fw_sysfs_wait_timeout(fw_priv, timeout);
> -	if (retval < 0 && retval != -ENOENT) {
> +	if (retval < 0) {
>  		mutex_lock(&fw_lock);
>  		fw_load_abort(fw_sysfs);
>  		mutex_unlock(&fw_lock);
>  	}
>  
> -	if (fw_state_is_aborted(fw_priv)) {
> -		if (retval == -ERESTARTSYS)
> -			retval = -EINTR;
> -		else
> -			retval = -EAGAIN;
> -	} else if (fw_priv->is_paged_buf && !fw_priv->data)
> -		retval = -ENOMEM;
> -
> +out:
>  	device_del(f_dev);
>  err_put_dev:
>  	put_device(f_dev);
> diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
> index 63bd29fdcb9c..36bdb413c998 100644
> --- a/drivers/base/firmware_loader/firmware.h
> +++ b/drivers/base/firmware_loader/firmware.h
> @@ -117,8 +117,12 @@ static inline void __fw_state_set(struct fw_priv *fw_priv,
>  
>  	WRITE_ONCE(fw_st->status, status);
>  
> -	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED)
> +	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED) {
> +#ifdef CONFIG_FW_LOADER_USER_HELPER
> +		list_del_init(&fw_priv->pending_list);
> +#endif
>  		complete_all(&fw_st->completion);
> +	}
>  }
>  
>  static inline void fw_state_aborted(struct fw_priv *fw_priv)
> diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
> index 4fdb8219cd08..68c549d71230 100644
> --- a/drivers/base/firmware_loader/main.c
> +++ b/drivers/base/firmware_loader/main.c
> @@ -783,8 +783,10 @@ static void fw_abort_batch_reqs(struct firmware *fw)
>  		return;
>  
>  	fw_priv = fw->priv;
> +	mutex_lock(&fw_lock);
>  	if (!fw_state_is_aborted(fw_priv))
>  		fw_state_aborted(fw_priv);
> +	mutex_unlock(&fw_lock);
>  }
>  
>  /* called from request_firmware() and request_firmware_work_func() */
> -- 
> 2.26.2
> 
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
