Return-Path: <SRS0=f8HV=MS=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBA83C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 17:22:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8473F60F5D
	for <linux-kernel-mentees@archiver.kernel.org>; Mon, 26 Jul 2021 17:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8473F60F5D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B2F282C04;
	Mon, 26 Jul 2021 17:22:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LH5uhKOg28jH; Mon, 26 Jul 2021 17:22:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 51AFD82A8F;
	Mon, 26 Jul 2021 17:22:17 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 2ABF1C001A;
	Mon, 26 Jul 2021 17:22:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 15A52C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 17:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E4480402A9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 17:22:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sg9Mh5h3TqPk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 17:22:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1EEE540264
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 17:22:14 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 a5-20020a05683012c5b029036edcf8f9a6so10723820otq.3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 26 Jul 2021 10:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rJgYrAAFtcjBWZ81nVHlsdXlwxX21/6y1tWdyXf43yY=;
 b=QuIqSpzgb0vHUIcN2FS3CWw8Pj8HBS/O/RJRt0NraNHThfiVHyjfMdc+mbWg+5YGPY
 f4Za/DglVuVtA/V9iCRWzrbZ+q3YfZBTmUbkE4uqoAHyPL5051Mws6bLqmh/SrhkepsL
 PdiFI2yzMHOUiX+lEjlI6UXVW9WdAuT4GeQ/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rJgYrAAFtcjBWZ81nVHlsdXlwxX21/6y1tWdyXf43yY=;
 b=RJM5BNfhbXpCmJfKlfv9JW7ZgFVa8iPfTzi9VpVN8Q5E/5T/vZH0lnh0BPYSASlbYp
 FFbELnobe/xGETeWdt6qxIPhRAP9llx1npgjItpscG0CiU0CUwZNrBZr0WwUTIny60+/
 JMSKmj2i/9sc7K1KRiPvEmyL19Y/1M1XUL3w6o4yjwwBmG5N9oWYd7DPdS3n/Ca5Z/2w
 jaadqL7khWpkH/SUPzkbTX/F/+7kuTs+yUEHKC+VixNC6la6BJy6IPT2RacIMnyGGrb4
 4Z0+MCHuq/sIcigUl4YOaGoUYAh9uvFCwypj76pF+s70eHmCKyUX0/Q40l1Ak5cCEAB4
 I7Qg==
X-Gm-Message-State: AOAM5328QxuvnnkV528b2mNOXB//UuhSv8LLMmjyLhBPlL1HhsbDDiga
 /u0KJe9THoRxJiYNZObGODgSFhMe
X-Google-Smtp-Source: ABdhPJwbVpoSNaPiCc+cCdG2ojeVa5dFPoNsJOdXoQoFoj4N8ynAHJCZmIp5ct9xYan/saIwxwpeJQ==
X-Received: by 2002:a05:6830:15d1:: with SMTP id
 j17mr12744998otr.292.1627320133142; 
 Mon, 26 Jul 2021 10:22:13 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net.
 [24.9.64.241])
 by smtp.gmail.com with ESMTPSA id c21sm91818oiw.16.2021.07.26.10.22.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 10:22:12 -0700 (PDT)
Subject: Re: [PATCH v7 2/2] firmware_loader: fix use-after-free in
 firmware_fallback_sysfs
To: Anirudh Rayabharam <mail@anirudhrb.com>, mcgrof@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
References: <20210724121134.6364-1-mail@anirudhrb.com>
 <20210724121134.6364-3-mail@anirudhrb.com>
