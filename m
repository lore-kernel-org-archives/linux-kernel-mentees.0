Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60CCC4332F
	for <linux-kernel-mentees@archiver.kernel.org>; Fri,  3 Nov 2023 18:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C16F40944;
	Fri,  3 Nov 2023 18:36:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C16F40944
Authentication-Results: smtp4.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VU/FOCJ/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T3m9o12YPPUv; Fri,  3 Nov 2023 18:36:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTPS id B5BEF408F0;
	Fri,  3 Nov 2023 18:36:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B5BEF408F0
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 79E73C0071;
	Fri,  3 Nov 2023 18:36:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4FA8CC0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E5C281992
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:36:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E5C281992
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=VU/FOCJ/
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 01F0Nv4igy_1
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:36:32 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 734DA817B3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  3 Nov 2023 18:36:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734DA817B3
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1D2F7CE1670;
 Fri,  3 Nov 2023 18:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D3DC433C9;
 Fri,  3 Nov 2023 18:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699036589;
 bh=t9OfWxjmRBsqiXsPbyw2EcQvdxCl+LfcMDqz160D6P0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VU/FOCJ/cTCilDbfiLeOP72tgqUIXdMSVGR+Ke5guOy/o/T/rbXj1FufplOpovd+w
 Itxd0lOZTAw1wvsRc9+8rylrt0HhsOmJY6QfDgh+OjdSGr6t4EBqGkhhDCqM8tmeme
 mDRNr1NzPYZtZ4Sg7B5sdiVLT0UnDsz90WxQ6vXs=
Date: Fri, 3 Nov 2023 19:36:21 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drivers core: lookup sysfs power group before removal
Message-ID: <2023110353-bring-contented-c9f8@gregkh>
References: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
 <2023110139-dupe-snipping-5700@gregkh>
 <835b2930c710381b8da38eca821aa92d@foxhound.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <835b2930c710381b8da38eca821aa92d@foxhound.fi>
Cc: len.brown@intel.com, linux-pm@vger.kernel.org, rafael@kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+95f2e2439b97575ec3c0@syzkaller.appspotmail.com, pavel@ucw.cz,
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-kernel-mentees-bounces@lists.linuxfoundation.org
Sender: "Linux-kernel-mentees"
 <linux-kernel-mentees-bounces@lists.linuxfoundation.org>

On Fri, Nov 03, 2023 at 07:49:39PM +0200, Jos=E9 Pekkarinen wrote:
> On 2023-11-01 19:54, Greg KH wrote:
> > On Wed, Nov 01, 2023 at 07:36:27PM +0200, Jos=E9 Pekkarinen wrote:
> > > Hinted by syzboot, there is a few cases where the sysfs power group
> > > may
> > > not be there, like the failure while adding it, or adding its runtime
> > > group, or when the sysfs firmware loader fallback fail to populate. In
> > > the last case, the device_del function will be called leading to
> > > attempt
> > > to remove the sysfs group. This patch will lookup for it in advance to
> > > grant that it is effectively there before cleaning it up.
> > > =

> > > Reported-by: syzbot+95f2e2439b97575ec3c0@syzkaller.appspotmail.com
> > > =

> > > Signed-off-by: Jos=E9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> > > ---
> > >  drivers/base/power/sysfs.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > =

> > > diff --git a/drivers/base/power/sysfs.c b/drivers/base/power/sysfs.c
> > > index a1474fb67db9..6601729c4698 100644
> > > --- a/drivers/base/power/sysfs.c
> > > +++ b/drivers/base/power/sysfs.c
> > > @@ -834,5 +834,7 @@ void dpm_sysfs_remove(struct device *dev)
> > >  	dev_pm_qos_constraints_destroy(dev);
> > >  	rpm_sysfs_remove(dev);
> > >  	sysfs_unmerge_group(&dev->kobj, &pm_wakeup_attr_group);
> > > -	sysfs_remove_group(&dev->kobj, &pm_attr_group);
> > > +
> > > +	if (kernfs_find_and_get((&dev->kobj)->sd, pm_attr_group.name))
> > > +		sysfs_remove_group(&dev->kobj, &pm_attr_group);
> > =

> > What's to keep it from going away right after finding it?
> > =

> > In other words, what is wrong with removing a group that is not there?
> > What error happens?  It should be fine, or are you seeing real code
> > failures somewhere?
> =

>     No, this is just hitting a warning that sysbot complains about by
> setting panic on warning, no big deal, though it can be a wrong behaviour
> in ueagle-atm driver, since it defines to disconnect the device if the
> firmware is not there, no matter the sysfs fallback.

Then fix the driver please.

And what warning are you seeing exactly?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
