Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D18EC4167D
	for <linux-kernel-mentees@archiver.kernel.org>; Tue,  7 Nov 2023 09:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0B9F417D8;
	Tue,  7 Nov 2023 09:53:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A0B9F417D8
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Lst+1i6g
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s1_dHWRQh0Gp; Tue,  7 Nov 2023 09:53:30 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1C4F0417CB;
	Tue,  7 Nov 2023 09:53:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C4F0417CB
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EB3B7C0039;
	Tue,  7 Nov 2023 09:53:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id CA8A8C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:53:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9194A417D3
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:53:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9194A417D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XBux24Aiuobz
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:53:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7DAA5417CB
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  7 Nov 2023 09:53:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DAA5417CB
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 53D1C60DDC;
 Tue,  7 Nov 2023 09:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A14F1C433C7;
 Tue,  7 Nov 2023 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1699350806;
 bh=DA0JawH4OXqawayuIjowXm96ODaep8O9+ehWDI0jCxY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lst+1i6gzIOSuXeN/XntOhQ3vjuv8Dnz1NyyPTZUOhU5nsa3mU+4Y6WgtxzwBqlz4
 zPEAC7GBtyUYuqen1cYQjr2KPWLoswcJbJ0sifnviJa3xAxKVrsoDMrexcJw4koj+6
 Kh4vQmvnbWlBHNLk376+R7VAPa4sNg5Pu2WtWaw4=
Date: Tue, 7 Nov 2023 10:53:23 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drivers core: lookup sysfs power group before removal
Message-ID: <2023110706-mustiness-arbitrary-fc9f@gregkh>
References: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
 <2023110139-dupe-snipping-5700@gregkh>
 <835b2930c710381b8da38eca821aa92d@foxhound.fi>
 <2023110353-bring-contented-c9f8@gregkh>
 <e13104c9e55b0bd8eee0a333b3ed7975@foxhound.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e13104c9e55b0bd8eee0a333b3ed7975@foxhound.fi>
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

On Tue, Nov 07, 2023 at 10:56:20AM +0200, Jos=E9 Pekkarinen wrote:
> On 2023-11-03 20:36, Greg KH wrote:
> > On Fri, Nov 03, 2023 at 07:49:39PM +0200, Jos=E9 Pekkarinen wrote:
> > > On 2023-11-01 19:54, Greg KH wrote:
> > > > On Wed, Nov 01, 2023 at 07:36:27PM +0200, Jos=E9 Pekkarinen wrote:
> > > > > Hinted by syzboot, there is a few cases where the sysfs power gro=
up
> > > > > may
> > > > > not be there, like the failure while adding it, or adding its run=
time
> > > > > group, or when the sysfs firmware loader fallback fail to populat=
e. In
> > > > > the last case, the device_del function will be called leading to
> > > > > attempt
> > > > > to remove the sysfs group. This patch will lookup for it in advan=
ce to
> > > > > grant that it is effectively there before cleaning it up.
> > > > >
> > > > > Reported-by: syzbot+95f2e2439b97575ec3c0@syzkaller.appspotmail.com
> > > > >
> > > > > Signed-off-by: Jos=E9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> > > > > ---
> > > > >  drivers/base/power/sysfs.c | 4 +++-
> > > > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/base/power/sysfs.c b/drivers/base/power/sysf=
s.c
> > > > > index a1474fb67db9..6601729c4698 100644
> > > > > --- a/drivers/base/power/sysfs.c
> > > > > +++ b/drivers/base/power/sysfs.c
> > > > > @@ -834,5 +834,7 @@ void dpm_sysfs_remove(struct device *dev)
> > > > >  	dev_pm_qos_constraints_destroy(dev);
> > > > >  	rpm_sysfs_remove(dev);
> > > > >  	sysfs_unmerge_group(&dev->kobj, &pm_wakeup_attr_group);
> > > > > -	sysfs_remove_group(&dev->kobj, &pm_attr_group);
> > > > > +
> > > > > +	if (kernfs_find_and_get((&dev->kobj)->sd, pm_attr_group.name))
> > > > > +		sysfs_remove_group(&dev->kobj, &pm_attr_group);
> > > >
> > > > What's to keep it from going away right after finding it?
> > > >
> > > > In other words, what is wrong with removing a group that is not the=
re?
> > > > What error happens?  It should be fine, or are you seeing real code
> > > > failures somewhere?
> > > =

> > >     No, this is just hitting a warning that sysbot complains about by
> > > setting panic on warning, no big deal, though it can be a wrong
> > > behaviour
> > > in ueagle-atm driver, since it defines to disconnect the device if the
> > > firmware is not there, no matter the sysfs fallback.
> > =

> > Then fix the driver please.
> =

>     I'm afraid I was wrong in the assumption that the probe return value
> of the driver would influence the testing result, so this no longer seems
> fixable from driver side.

Why is it not fixable from the driver side?  It is the code that is
creating, and then removing, the files, not the driver core, or am I
missing something here?

> It may be fixed here in the base, in the sysfs or not to fix it at all
> since this seem to be a very difficult to reach situation. I'm fine
> with any approach, and I can do the work, I'd just like to read what
> are your preferences on the topic.

Please prove that the driver is not the offending one here first please,
otherwise, why isn't this an issue for all drivers?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
