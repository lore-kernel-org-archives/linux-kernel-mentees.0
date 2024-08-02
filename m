Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065D51ABEC6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722623893; cv=none; b=BEhCF5NrKSPas9PWT2eSomEFCnHNPuzmJJcFmg8zGg9nV7hrY+X47yZv11NNNVMzxeYyvIg4bjmBq+lnENMluhSDk/c2tiFqTH66IekEI9IaSVsosa5bcgqGikA80T4ONfxdKF9n6bfvpSJP1WSDu5LBRbQWKHJONgx2pWQxY1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722623893; c=relaxed/simple;
	bh=zON6RjPTf5MmxXUFZfGeVjEEpkp2eWNiZ+51r8kW1qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZC5t0YrTaP7JeoLrziyYUVcP4xFidNnSE67QsSjrxBGOwRNFK2MrnpNunt4RVuM3vJxP/hi/6PZRabbXM3MtCzH1wKklFd6WAb8NgqPbulWxj5KXF7JPxwMfoEunprCzqWDV0f/IzVAUYy6IoSB42JscjRjqFeM63X37jJk56A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=r4Nfx163; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="r4Nfx163"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D7E740979
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.102
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyCZ9aCHSg5N for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri,  2 Aug 2024 18:38:10 +0000 (UTC)
X-Greylist: delayed 600 seconds by postgrey-1.37 at util1.osuosl.org; Fri, 02 Aug 2024 18:38:10 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9591C40978
Authentication-Results: smtp4.osuosl.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9591C40978
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=r4Nfx163
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647; helo=perceval.ideasonboard.com; envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 9591C40978
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri,  2 Aug 2024 18:38:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9142496;
	Fri,  2 Aug 2024 20:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722622694;
	bh=zON6RjPTf5MmxXUFZfGeVjEEpkp2eWNiZ+51r8kW1qU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r4Nfx163YkaYMr/xLWiOvqsD+iE0uj/YrfS2NTL5ebnKMOkghmTQst3xVmpGhbPqK
	 roZHoSE1wdrpl8WdxdGCM4DOU04S2AKyUcWmADG52fPDHNkSEhcdXaPYCpGNMiEHRz
	 briRU5UGeuKkwFyIkzvnzZGXY+3LxY8ihUYQEEB4=
Date: Fri, 2 Aug 2024 21:18:41 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: dan.scally@ideasonboard.com, gregkh@linuxfoundation.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Michael Grzeschik <m.grzeschik@pengutronix.de>
Subject: Re: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Message-ID: <20240802181841.GA21917@pendragon.ideasonboard.com>
References: <20240802180247.519273-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240802180247.519273-1-abhishektamboli9@gmail.com>

Hi Abhishek,

(CC'ing Michael Grzeschik)

Thank you for the patch.

On Fri, Aug 02, 2024 at 11:32:47PM +0530, Abhishek Tamboli wrote:
> Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> and uvc_v4l2_enum_format().
> 
> Fix the following smatch errors:
> 
> drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> 
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
>  drivers/usb/gadget/function/uvc_v4l2.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a024aecb76dc..9dd602a742c4 100644
> --- a/drivers/usb/gadget/function/uvc_v4l2.c
> +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> @@ -121,6 +121,9 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
>  	list_for_each_entry(format, &uvc->header->formats, entry) {
>  		const struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
> 
> +		if (IS_ERR(fmtdesc))
> +			continue;
> +
>  		if (fmtdesc->fcc == pixelformat) {
>  			uformat = format->fmt;
>  			break;
> @@ -389,6 +392,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  		return -EINVAL;
> 
>  	fmtdesc = to_uvc_format(uformat);
> +	if (IS_ERR(fmtdesc))
> +		return -EINVAL;
> +
>  	f->pixelformat = fmtdesc->fcc;
> 
>  	return 0;

Michael, you authored this, I'll let you review the patch and decide if
this is a false positive.

-- 
Regards,

Laurent Pinchart
