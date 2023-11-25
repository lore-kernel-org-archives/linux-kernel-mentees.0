Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB63B666
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0PMKZlnJ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ECD4822A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:28:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0ECD4822A2
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=0PMKZlnJ
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5pVZVwtrY7CJ
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Sat, 25 Nov 2023 08:28:50 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by smtp1.osuosl.org (Postfix) with ESMTPS id E333E822A1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 25 Nov 2023 08:28:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E333E822A1
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD8E2CE2C0A;
	Sat, 25 Nov 2023 08:28:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AB4C433C8;
	Sat, 25 Nov 2023 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700900925;
	bh=Ttd2JPImbaXNmJFp7qDlKcqm2O5oVQSU4Y49sjSoDBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0PMKZlnJ0LjUF/WkotChtMS9ENEkoogCTXi80f3DWkWsXfurS0ZoGk2/laLRrCipP
	 t3lnasxfSuNOifKsLs2pelA7v409D/3AkwvDNz4AyxU3aDKxui11JxIsWElsg5jUKC
	 u2IG4oE3H+GmQwtwMe34Sr5JpgG7Mh/GJiGvFBVY=
Date: Sat, 25 Nov 2023 08:28:42 +0000
From: Greg KH <gregkh@linuxfoundation.org>
To: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	Phillip Potter <phil@philpotter.co.uk>
Subject: Re: [PATCH V3] media: stk1160: Fixed high volume of stk1160_dbg
 messages
Message-ID: <2023112508-clothing-twirl-fe40@gregkh>
References: <20231125073738.649948-1-ghanshyam1898@gmail.com>
 <2023112554-bagginess-banker-089e@gregkh>
 <CAG-BmocpXo5GY7KSh-nnw7Z6ExkMGKxetoeSdbyNjrqFCGJLQA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAG-BmocpXo5GY7KSh-nnw7Z6ExkMGKxetoeSdbyNjrqFCGJLQA@mail.gmail.com>

On Sat, Nov 25, 2023 at 01:51:35PM +0530, Ghanshyam Agrawal wrote:
> On Sat, Nov 25, 2023 at 1:18 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Nov 25, 2023 at 01:07:38PM +0530, Ghanshyam Agrawal wrote:
> > > The function stk1160_dbg gets called too many times, which causes
> > > the output to get flooded with messages. Since stk1160_dbg uses
> > > printk, it is now replaced with printk_ratelimited directly.
> > >
> > > Suggested-by: Phillip Potter <phil@philpotter.co.uk>
> > > Signed-off-by: Ghanshyam Agrawal <ghanshyam1898@gmail.com>
> > > ---
> > > V3:
> > > Fixed the issue with my patch needing previous versions being applied
> > > first.
> > >
> > > Used printk_ratelimited instead of dev_warn_ratelimited because
> > > of compiler error "incompatible pointer type".
> > >
> > > V2:
> > > To add KERN_WARNING in printk_ratelimited, and later as per warning by
> > > the checkpatch script, replaced  printk_ratelimited with
> > > dev_warn_ratelimited.
> > >
> > > V1:
> > > The function stk1160_dbg gets called too many times, which causes
> > > the output to get flooded with messages. Since stk1160_dbg uses
> > > printk, it is now replaced with dev_warn_ratelimited.
> > >
> > >  drivers/media/usb/stk1160/stk1160-video.c | 5 ++---
> > >  1 file changed, 2 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/usb/stk1160/stk1160-video.c b/drivers/media/usb/stk1160/stk1160-video.c
> > > index 4e966f6bf608..98417fa31d70 100644
> > > --- a/drivers/media/usb/stk1160/stk1160-video.c
> > > +++ b/drivers/media/usb/stk1160/stk1160-video.c
> > > @@ -107,8 +107,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
> > >
> > >       /*
> > >        * TODO: These stk1160_dbg are very spammy!
> > > -      * We should 1) check why we are getting them
> > > -      * and 2) add ratelimit.
> > > +      * We should check why we are getting them.
> > >        *
> > >        * UPDATE: One of the reasons (the only one?) for getting these
> > >        * is incorrect standard (mismatch between expected and configured).
> > > @@ -151,7 +150,7 @@ void stk1160_copy_video(struct stk1160 *dev, u8 *src, int len)
> > >
> > >       /* Let the bug hunt begin! sanity checks! */
> > >       if (lencopy < 0) {
> > > -             stk1160_dbg("copy skipped: negative lencopy\n");
> > > +             printk_ratelimited(KERN_WARNING "copy skipped: negative lencopy\n");
> >
> > You changed a debug message level to a KERN_WARNING level?  That feels
> > like a step backwards.
> >
> > thanks,
> >
> > greg k-h
> 
> Hi Greg,
> 
> Thanks for your response. The log level should indeed be DEBUG
> as it was earlier.
> 
> I only wanted to add a rate limit there because it was printing too
> many log messages as mentioned in the todo. Shall I update the
> log level  to DEBUG and resend the patch? Thank you very much
> again.

If it's spamming the logs, why print anything at all as obviously
everyone is ignoring it?  But I do not really know, the final decision
should be up to the developer and maintainer of this subsystem.

thanks,

greg k-h
