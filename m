Return-Path: <SRS0=ogxK=3S=lists.linuxfoundation.org=linux-kernel-mentees-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E8CC33CB2
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 10:51:31 +0000 (UTC)
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68CA520708
	for <linux-kernel-mentees@archiver.kernel.org>; Wed, 29 Jan 2020 10:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fjCiN/BJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68CA520708
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=linux-kernel-mentees-bounces@lists.linuxfoundation.org
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2A75985F44;
	Wed, 29 Jan 2020 10:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEaie-lTdYZg; Wed, 29 Jan 2020 10:51:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2BEBD85F34;
	Wed, 29 Jan 2020 10:51:30 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 130E8C0178;
	Wed, 29 Jan 2020 10:51:30 +0000 (UTC)
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C943CC0171
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id B801587FE9
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:51:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KJd20k5LSr6a
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:51:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id A7B0B88164
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 29 Jan 2020 10:50:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85E1720720;
 Wed, 29 Jan 2020 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580295015;
 bh=jHwJpm2yRmwh7TjlKXTA2UFU1Yy6KXRu81Yj3516AGA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjCiN/BJOb2/B7vg2e94h8DAzpYS3l38HMIdqnZ0MvLsLuQHXGF6CJ5LiGWk7Uy4n
 skUSY0DwR78Yh17dtmt5PHQnlqrlBCKpZ/rjIqjPXikOg1KWUUffnnvkONMO0jSVct
 r8eKt+0D1j/6ya7l0kBtiyMAQQbpZNhAP0Odd9dU=
Date: Wed, 29 Jan 2020 11:50:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pragat Pandya <pragat.pandya@gmail.com>
Message-ID: <20200129105012.GA3884393@kroah.com>
References: <20200127101343.20415-1-pragat.pandya@gmail.com>
 <20200127101343.20415-10-pragat.pandya@gmail.com>
 <20200127115741.GA1847@kadam>
 <287916429826dd2f14d82f9b7b6b15a9cace2734.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <287916429826dd2f14d82f9b7b6b15a9cace2734.camel@gmail.com>
Cc: devel@driverdev.osuosl.org, valdis.kletnieks@vt.edu,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [Linux-kernel-mentees] [PATCH 09/22] staging: exfat: Rename
	variable "Size" to "size"
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

On Wed, Jan 29, 2020 at 04:10:39PM +0530, Pragat Pandya wrote:
> On Mon, 2020-01-27 at 14:57 +0300, Dan Carpenter wrote:
> > On Mon, Jan 27, 2020 at 03:43:30PM +0530, Pragat Pandya wrote:
> > > Change all the occurences of "Size" to "size" in exfat.
> > > 
> > > Signed-off-by: Pragat Pandya <pragat.pandya@gmail.com>
> > > ---
> > >  drivers/staging/exfat/exfat.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/staging/exfat/exfat.h
> > > b/drivers/staging/exfat/exfat.h
> > > index 52f314d50b91..a228350acdb4 100644
> > > --- a/drivers/staging/exfat/exfat.h
> > > +++ b/drivers/staging/exfat/exfat.h
> > > @@ -233,7 +233,7 @@ struct date_time_t {
> > >  
> > >  struct part_info_t {
> > >  	u32      offset;    /* start sector number of the partition */
> > > -	u32      Size;      /* in sectors */
> > > +	u32      size;      /* in sectors */
> > >  };
> > 
> > We just renamed all the struct members of this without changing any
> > users.  Which suggests that this is unused and can be deleted.
> > 
> > regards,
> > dan carpenter
> > 
> Can I just drop this commit from this patchset and do a separate patch
> to remove the unused structure?

Drop this one, and the other ones that touch this structure, and do a
separate patch.  This series needs fixing up anyway, I can't take it
as-is.

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
