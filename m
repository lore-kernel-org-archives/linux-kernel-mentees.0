Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A14613AD09
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723536716; cv=none; b=GKg5CFaPhn/JPxOZ3Y/pYsbWi0aWh1mMVY7l8FmEL+zcKcK00fEp6ME95o53O5m0IIY0z7QdQppPVh1FxAfxyti7/QQRJCNY/Hca3f8hFmikoVe7PBvbp3R2GvT5oNx55c9r5WaazIcwQgu2zB9dX6CBpQP9Usf7MDiOUdPgdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723536716; c=relaxed/simple;
	bh=OjJdzkn31p13CLDE9/RYDv7S79m7A/l963A3TrU4zQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h9M3sfNSKZyEQYwXDCJF2az2+Bwbi3aXEToreT4b3hcuw4MQI+q7PBV5it7OBfHxwpblZSFhDH2D0e3QBzF/J1BBbhmTePsj8Ix5o+hSapD+mzQW8jsCUNejOg6PK6q7uxvVqAIh4tanfEY6nvl6IgP7FGS+I/phZYasLGLwiH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Dz+TdzqN; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Dz+TdzqN"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91CB760769
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 08:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -10.792
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fdom4yeKuX6M for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Aug 2024 08:11:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D4FE3606CC
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4FE3606CC
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Dz+TdzqN
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by smtp3.osuosl.org (Postfix) with ESMTPS id D4FE3606CC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 08:11:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19A3661575;
	Tue, 13 Aug 2024 08:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69700C4AF09;
	Tue, 13 Aug 2024 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1723536711;
	bh=OjJdzkn31p13CLDE9/RYDv7S79m7A/l963A3TrU4zQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dz+TdzqNPfLKm22RYAZNSe90opF1FUV4DiUPnZ3xbrkaJCWRdMnJfadOFvvan+a2/
	 20nGDftoxI9XAHLVb6DQ2+b9s1mvJoungAWGZWzlHrx3rAo5pdgohnCHrp1TSH1PwD
	 uJINdlU+P0+pojeZn4iZbVHC8U34UvKpdXNbypMQ=
Date: Tue, 13 Aug 2024 10:11:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Message-ID: <2024081321-kiwi-gibberish-d065@gregkh>
References: <20240802180247.519273-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802180247.519273-1-abhishektamboli9@gmail.com>

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

You are now only checking 2 of the responses here, not all of them,
which feels odd.

Either fix all calls to this function, or none of them :)

thanks,

greg k-h
