Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59421C4621
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723714340; cv=none; b=GgOkH+h1DN5zM/spiYf57NmlqlaG+KQpNuNXOchjTbc0et8bP5TDKv6DxFSK1p1tC7IkwOo7wFjue5ZfoR9AyopjI0239NAT+GHOuGXFF+cqpKo2skicPjLiEorZHddfAfMT0GOZkEEf7yKWVxIuY0OLVsssOO2vBoAPeC/o98c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723714340; c=relaxed/simple;
	bh=jZHRHvaX/IzmII2xnKjKwDcMo3fvzr76zrIGPbhbC5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hq+MRNkyzeqKEqZ4jw+fwHM33DNdupYs2MXTLwTgc5iRa+4xAt0SZtJdEdC/hbe8bGEHM320o/aI3zLzbp17rT6fyAPAKs+YOvLf12QE6sB9OkjdS+bL7jxxxsizhxaho0lS1bTz+QMNnD785gxSP195T8JCotydZHHLOzrQqrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=b5w9JmZO; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b5w9JmZO"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 886FF40341
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:32:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -4.401
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vnUSJwNq98bF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 09:32:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7F1EF40334
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F1EF40334
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=b5w9JmZO
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 7F1EF40334
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 09:32:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9453E617B9;
	Thu, 15 Aug 2024 09:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9612C32786;
	Thu, 15 Aug 2024 09:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723714336;
	bh=jZHRHvaX/IzmII2xnKjKwDcMo3fvzr76zrIGPbhbC5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b5w9JmZO/0uLOLEI8W1JTlJCPEZvnb/z+af2l63C499M15qf3Ln68iyBnE5JwtbCK
	 /t88TdX5gUgqjNptY7VMOtjDZr2mv+hE1d565m065Z6gaVEr5hkrY79Jukc9ruWLjR
	 5t/asageQLqEJTB/PsmVoiXyTfwBiblkCnzFs1Gg=
Date: Thu, 15 Aug 2024 11:32:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: dan.scally@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	dan.carpenter@linaro.org, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: uvc: Fix ERR_PTR dereference in
 uvc_v4l2.c
Message-ID: <2024081508-swinger-arrange-02dd@gregkh>
References: <20240815071416.585559-1-abhishektamboli9@gmail.com>
 <2024081508-okay-underpaid-5029@gregkh>
 <Zr3IKD4LCrlke+8H@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zr3IKD4LCrlke+8H@embed-PC.myguest.virtualbox.org>

On Thu, Aug 15, 2024 at 02:49:36PM +0530, Abhishek Tamboli wrote:
> Hi Greg,
> Thank you for the feedback.
> 
> On Thu, Aug 15, 2024 at 10:00:27AM +0200, Greg KH wrote:
> > On Thu, Aug 15, 2024 at 12:44:16PM +0530, Abhishek Tamboli wrote:
> > > Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> > > and uvc_v4l2_enum_format().
> > > 
> > > Fix the following smatch errors:
> > > 
> > > drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> > > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > > 
> > > drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> > > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > > 
> > > Also, fix similar issue in uvc_v4l2_try_format() for potential
> > > dereferencing of ERR_PTR().
> > > 
> > > Fixes: 588b9e85609b ("usb: gadget: uvc: add v4l2 enumeration api calls")
> > > Fixes: e219a712bc06 ("usb: gadget: uvc: add v4l2 try_format api call")
> > > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Add check for dereferencing of ERR_PTR() in uvc_v4l2_try_format()
> > > 
> > >  drivers/usb/gadget/function/uvc_v4l2.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > > index a024aecb76dc..8bb88c864b60 100644
> > > --- a/drivers/usb/gadget/function/uvc_v4l2.c
> > > +++ b/drivers/usb/gadget/function/uvc_v4l2.c
> > > @@ -121,6 +121,9 @@ static struct uvcg_format *find_format_by_pix(struct uvc_device *uvc,
> > >  	list_for_each_entry(format, &uvc->header->formats, entry) {
> > >  		const struct uvc_format_desc *fmtdesc = to_uvc_format(format->fmt);
> > > 
> > > +		if (IS_ERR(fmtdesc))
> > > +			continue;
> > > +
> > >  		if (fmtdesc->fcc == pixelformat) {
> > >  			uformat = format->fmt;
> > >  			break;
> > > @@ -240,6 +243,7 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
> > >  	struct uvc_video *video = &uvc->video;
> > >  	struct uvcg_format *uformat;
> > >  	struct uvcg_frame *uframe;
> > > +	const struct uvc_format_desc *fmtdesc;
> > >  	u8 *fcc;
> > > 
> > >  	if (fmt->type != video->queue.queue.type)
> > > @@ -277,7 +281,10 @@ uvc_v4l2_try_format(struct file *file, void *fh, struct v4l2_format *fmt)
> > >  		fmt->fmt.pix.height = uframe->frame.w_height;
> > >  		fmt->fmt.pix.bytesperline = uvc_v4l2_get_bytesperline(uformat, uframe);
> > >  		fmt->fmt.pix.sizeimage = uvc_get_frame_size(uformat, uframe);
> > > -		fmt->fmt.pix.pixelformat = to_uvc_format(uformat)->fcc;
> > > +		fmtdesc = to_uvc_format(uformat);
> > > +		if (IS_ERR(fmtdesc))
> > > +			return -EINVAL;
> > 
> > Why not return the error given to you?
> Returning -EINVAL directly was based on the current implementation of to_uvc_format(), 
> which only returns ERR_PTR(-EINVAL) in case of error.
> > 
> > > +		fmt->fmt.pix.pixelformat = fmtdesc->fcc;
> > >  	}
> > >  	fmt->fmt.pix.field = V4L2_FIELD_NONE;
> > >  	fmt->fmt.pix.colorspace = V4L2_COLORSPACE_SRGB;
> > > @@ -389,6 +396,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> > >  		return -EINVAL;
> > > 
> > >  	fmtdesc = to_uvc_format(uformat);
> > > +	if (IS_ERR(fmtdesc))
> > > +		return -EINVAL;
> > 
> > Same here.
> If you'd like me to make the changes to use PTR_ERR()? 

Yes please.
