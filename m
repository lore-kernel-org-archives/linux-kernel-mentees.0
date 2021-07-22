Return-Path: <SRS0=qmss=MO=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16CA2C4338F
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 19:59:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB8860EB5
	for <linux-kernel-mentees@archiver.kernel.org>; Thu, 22 Jul 2021 19:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AFB8860EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 796CA8343B;
	Thu, 22 Jul 2021 19:59:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1JOv6NO2BY-X; Thu, 22 Jul 2021 19:59:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 8E2F183478;
	Thu, 22 Jul 2021 19:59:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B676C0010;
	Thu, 22 Jul 2021 19:59:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 267F6C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 19:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 06D1A401AD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 19:59:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DG8-w5J5eY9X
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 19:59:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57F2C4002B
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 19:59:28 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id gx2so7642327pjb.5
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 22 Jul 2021 12:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hzmNOJgHcRn2MiGozy1lBfawPHwtsA6A3uBHBd2a0hc=;
 b=HpzTRYVgQ580B5XM8KBji8D8n6ahqMJ6iJOjLti3EFdbh2wRF5DzVQeZe9l1cvLC7T
 ditFCwKcUd6hqJTmZEGrRgRHRm8B6Dk3bnaM1hFOCTKFX4Wci4EAdDXXemLF4B/vbeXM
 shFur1a+265DBU81GGX17iNCS2mDNBwZW5VOOuVcoEJ0OVI0w3vdnSJM5LRv58QbmuIb
 prbz9WoB3O+GmWmwMk/pvHQgKr/HIGGq7Wk/ghE4EuJoVagg7EpeGaEfAUe+exLtYjkH
 AMDPDTsiCjDz8J10XQGLJooFtMbbCdmd6xT4sYo9IACb9hCy7DpqEAUB1mBxHt46NogN
 zpsQ==
X-Gm-Message-State: AOAM530nQbarRCQ1hDNr/JSigbDj+d/AbRhO+cZ2uWtk5n/mQS0vpRBf
 70EZAjwGGEf/Ctds+CMDq2Y=
X-Google-Smtp-Source: ABdhPJx/Vqc4HyEpr1E1bQckHOiQFu0A8y7forK0Rri2gv86diD5A07b+RGp8bSqPiXGEcPrOzkUOg==
X-Received: by 2002:a17:90a:ce18:: with SMTP id
 f24mr1332166pju.82.1626983967603; 
 Thu, 22 Jul 2021 12:59:27 -0700 (PDT)
Received: from garbanzo ([191.96.121.239])
 by smtp.gmail.com with ESMTPSA id w6sm35375831pgh.56.2021.07.22.12.59.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 12:59:26 -0700 (PDT)
Date: Thu, 22 Jul 2021 12:59:24 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v6 1/2] firmware_loader: use -ETIMEDOUT instead of
 -EAGAIN in fw_load_sysfs_fallback
Message-ID: <20210722195924.oezxwv3u3p5k737l@garbanzo>
References: <20210722123229.8731-1-mail@anirudhrb.com>
 <20210722123229.8731-2-mail@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722123229.8731-2-mail@anirudhrb.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
 linux-kernel@vger.kernel.org, rafael@kernel.org
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

On Thu, Jul 22, 2021 at 06:02:28PM +0530, Anirudh Rayabharam wrote:
> The only motivation for using -EAGAIN in commit 0542ad88fbdd81bb
> ("firmware loader: Fix _request_firmware_load() return val for fw load
> abort") was to distinguish the error from -ENOMEM, and so there is no
> real reason in keeping it. Keeping -ETIMEDOU is much telling of what the

Since you'll have to respin, a missing here   ^, also add that the
-ETIMEDOUT is what we'd get when we do time out on the wait, as its
not clear from the conext being changed.

> reason for a failure is, so just use that.
> 
> The rest is just trying to document a bit more of the motivations for the
> error codes, as otherwise we'd lose this information easily.

This is a separate change, and it actually does more than just that.
Moving code around should be done separately. The idea is to
first just remove the -EAGAIN so that the change is *easy* to review.
A remove of a return code *and* a move of code around makes it less
obvious for code review. And part of the comment is wrong now that we
removed -EAGAIN. When breaking patches up please review each change
going into each patch and consider if it makes sense, atomically.

> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> ---
>  drivers/base/firmware_loader/fallback.c | 34 +++++++++++++++++--------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> index 91899d185e31..1db94165feaf 100644
> --- a/drivers/base/firmware_loader/fallback.c
> +++ b/drivers/base/firmware_loader/fallback.c
> @@ -70,7 +70,29 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_priv)
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

This comment is about the check for fw_load_abort() so since the move is
not going to happen when you remove -EAGAIN just leave it out. It can be
added once you do the move.

> +	 *
> +	 * In either case the situation is interrupted so we just inform
> +	 * userspace of that and we end things right away.

Be mindful that this is in context of both cases when re-writing the
patches.

> +	 *
> +	 * When we really time out just tell userspace it should try again,
> +	 * perhaps later.

That's the thing, we're getting rid of that -EAGAIN as it made no sense,
the goal was to just distinguish the error from -ENOMEM. That's it.
Since we are removing the -EAGAIN, this comment makes no sense as we
have clarified with Shuah that the goal of her patch was just to
distinguish the error.

So "tell userspace to try again" makes no sense since if a timeout
happened userspace can't really try again as we have aborted the whole
operation to allow firmware to be uploaded.

In fact, please add that to the commit log which removes the -EAGAIN,
something like:

"Using -EAGAIN is also not correct as this return code is typically used
to tell userspace to try something again, in this case re-using the
sysfs loading interface cannot be retried when a timeout happens, so
the return value is also bogus."

> +	 */
> +	if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
> +		ret = -EINTR;
> +	else if (fw_priv->is_paged_buf && !fw_priv->data)
> +		ret = -ENOMEM;
> +
> +	return ret;
>  }
>  
>  struct fw_sysfs {
> @@ -526,20 +548,12 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
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

All we want to do is remove this -EAGAIN line in one patch. We
don't want to move code to another place. We do this to make code
easier to review.

We preserve the error code from the wait when a signal did not interrupt
the process (-ERESTARTSYS), and so this can only be -ETIMEDOUT.

> -	} else if (fw_priv->is_paged_buf && !fw_priv->data)
> -		retval = -ENOMEM;
> -

Thanks for keeping up with the series!

  Luis
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
