Return-Path: <SRS0=pZ6u=MP=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8A67C432BE
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 13:59:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9158560EBD
	for <linux-kernel-mentees@archiver.kernel.org>; Fri, 23 Jul 2021 13:59:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9158560EBD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=anirudhrb.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5434D4062A;
	Fri, 23 Jul 2021 13:59:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wDePzSzpiipC; Fri, 23 Jul 2021 13:59:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 23991405DA;
	Fri, 23 Jul 2021 13:59:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01D2CC0010;
	Fri, 23 Jul 2021 13:59:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C82E7C000E
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 13:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B707440141
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 13:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=anirudhrb.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UvFbze7WMtx7
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 13:59:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from sender4-of-o53.zoho.com (sender4-of-o53.zoho.com
 [136.143.188.53])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA9E1400EF
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 23 Jul 2021 13:59:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1627048750; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=R8M6pot0KH4dBzYhafMRyWWGB8/RpxJcQ5CZNrura6RNKkGPrxPpYtEIJRHQmod0R4o4XTd1+LIIQIAqNivy81+RLpqc52NuGgaLfDLbSEvHJml+FAD5V9DeX7pgNwxSrnjJVBe6SPOmP4AN4MiZYPUe5HjqZuGY6KB6VyXIaEU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1627048750;
 h=Content-Type:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=TxpcFVdjVneetVPAjUhcJ85V0DPbb9fcU0f8xmSlZCE=; 
 b=UH7TT2aQe/DTviBsDNzO7AtuYY9mzkfbxYyLCsyEN/vDJbnZ/DDJN25BkwEfF/h6DwwNIAK+h93D4NBsHFJCjFygjJYZs+DPh6+KK4PFHQ2HkgEtD29OlSkW75rJ1H9SxoRIYfcqT3Brh760Dvx87zXhdNUpeAbNi8n+qu6j+Ms=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=anirudhrb.com;
 spf=pass  smtp.mailfrom=mail@anirudhrb.com;
 dmarc=pass header.from=<mail@anirudhrb.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1627048750; 
 s=zoho; d=anirudhrb.com; i=mail@anirudhrb.com;
 h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To;
 bh=TxpcFVdjVneetVPAjUhcJ85V0DPbb9fcU0f8xmSlZCE=;
 b=K6nCnkqU7tCPuhUgjFkvSoP16gLrGI3OQ1x68NdBSud+pciHAWOP2MWzjLuTIfKO
 6NOauLuOYUwiPQDq/u7ad0Pf8JPsy4hxX6BTj0VyLLIaAFN/PFqEh0Daz7FjZIEiclt
 MeUsIzKs5+16sUW4E7mKyYPbwt9xf7Vjr5zbuxbo=
Received: from anirudhrb.com (106.51.106.224 [106.51.106.224]) by
 mx.zohomail.com with SMTPS id 1627048746832872.2996466596402;
 Fri, 23 Jul 2021 06:59:06 -0700 (PDT)
Date: Fri, 23 Jul 2021 19:28:59 +0530
From: Anirudh Rayabharam <mail@anirudhrb.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: [PATCH v6 1/2] firmware_loader: use -ETIMEDOUT instead of
 -EAGAIN in fw_load_sysfs_fallback
Message-ID: <YPrLIzMpSghz6YGL@anirudhrb.com>
References: <20210722123229.8731-1-mail@anirudhrb.com>
 <20210722123229.8731-2-mail@anirudhrb.com>
 <20210722195924.oezxwv3u3p5k737l@garbanzo>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210722195924.oezxwv3u3p5k737l@garbanzo>
X-ZohoMailClient: External
Cc: rafael@kernel.org, linux-kernel@vger.kernel.org,
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