From: Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <2f6f4318-8640-7b22-5492-e74f2af9ba38@linuxfoundation.org>
Date: Mon, 26 Jul 2021 11:22:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210724121134.6364-3-mail@anirudhrb.com>
Content-Language: en-US
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 syzbot+de271708674e2093097b@syzkaller.appspotmail.com
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On 7/24/21 6:11 AM, Anirudh Rayabharam wrote:
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
> that were being made before calling fw_state_(aborted|done).
> 
> Also, in fw_load_sysfs_fallback, don't add the fw_priv to the pending
> list if it is already aborted. Instead, just jump out and return early.
> 
> Fixes: bcfbd3523f3c ("firmware: fix a double abort case with fw_load_sysfs_fallback")
> Reported-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> Tested-by: syzbot+de271708674e2093097b@syzkaller.appspotmail.com
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>   drivers/base/firmware_loader/fallback.c | 10 +++++++---
>   drivers/base/firmware_loader/firmware.h |  6 +++++-
>   drivers/base/firmware_loader/main.c     |  2 ++
>   3 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> index 1a48be0a030e..5d9f372fc9e7 100644
> --- a/drivers/base/firmware_loader/fallback.c
> +++ b/drivers/base/firmware_loader/fallback.c
> @@ -91,10 +91,9 @@ static void __fw_load_abort(struct fw_priv *fw_priv)
>   	 * There is a small window in which user can write to 'loading'
>   	 * between loading done and disappearance of 'loading'
>   	 */

Update the comment to "between loading done/abort"

Rest looks good to me.

> -	if (fw_sysfs_done(fw_priv))
> +	if (fw_state_is_aborted(fw_priv) || fw_sysfs_done(fw_priv))
>   		return;
>   
> -	list_del_init(&fw_priv->pending_list);
>   	fw_state_aborted(fw_priv);
>   }
>   
> @@ -280,7 +279,6 @@ static ssize_t firmware_loading_store(struct device *dev,
>   			 * Same logic as fw_load_abort, only the DONE bit
>   			 * is ignored and we set ABORT only on failure.
>   			 */
> -			list_del_init(&fw_priv->pending_list);
>   			if (rc) {
>   				fw_state_aborted(fw_priv);
>   				written = rc;
> @@ -513,6 +511,11 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
>   	}
>   
>   	mutex_lock(&fw_lock);
> +	if (fw_state_is_aborted(fw_priv)) {
> +		mutex_unlock(&fw_lock);
> +		retval = -EINTR;
> +		goto out;
> +	}
>   	list_add(&fw_priv->pending_list, &pending_fw_head);
>   	mutex_unlock(&fw_lock);
>   
> @@ -538,6 +541,7 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
>   	} else if (fw_priv->is_paged_buf && !fw_priv->data)
>   		retval = -ENOMEM;
>   
> +out:
>   	device_del(f_dev);
>   err_put_dev:
>   	put_device(f_dev);
> diff --git a/drivers/base/firmware_loader/firmware.h b/drivers/base/firmware_loader/firmware.h
> index 63bd29fdcb9c..36bdb413c998 100644
> --- a/drivers/base/firmware_loader/firmware.h
> +++ b/drivers/base/firmware_loader/firmware.h
> @@ -117,8 +117,12 @@ static inline void __fw_state_set(struct fw_priv *fw_priv,
>   
>   	WRITE_ONCE(fw_st->status, status);
>   
> -	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED)
> +	if (status == FW_STATUS_DONE || status == FW_STATUS_ABORTED) {
> +#ifdef CONFIG_FW_LOADER_USER_HELPER

Might be helpful to add a comment that this covers all abort/done
paths

> +		list_del_init(&fw_priv->pending_list);
> +#endif
>   		complete_all(&fw_st->completion);
> +	}
>   }
>   
>   static inline void fw_state_aborted(struct fw_priv *fw_priv)
> diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
> index 4fdb8219cd08..68c549d71230 100644
> --- a/drivers/base/firmware_loader/main.c
> +++ b/drivers/base/firmware_loader/main.c
> @@ -783,8 +783,10 @@ static void fw_abort_batch_reqs(struct firmware *fw)
>   		return;
>   
>   	fw_priv = fw->priv;
> +	mutex_lock(&fw_lock);
>   	if (!fw_state_is_aborted(fw_priv))
>   		fw_state_aborted(fw_priv);
> +	mutex_unlock(&fw_lock);
>   }
>   
>   /* called from request_firmware() and request_firmware_work_func() */
> 

thanks,
-- Shuah
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
