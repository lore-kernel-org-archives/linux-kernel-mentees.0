Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD63161FCF
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 16:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723565859; cv=none; b=oINodbprRYzrI/ZggXpJPA2Uhet/H+N76oszK35w0VFTUJjohDk3ejisvhMSBgVJUpJOPZKcpnYElY8F+dtpxBYJphlTvM5Oc7C4CFCjZahNC5PuZNWkgMnMMsRU6aO9f1KZgr4QqtdYIqaTzOmKxV46bS7Wcba0Yq3XI35sIsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723565859; c=relaxed/simple;
	bh=LsSMG6vRHJ7kQTpLpA/9FQUL3qXJ2zt8pyl227W6k7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H80J7qi9vzHnhsAtdSY6kC5MnTl33Eg/yb7cishYaNvAeZ8UIL9gXTREedXATkjrMqUnUGyvbxWbfX9KgfaLnxX7fqRsbuE/OPCxvBNuPEUCfjg9Jsdx0HKEvQDkqhyj5JL/Tsvg4dkDGVSU+flqa5zmVc4l03T/wDz7ux/lSsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fQNQjkvO; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fQNQjkvO"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7018C404C6
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 16:17:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oov1OKfkIhfS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 13 Aug 2024 16:17:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 70F11403DB
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70F11403DB
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fQNQjkvO
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by smtp4.osuosl.org (Postfix) with ESMTPS id 70F11403DB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 16:17:35 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-710d1de6ee5so4516605b3a.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 13 Aug 2024 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723565855; x=1724170655; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kj45Nw4+kE50bs1SyxLZHW9uaBTA/6n4EMAtKboeG4s=;
        b=fQNQjkvOftF1Ytvs1TZs8m36Md1HNaAQ6UDJXJSYZO9Hzd9Qy68BvKhGqqcMvuoOoG
         9ZUddPxbQHcntzfw5BDRLNGTYUWU7k4JrDLHGKmbPsD2esGoj31ZSZPL1gABMhZb8CGd
         mMsLZ+ZO2NfsPE2XEzHYT3C6nUkyDeu5c0SnSVyQ0w8qK4KDJjLwi/VlqD0fZNfSQHc4
         EeQCq7wY6eMWjp4eKLKLMAPM/WWIBlm9qE2N5W1/gw1qdNeakBVR2iarM2In4/8HdrE+
         vyp5RA116FRUZsQY69HTw0841BYP15hGx+RfWWUXEvPGGP3CBqnJcxAQKBpWuFK7+pOt
         Lk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723565855; x=1724170655;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kj45Nw4+kE50bs1SyxLZHW9uaBTA/6n4EMAtKboeG4s=;
        b=vFZdPVrIkyo6bwgYjTIczMmUp2OcsAGQHNb7UgCY0nNl79II10TxD7UiIccLF8Gd/h
         y2EyEPo8wpwueIsrXDblrdqm96wmL+LXgm9fzimUkcx37DzgouqRmHOQH/z9JzoNHe00
         +93MabO2Twbtq2uODM7O98MgXiiw2vEUjlM7IMpqcKpGE68wpV6RByDol/8Vw5DACWvY
         h6YjyhxX+82y+gjwWwDo5JT1LWCyAniGEF9n61v1RPQUbT5KuXPfeBXb6LSADfRt6hUZ
         krwfn/+oR9jdKoSAXZKgV1tAT97L6HRl/wO0DORfZ8zpMSJbTluH2w+Jl/hylLrlIwRi
         bQeg==
X-Forwarded-Encrypted: i=1; AJvYcCWLUytQwTdL2SAhcEeJgte0RoBbVYVIfpA6dYsi+6tbNA7wxNm67bZBDhN66h5yBUF0NNbNBmMmNYISey4iamXUl3LG0coFk+2hR041s5h/jKKce+8Y9rp8BVqfAWvS
X-Gm-Message-State: AOJu0Yxh5r59oRKW5k7zA+8roainfpIXvV15BvRwn/TS/85vfW6B8TCP
	by1yIkWkZaA6QHwbuQTa0A64S5tyxKYfrE9HOkxFvrKV0si4/3OW
X-Google-Smtp-Source: AGHT+IEZ+myyPTgXTATkJ3lHygNW+WYSv2xP/Oost0Ndgo/r1rgYIYpFhHgNxK0mz+1xlo77nDnAeQ==
X-Received: by 2002:a05:6a20:c68e:b0:1c3:a760:9757 with SMTP id adf61e73a8af0-1c8eaf8c296mr274837637.49.1723565850455;
        Tue, 13 Aug 2024 09:17:30 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([122.177.118.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c697a003efsm1683331a12.40.2024.08.13.09.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:17:29 -0700 (PDT)
Date: Tue, 13 Aug 2024 21:45:56 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: laurent.pinchart@ideasonboard.com, dan.scally@ideasonboard.com,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: uvc: Fix ERR_PTR dereference in uvc_v4l2.c
Message-ID: <ZruGvIf5+UVEcajd@embed-PC.myguest.virtualbox.org>
References: <20240802180247.519273-1-abhishektamboli9@gmail.com>
 <2024081321-kiwi-gibberish-d065@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024081321-kiwi-gibberish-d065@gregkh>

Hi Greg,
Thank you for the feedback.

On Tue, Aug 13, 2024 at 10:11:48AM +0200, Greg KH wrote:
> On Fri, Aug 02, 2024 at 11:32:47PM +0530, Abhishek Tamboli wrote:
> > Fix potential dereferencing of ERR_PTR() in find_format_by_pix()
> > and uvc_v4l2_enum_format().
> > 
> > Fix the following smatch errors:
> > 
> > drivers/usb/gadget/function/uvc_v4l2.c:124 find_format_by_pix()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > drivers/usb/gadget/function/uvc_v4l2.c:392 uvc_v4l2_enum_format()
> > error: 'fmtdesc' dereferencing possible ERR_PTR()
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  drivers/usb/gadget/function/uvc_v4l2.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/drivers/usb/gadget/function/uvc_v4l2.c b/drivers/usb/gadget/function/uvc_v4l2.c
> > index a024aecb76dc..9dd602a742c4 100644
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
> > @@ -389,6 +392,9 @@ uvc_v4l2_enum_format(struct file *file, void *fh, struct v4l2_fmtdesc *f)
> >  		return -EINVAL;
> > 
> >  	fmtdesc = to_uvc_format(uformat);
> > +	if (IS_ERR(fmtdesc))
> > +		return -EINVAL;
> > +
> >  	f->pixelformat = fmtdesc->fcc;
> 
>You are now only checking 2 of the responses here, not all of them,
I addressed only the errors reported by Smatch.
> which feels odd.
> 
> Either fix all calls to this function, or none of them :)
As you suggested, I'll review the remaining calls to this function 
and submit an updated patch that covers all cases.

Regards,
Abhishek