On Thu, Jul 22, 2021 at 12:59:24PM -0700, Luis Chamberlain wrote:
> On Thu, Jul 22, 2021 at 06:02:28PM +0530, Anirudh Rayabharam wrote:
> > The only motivation for using -EAGAIN in commit 0542ad88fbdd81bb
> > ("firmware loader: Fix _request_firmware_load() return val for fw load
> > abort") was to distinguish the error from -ENOMEM, and so there is no
> > real reason in keeping it. Keeping -ETIMEDOU is much telling of what the
> 
> Since you'll have to respin, a missing here   ^, also add that the
> -ETIMEDOUT is what we'd get when we do time out on the wait, as its
> not clear from the conext being changed.
> 
> > reason for a failure is, so just use that.
> > 
> > The rest is just trying to document a bit more of the motivations for the
> > error codes, as otherwise we'd lose this information easily.
> 
> This is a separate change, and it actually does more than just that.
> Moving code around should be done separately. The idea is to
> first just remove the -EAGAIN so that the change is *easy* to review.
> A remove of a return code *and* a move of code around makes it less
> obvious for code review. And part of the comment is wrong now that we
> removed -EAGAIN. When breaking patches up please review each change
> going into each patch and consider if it makes sense, atomically.
> 
> > Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> > Signed-off-by: Anirudh Rayabharam <mail@anirudhrb.com>
> > ---
> >  drivers/base/firmware_loader/fallback.c | 34 +++++++++++++++++--------
> >  1 file changed, 24 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
> > index 91899d185e31..1db94165feaf 100644
> > --- a/drivers/base/firmware_loader/fallback.c
> > +++ b/drivers/base/firmware_loader/fallback.c
> > @@ -70,7 +70,29 @@ static inline bool fw_sysfs_loading(struct fw_priv *fw_priv)
> >  
> >  static inline int fw_sysfs_wait_timeout(struct fw_priv *fw_priv,  long timeout)
> >  {
> > -	return __fw_state_wait_common(fw_priv, timeout);
> > +	int ret = __fw_state_wait_common(fw_priv, timeout);
> > +
> > +	/*
> > +	 * A signal could be sent to abort a wait. Consider Android's init
> > +	 * gettting a SIGCHLD, which in turn was the same process issuing the
> > +	 * sysfs store call for the fallback. In such cases we want to be able
> > +	 * to tell apart in userspace when a signal caused a failure on the
> > +	 * wait. In such cases we'd get -ERESTARTSYS.
> > +	 *
> > +	 * Likewise though another race can happen and abort the load earlier.
> 
> This comment is about the check for fw_load_abort() so since the move is
> not going to happen when you remove -EAGAIN just leave it out. It can be
> added once you do the move.
> 
> > +	 *
> > +	 * In either case the situation is interrupted so we just inform
> > +	 * userspace of that and we end things right away.
> 
> Be mindful that this is in context of both cases when re-writing the
> patches.
> 
> > +	 *
> > +	 * When we really time out just tell userspace it should try again,
> > +	 * perhaps later.
> 
> That's the thing, we're getting rid of that -EAGAIN as it made no sense,
> the goal was to just distinguish the error from -ENOMEM. That's it.
> Since we are removing the -EAGAIN, this comment makes no sense as we
> have clarified with Shuah that the goal of her patch was just to
> distinguish the error.
> 
> So "tell userspace to try again" makes no sense since if a timeout
> happened userspace can't really try again as we have aborted the whole
> operation to allow firmware to be uploaded.
> 
> In fact, please add that to the commit log which removes the -EAGAIN,
> something like:
> 
> "Using -EAGAIN is also not correct as this return code is typically used
> to tell userspace to try something again, in this case re-using the
> sysfs loading interface cannot be retried when a timeout happens, so
> the return value is also bogus."
> 
> > +	 */
> > +	if (ret == -ERESTARTSYS || fw_state_is_aborted(fw_priv))
> > +		ret = -EINTR;
> > +	else if (fw_priv->is_paged_buf && !fw_priv->data)
> > +		ret = -ENOMEM;
> > +
> > +	return ret;
> >  }
> >  
> >  struct fw_sysfs {
> > @@ -526,20 +548,12 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
> >  	}
> >  
> >  	retval = fw_sysfs_wait_timeout(fw_priv, timeout);
> > -	if (retval < 0 && retval != -ENOENT) {
> > +	if (retval < 0) {
> >  		mutex_lock(&fw_lock);
> >  		fw_load_abort(fw_sysfs);
> >  		mutex_unlock(&fw_lock);
> >  	}
> >  
> > -	if (fw_state_is_aborted(fw_priv)) {
> > -		if (retval == -ERESTARTSYS)
> > -			retval = -EINTR;
> > -		else
> > -			retval = -EAGAIN;
> 
> All we want to do is remove this -EAGAIN line in one patch. We
> don't want to move code to another place. We do this to make code

Is the move necessary or should I drop it from this series entirely?

Thanks for the review!

	- Anirudh.

> easier to review.
> 
> We preserve the error code from the wait when a signal did not interrupt
> the process (-ERESTARTSYS), and so this can only be -ETIMEDOUT.
> 
> > -	} else if (fw_priv->is_paged_buf && !fw_priv->data)
> > -		retval = -ENOMEM;
> > -
> 
> Thanks for keeping up with the series!
> 
>   Luis
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
