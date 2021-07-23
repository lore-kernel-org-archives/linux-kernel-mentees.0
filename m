Return-Path: <SRS0=pZ6u=MP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD54C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 17:26:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C44860EB1
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 17:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C44860EB1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BEF7405A0;
	Fri, 23 Jul 2021 17:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnYNqAQi9gaQ; Fri, 23 Jul 2021 17:26:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 5ACBF400CC;
	Fri, 23 Jul 2021 17:26:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 31E96C0010;
	Fri, 23 Jul 2021 17:26:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4608EC000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 17:26:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21850606FD
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 17:26:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0j12yp-fOUQk
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 17:26:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A6FA606EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 17:26:53 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id k1so3769728plt.12
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 10:26:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eIP+gAEGNdJZ8KZlRhJNzrwP+HxVTKEl8qy9jJpz/Y8=;
 b=CIt2SgmfC+4x4CF+gz5k7IgDQ5n1Vz8zHCytmCWVEnP1P28CaksSoTwKvwN7HGSLG3
 fZfRK4FbkiwfTbQ8+t45gv2fUCVgxjhqqDfvsFzE7BjbGmzNCXGapXjEHYF6TjUW5TgI
 rmWfIksmM9+DB34YoM4aRtQbTSSfVUG2+Cl2fqXbQz47zGRErfck9LDGvOIYaoguAsF/
 W94ADVTUbhf1B3cVpDAA/eGPkjLcllmXzXxl101c1m68LftYAwNYJqdLDbgbL9L3G8Q9
 yfMQDA0QMqtZc4LD72ftwhRX0nhj6zIENSy6c7WoMBMgPJi13alNuYtLYdOO4oJ5yfii
 lNVg==
X-Gm-Message-State: AOAM532r0zHCaV1BEnT5T9R6aS+fuZjKcCCl9/gVDw5UZnTUotHHkNzF
 TsRWNTZAoE6Ft689Co4sSwQ=
X-Google-Smtp-Source: ABdhPJzFSvdsmTNBbMK1sP98CGL3teU4mJjqQXEpZZpuvjaTewxPkFSJ0Xns15C8cpBJr1f5OWPQtA==
X-Received: by 2002:aa7:8509:0:b029:2e5:8cfe:bc17 with SMTP id
 v9-20020aa785090000b02902e58cfebc17mr5714529pfn.2.1627061212441; 
 Fri, 23 Jul 2021 10:26:52 -0700 (PDT)
Received: from garbanzo ([191.96.121.239])
 by smtp.gmail.com with ESMTPSA id j13sm9145526pjl.1.2021.07.23.10.26.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 10:26:51 -0700 (PDT)
Date: Fri, 23 Jul 2021 10:26:49 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Anirudh Rayabharam <mail@anirudhrb.com>
Subject: Re: [PATCH v6 1/2] firmware_loader: use -ETIMEDOUT instead of
 -EAGAIN in fw_load_sysfs_fallback
Message-ID: <20210723172649.t4b2hqlmhk3v7wn5@garbanzo>
References: <20210722123229.8731-1-mail@anirudhrb.com>
 <20210722123229.8731-2-mail@anirudhrb.com>
 <20210722195924.oezxwv3u3p5k737l@garbanzo>
 <YPrLIzMpSghz6YGL@anirudhrb.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YPrLIzMpSghz6YGL@anirudhrb.com>
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

