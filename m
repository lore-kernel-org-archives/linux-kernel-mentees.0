Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8A92D6E56
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 05:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756878299; cv=none; b=XHl/MkHq2UzDxOo3B2UDXhe79RODkHqFrQZocHL9nuXbK3zTfqC/wLWY/trA6oZTcKv9RLnvJJWy+2qROrSYO/5+S9cOQNniDi1/rPJbMsnNNvFD8p7cwAvQiSrJUvR/ZWwzKcbq7vwTrsQdLFOyfMZ+fJgOrH92qs0VpSZUGSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756878299; c=relaxed/simple;
	bh=dnt2MEmrIvJF7XGPO77ZR3yS3QcXQoAMCyOD6LOtEyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcEYVyMGQ8/DSeR34F/CkAERv5EAgpiaoy7Gam5OvIdQvlADUezefgCwGe+EmDqiDwaNdq2QQh2vPwGgIOojAJVjf6FRreYQSOyGy3sJwDuc6gMQ7yiIftYVMTbfRTQyxVnACL5fbS/uw8WZ3SX8wXjnvMwwhXMqQg8Jhgloeqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HnsZhvlX; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HnsZhvlX"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC3D84073
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 05:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.101
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7VYCxpvEEGyG for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed,  3 Sep 2025 05:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 81EB3840A5
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81EB3840A5
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=HnsZhvlX
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 81EB3840A5
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed,  3 Sep 2025 05:44:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BD0D43048;
	Wed,  3 Sep 2025 05:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9116C4CEF0;
	Wed,  3 Sep 2025 05:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756878296;
	bh=dnt2MEmrIvJF7XGPO77ZR3yS3QcXQoAMCyOD6LOtEyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnsZhvlXjEUg/xA8oKDrQ2oXrPsjRPW02FH4w7k2teyUJYQnHLYmmkBMxVJDtZWuZ
	 LKfMqoV4fmonLDmBJ2n6dJm4QCebGCPLC1z5Vx538TBZ2/LloTAyu0fS2VUjO2ewgw
	 mWFAvkqkBaD4bY8KedRTDK2ecpNNA6ymTcJQiKqU=
Date: Wed, 3 Sep 2025 07:44:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: bhanuseshukumar <bhanuseshukumar@gmail.com>
Cc: rydberg@bitmath.org, dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] Input: bcm5974 - Driver cleanup by replacing dprintk
 with dev_dbg
Message-ID: <2025090307-oversight-amaretto-4adc@gregkh>
References: <20250902164351.36828-1-bhanuseshukumar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250902164351.36828-1-bhanuseshukumar@gmail.com>

On Tue, Sep 02, 2025 at 10:13:51PM +0530, bhanuseshukumar wrote:
> 	Debug printk messages are converted to dev_dbg based logs
> 	for better control over debug messages using dynamic logging.

Why is this indented?

> Signed-off-by: bhanuseshukumar <bhanuseshukumar@gmail.com>

Please use your name, not your email alias.

> ---
>  drivers/input/mouse/bcm5974.c | 21 ++++++++-------------
>  1 file changed, 8 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
> index dfdfb59cc8b5..2791fe0c1932 100644
> --- a/drivers/input/mouse/bcm5974.c
> +++ b/drivers/input/mouse/bcm5974.c
> @@ -156,13 +156,6 @@ MODULE_AUTHOR("Henrik Rydberg");
>  MODULE_DESCRIPTION("Apple USB BCM5974 multitouch driver");
>  MODULE_LICENSE("GPL");
>  
> -#define dprintk(level, format, a...)\
> -	{ if (debug >= level) printk(KERN_DEBUG format, ##a); }
> -
> -static int debug = 1;
> -module_param(debug, int, 0644);
> -MODULE_PARM_DESC(debug, "Activate debugging output");
> -
>  /* button data structure */
>  struct bt_data {
>  	u8 unknown1;		/* constant */
> @@ -547,11 +540,12 @@ static void setup_events_to_report(struct input_dev *input_dev,
>  /* report button data as logical button state */
>  static int report_bt_state(struct bcm5974 *dev, int size)
>  {
> +	struct usb_interface *intf = dev->intf;

No need for this variable.

> +
>  	if (size != sizeof(struct bt_data))
>  		return -EIO;
>  
> -	dprintk(7,
> -		"bcm5974: button data: %x %x %x %x\n",
> +	dev_dbg(&intf->dev, "bcm5974: button data: %x %x %x %x\n",

As you are using dev_dbg(), the prefix "bcm5974:" everywhere is not
needed at all.  Just get rid of that.

As proof, look in the kernel log, now you have much more information
than before, right?

Same for the other changes in this patch, drop the prefix.

thanks,

greg k-h
