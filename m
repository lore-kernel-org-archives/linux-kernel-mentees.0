Return-Path: <linux-kernel-mentees-bounces@lists.linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AAD3C4708E
	for <linux-kernel-mentees@archiver.kernel.org>; Wed,  1 Nov 2023 17:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42BD7431DD;
	Wed,  1 Nov 2023 17:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42BD7431DD
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=gp/1JaVg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DgN9lIbDcYZ3; Wed,  1 Nov 2023 17:54:19 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp2.osuosl.org (Postfix) with ESMTPS id DE59F431BD;
	Wed,  1 Nov 2023 17:54:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE59F431BD
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C86D6C0072;
	Wed,  1 Nov 2023 17:54:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 29D66C0032
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECB897045D
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECB897045D
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
 header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg
 header.b=gp/1JaVg
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tVcELBDuRvfx
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:17 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C3FD7045A
 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  1 Nov 2023 17:54:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C3FD7045A
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 64895CE1056;
 Wed,  1 Nov 2023 17:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C845C433C9;
 Wed,  1 Nov 2023 17:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1698861250;
 bh=JAumfjAMArYws76N389UqFy89DYhXF68dhxExokMXXI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gp/1JaVgjaX0aErHXARToRP3jqVB4mU1rKyb6acTpxhiky76TB9Au9YxcUcD2wkVf
 oQ0d2jabJM17qBhkJCxYSHCiUyVLvQm4o4onpY/I4xrc7/ku06ZJRZkOp/RPqQxAiu
 1jzYI9CoeyudoOCLekiRugVrhVBBv6+BxDVgLgrM=
Date: Wed, 1 Nov 2023 18:54:07 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Jos=E9?= Pekkarinen <jose.pekkarinen@foxhound.fi>
Subject: Re: [PATCH] drivers core: lookup sysfs power group before removal
Message-ID: <2023110139-dupe-snipping-5700@gregkh>
References: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231101173627.2658-1-jose.pekkarinen@foxhound.fi>
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

On Wed, Nov 01, 2023 at 07:36:27PM +0200, Jos=E9 Pekkarinen wrote:
> Hinted by syzboot, there is a few cases where the sysfs power group may
> not be there, like the failure while adding it, or adding its runtime
> group, or when the sysfs firmware loader fallback fail to populate. In
> the last case, the device_del function will be called leading to attempt
> to remove the sysfs group. This patch will lookup for it in advance to
> grant that it is effectively there before cleaning it up.
> =

> Reported-by: syzbot+95f2e2439b97575ec3c0@syzkaller.appspotmail.com
> =

> Signed-off-by: Jos=E9 Pekkarinen <jose.pekkarinen@foxhound.fi>
> ---
>  drivers/base/power/sysfs.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/base/power/sysfs.c b/drivers/base/power/sysfs.c
> index a1474fb67db9..6601729c4698 100644
> --- a/drivers/base/power/sysfs.c
> +++ b/drivers/base/power/sysfs.c
> @@ -834,5 +834,7 @@ void dpm_sysfs_remove(struct device *dev)
>  	dev_pm_qos_constraints_destroy(dev);
>  	rpm_sysfs_remove(dev);
>  	sysfs_unmerge_group(&dev->kobj, &pm_wakeup_attr_group);
> -	sysfs_remove_group(&dev->kobj, &pm_attr_group);
> +
> +	if (kernfs_find_and_get((&dev->kobj)->sd, pm_attr_group.name))
> +		sysfs_remove_group(&dev->kobj, &pm_attr_group);

What's to keep it from going away right after finding it?

In other words, what is wrong with removing a group that is not there?
What error happens?  It should be fine, or are you seeing real code
failures somewhere?

Also, I think you just leaked a reference count here, how was this
tested?

thanks,

greg k-h
_______________________________________________
Linux-kernel-mentees mailing list
Linux-kernel-mentees@lists.linuxfoundation.org
https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
