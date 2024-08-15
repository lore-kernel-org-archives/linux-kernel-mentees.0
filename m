Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C604DCA62
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 08:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723708837; cv=none; b=g0REQsZ2lq8wTJSJiqQFKzMcdamf7kuXWaLLF8iIMIlbM9+aYaIhKoUcAXPuN7e0fRbgfw8UXjLryq+IvL0dNB8Vl1V2RcS3z00NVo7GeszXlUx/OdHdxTFX8FS0wJoNusk5yYVQz2MH4UGbyFuZWgDckkbjFf+uRBO2QKSKr+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723708837; c=relaxed/simple;
	bh=DQJzm3EzhbhaybFUp7o+vMcVN/96TcrgKrTc4d6ffMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PVN8jA6afwuPc2bPR60a1WYEfZvxaPYQHGnEjM1mdOXoTo/hLRKViWOF3WCBaVOZrUNmnuv+H2VQXF4N3ugWTz0PZEP2w7FfUr000I8KMxLVnQr00t7F5DWp94iRbxnas5KWAmwWRRzFbytpcFX//9RbX0i+DJn+bEwc8Ymdv7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N+KNAyA4; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N+KNAyA4"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5469140E1A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 08:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B-e7EE5b3anj for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 08:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CE6EC40E18
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6EC40E18
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=N+KNAyA4
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp2.osuosl.org (Postfix) with ESMTPS id CE6EC40E18
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 08:00:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D72C761A3E;
	Thu, 15 Aug 2024 08:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B05FAC4AF09;
	Thu, 15 Aug 2024 08:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723708831;
	bh=DQJzm3EzhbhaybFUp7o+vMcVN/96TcrgKrTc4d6ffMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N+KNAyA4rxZOaW1YZVQQXEydEEIf0zOwT63OIt3zb1e2K7CZNZ3qbCsLuNB9fn0BH
	 SuBxrQe6VouB1vblnjjzCklxyEL7rebm328FrtVcA5oEt8jwMR/Se8gBUOYpc1HHwl
	 CYUi/+Our8myjeugTzRkLELq2D/Eile15/YvSLsQ=
Date: Thu, 15 Aug 2024 10:00:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in
 uvc_v4l2.c
Message-ID: <2024081508-okay-underpaid-5029@gregkh>
References: <20240815071416.585559-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815071416.585559-1-abhishektamboli9@gmail.com>

On Thu, Aug 15, 2024 at 12:44:16PM +0530, Abhishek Tamboli wrote:
> Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> and uvc_v4l2_enum_format().
> 
> Fix the following smatch errors:
> 
> drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> 
> drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> error: 'fmtdesc' dereferencing possible ERR_PTR()
> 
> Also, fix similar issue in uvc_v4l2_try_format() for potential
> dereferencing of ERR_PTR().
> 
> Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
> Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> ---
> Changes in v2:
> - Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format()
> 
>  drivers/usb/gadget/function/uvc_v4l2.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> index a024aecb76dc..8bb88c864b60 100644
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
> @@ -240,6 +243,7 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  	struct uvc_video *video = &uvc->video;
>  	struct uvcg_format *uformat;
>  	struct uvcg_frame *uframe;
> +	const struct uvc_format_desc *fmtdesc;
>  	u8 *fcc;
> 
>  	if (fmt->type != video->queue.queue.type)
> @@ -277,7 +281,10 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
>  		fmt->fmt.pix.height = uframe->frame.w_height;
>  		fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(uformat, uframe);
>  		fmt->fmt.pix.sizeimage = uvc_get_frame_size(uformat, uframe);
> -		fmt->fmt.pix.pixelformat = to_uvc_format(uformat)->fcc;
> +		fmtdesc = to_uvc_format(uformat);
> +		if (IS_ERR(fmtdesc))
> +			return -EINVAL;

Why not return the error given to you?

> +		fmt->fmt.pix.pixelformat = fmtdesc->fcc;
>  	}
>  	fmt->fmt.pix.field = V4L2_FIELD_NONE;
>  	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> @@ -389,6 +396,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>  		return -EINVAL;
> 
>  	fmtdesc = to_uvc_format(uformat);
> +	if (IS_ERR(fmtdesc))
> +		return -EINVAL;

Same here.

thanks,

greg k-h