On Fri, Jul 23, 2021 at 07:28:59PM +0530, Anirudh Rayabharam wrote:
> On Thu, Jul 22, 2021 at 12:59:24PM -0700, Luis Chamberlain wrote:
> > On Thu, Jul 22, 2021 at 06:02:28PM +0530, Anirudh Rayabharam wrote:
> > > The only motivation for using -EAGAIN in commit 0542ad88fbdd81bb
> > > ("firmware loader: Fix _request_firmware_load() return val for fw load
> > > abort") was to distinguish the error from -ENOMEM, and so there is no
> > > real reason in keeping it. Keeping -ETIMEDOU is much telling of what the
> > 
> > Since you'll have to respin, a missing here   ^, also add that the
> > -ETIMEDOUT is what we'd get when we do time out on the wait, as its
> > not clear from the conext being changed.
> > 
> > > reason for a failure is, so just use that.
> > > 
> > > The rest is just trying to document a bit more of the motivations for the
> > > error codes, as otherwise we'd lose this information easily.
> > 
> > This is a separate change, and it actually does more than just that.
> > Moving code around should be done separately. The idea is to
> > first just remove the -EAGAIN so that the change is *easy* to review.
> > A remove of a return code *and* a move of code around makes it less
> > obvious for code review. And part of the comment is wrong now that we
> > removed -EAGAIN. When breaking patches up please review each change
> > going into each patch and consider if it makes sense, atomically.
> > 
> > > Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> > > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> > > ---
> > >  drivers/base/firmware_loader/fallback.c | 34 +++++++++++++++++--------
> > >  1 file changed, 24 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> > > index 91899d185e31..1db94165feaf 100644
> > > --- a/drivers/base/firmware_loader/fallback.c
> > > +++ b/drivers/base/firmware_loader/fallback.c
> > > @@ -70,7 +70,29 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_priv)
> > >  
> > >  static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long timeout)
> > >  {
> > > -	return __fw_state_wait_common(fw_priv, timeout);
> > > +	int ret = __fw_state_wait_common(fw_priv, timeout);
> > > +
> > > +	/*
> > > +	 * A signal could be sent to abort a wait. Consider Android's init
> > > +	 * gettting a SIGCHLD, which in turn was the same process issuing the
> > > +	 * sysfs store call for the fallback. In such cases we want to be able
> > > +	 * to tell apart in userspace when a signal caused a failure on the
> > > +	 * wait. In such cases we'd get -ERESTARTSYS.
> > > +	 *
> > > +	 * Likewise though another race can happen and abort the load earlier.
> > 
> > This comment is about the check for fw_load_abort() so since the move is
> > not going to happen when you remove -EAGAIN just leave it out. It can be
> > added once you do the move.
> > 
> > > +	 *
> > > +	 * In either case the situation is interrupted so we just inform
> > > +	 * userspace of that and we end things right away.
> > 
> > Be mindful that this is in context of both cases when re-writing the
> > patches.
> > 
> > > +	 *
> > > +	 * When we really time out just tell userspace it should try again,
> > > +	 * perhaps later.
> > 
> > That's the thing, we're getting rid of that -EAGAIN as it made no sense,
> > the goal was to just distinguish the error from -ENOMEM. That's it.
> > Since we are removing the -EAGAIN, this comment makes no sense as we
> > have clarified with Shuah that the goal of her patch was just to
> > distinguish the error.
> > 
> > So "tell userspace to try again" makes no sense since if a timeout
> > happened userspace can't really try again as we have aborted the whole
> > operation to allow firmware to be uploaded.
> > 
> > In fact, please add that to the commit log which removes the -EAGAIN,
> > something like:
> > 
> > "Using -EAGAIN is also not correct as this return code is typically used
> > to tell userspace to try something again, in this case re-using the
> > sysfs loading interface cannot be retried when a timeout happens, so
> > the return value is also bogus."
> > 
> > > +	 */
> > > +	if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
> > > +		ret = -EINTR;
> > > +	else if (fw_priv->is_paged_buf && !fw_priv->data)
> > > +		ret = -ENOMEM;
> > > +
> > > +	return ret;
> > >  }
> > >  
> > >  struct fw_sysfs {
> > > @@ -526,20 +548,12 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
> > >  	}
> > >  
> > >  	retval = fw_sysfs_wait_timeout(fw_priv, timeout);
> > > -	if (retval < 0 && retval != -ENOENT) {
> > > +	if (retval < 0) {
> > >  		mutex_lock(&fw_lock);
> > >  		fw_load_abort(fw_sysfs);
> > >  		mutex_unlock(&fw_lock);
> > >  	}
> > >  
> > > -	if (fw_state_is_aborted(fw_priv)) {
> > > -		if (retval == -ERESTARTSYS)
> > > -			retval = -EINTR;
> > > -		else
> > > -			retval = -EAGAIN;
> > 
> > All we want to do is remove this -EAGAIN line in one patch. We
> > don't want to move code to another place. We do this to make code
> 
> Is the move necessary or should I drop it from this series entirely?

The move is possible, sure. Maybe do that in a separate patch. But
just read each patch as you write it, and make sure they do just *one*
thing at a time. Re-read the patch once done and make sure each
patch makes sense on its own.

  Luis
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
