Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE61BE241
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723713676; cv=none; b=swyHoIgF4l5zKGs7lmvMCUdeBVhehBpFYM2pWsj9Gw1liRvAok091HemO3FIKHbVzgVzK1g6bWHF+pgpnfEgDMdc1n077ZAVZfPXfr2HGWIqj8M8tG5kclLSvVpMnwkRahoBDWkCjnTEEQ3pQQwGc4ez4XSfcHXFsE0SeqM2pfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723713676; c=relaxed/simple;
	bh=LEAaTUL/m1UfwuCT5ykEacZwJo/XFbrWRhtoWiRmXHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3U9Ryhuese7q9w2MaacHb99V6HUCHxrtYTq3MRgRfK/u1/UU2VMu20MGCziM2H8LKGzESJSI4DhXshnAnyVMDojcJcc+B+FyY3SCYNac1GlTm2Ays4fIm9HuyVw+fR60RndiI+cVbPQxS2tr9SvKTAmiRCpCUaOUqJ+QTp1KvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RYd7DPkU; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RYd7DPkU"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7397660A65
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pKIMRtd2Eo6Q for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 09:21:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::29; helo=mail-oa1-x29.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E74D60A3D
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E74D60A3D
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RYd7DPkU
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7E74D60A3D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:21:13 +0000 (UTC)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-268eec6c7c1so525071fac.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 02:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723713672; x=1724318472; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pi6j369DIWifgZYQDtobMfSWY9tnI4w0uorMz2TgSfw=;
        b=RYd7DPkUuNGXc+DHZQmljJRiYDqg0AGdPYrbxkfjXodXBWmgRGMzQjgTFs9jD0kr5O
         LrwqpBGFc8KXiQfQ3Sup9fxcag3tZHlcmsnAhaji3ARTA00wVqpLX+1ovl/XumJrCFcc
         ++pCBSrO+XA7IrkVUNyKbrTH1acpI6Rh+Sw/jStmJkRmb/PmMH4rfUASJQE5ZgGsuzGH
         bEKjh+V/TIZpiuExtevc9H0RgjvWhsruC9AYkoA1CE8VwTInhtYCoyfeqqQEBhPk0VO8
         2NqmoL3eBgF0QtKtAp2vfIBWBiEDU74v1iVfNIEpv9XX49lfQchQvbWYAK7kHPeWELqF
         mqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723713672; x=1724318472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pi6j369DIWifgZYQDtobMfSWY9tnI4w0uorMz2TgSfw=;
        b=CtBlbdEDuu2hayLZZhX6T83BM9P6siCsvcykmMGyPlF6q7NUFq5YUbPi7NFsPZVRDg
         7DLsAC/H7SWho6fYvKLlXdhAnS1lX3Y7XUVdVSXSVFCqjV+R8r2dqrxHUthf4uI1ANCv
         S8MNmuDhPxEdczD/eRS61Gyzf8QcZpTNyLwvqLRlIs9EbllANLbvQiIDSPg9EO+RWNe7
         W9uvi88LqHS2Ovjbpx9+2Xzr3spGoHy0YtRtt/Bb9Ia1ZQs5z3+D2L53q7mqOfPszpjn
         70qHSz9KvOZAKpAv+FPXjHbvrw1rznQt+vJuoD2yichfa39FQYVpK97anjXZD/KYbZ9/
         gDNw==
X-Forwarded-Encrypted: i=1; AJvYcCWYj4tWQh2q3Xd3MW8SFY8KfllDwz13ItBy9axu+/j6wBO8So4nGf+ZdG7hZOAQ9U7icTlG8UMftpkUWd5j8igSxvuJc6Pt6Qd1Z0gF3AReZrFWEaJDFs6rjbAg+mzU
X-Gm-Message-State: AOJu0YwsmkEmZhIk3PIKz7uCSzMel6YLsgIVmJcjfSf7/zq+0xMwpKv1
	M/62WwzO0GML1kd0AW+r67sdrLQ8O784LFvzm5rqUhwIiT+jbIvn
X-Google-Smtp-Source: AGHT+IFLqJDIEXOm/K0lfX/wPxuF7uQ7WMGUH1+1NkQVI8GwKgY/Byn8kdtkr9KxEr3jvY/cQJWXJQ==
X-Received: by 2002:a05:6870:7311:b0:254:8666:cded with SMTP id 586e51a60fabf-26fe5a2cd82mr6666647fac.11.1723713672062;
        Thu, 15 Aug 2024 02:21:12 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.235.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef65acsm693923b3a.117.2024.08.15.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 02:21:11 -0700 (PDT)
Date: Thu, 15 Aug 2024 14:49:36 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in
 uvc_v4l2.c
Message-ID: <Zr3IKD4LCrlke+8H@embed-PC.myguest.virtualbox.org>
References: <20240815071416.585559-1-abhishektamboli9@gmail.com>
 <2024081508-okay-underpaid-5029@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024081508-okay-underpaid-5029@gregkh>

Hi Greg,
Thank you for the feedback.

On Thu, Aug 15, 2024 at 10:00:27AM +0200, Greg KH wrote:
> On Thu, Aug 15, 2024 at 12:44:16PM +0530, Abhishek Tamboli wrote:
> > Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> > and uvc_v4l2_enum_format().
> > 
> > Fix the following smatch errors:
> > 
> > drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > 
> > drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > 
> > Also, fix similar issue in uvc_v4l2_try_format() for potential
> > dereferencing of ERR_PTR().
> > 
> > Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> > Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> > Changes in v2:
> > - Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format()
> > 
> >  drivers/usb/gadget/function/uvc_v4l2.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > index a024aecb76dc..8bb88c864b60 100644
> > --- a/drivers/usb/gadget/function/uvc_v4l2.c
> > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> > @@ -121,6 +121,9 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
> >  	list_for_each_entry(format, &uvc->header->formats, entry) {
> >  		const struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
> > 
> > +		if (IS_ERR(fmtdesc))
> > +			continue;
> > +
> >  		if (fmtdesc->fcc == pixelformat) {
> >  			uformat = format->fmt;
> >  			break;
> > @@ -240,6 +243,7 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
> >  	struct uvc_video *video = &uvc->video;
> >  	struct uvcg_format *uformat;
> >  	struct uvcg_frame *uframe;
> > +	const struct uvc_format_desc *fmtdesc;
> >  	u8 *fcc;
> > 
> >  	if (fmt->type != video->queue.queue.type)
> > @@ -277,7 +281,10 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
> >  		fmt->fmt.pix.height = uframe->frame.w_height;
> >  		fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(uformat, uframe);
> >  		fmt->fmt.pix.sizeimage = uvc_get_frame_size(uformat, uframe);
> > -		fmt->fmt.pix.pixelformat = to_uvc_format(uformat)->fcc;
> > +		fmtdesc = to_uvc_format(uformat);
> > +		if (IS_ERR(fmtdesc))
> > +			return -EINVAL;
> 
> Why not return the error given to you?
Returning -EINVAL directly was based on the current implementation of to_uvc_format(), 
which only returns ERR_PTR(-EINVAL) in case of error.
> 
> > +		fmt->fmt.pix.pixelformat = fmtdesc->fcc;
> >  	}
> >  	fmt->fmt.pix.field = V4L2_FIELD_NONE;
> >  	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> > @@ -389,6 +396,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> >  		return -EINVAL;
> > 
> >  	fmtdesc = to_uvc_format(uformat);
> > +	if (IS_ERR(fmtdesc))
> > +		return -EINVAL;
> 
> Same here.
If you'd like me to make the changes to use PTR_ERR()? 
I'll update the patch.

Regards,
Abhishek
