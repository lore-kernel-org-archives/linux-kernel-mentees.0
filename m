Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951DC2D8391
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 22:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779144983; cv=none; b=s2GkQNY6D3dfjGEmbnN5xutZN4t5ZTsi+b8u4upZ7A/a0RT7kH+5/XgXt2fjipfmUbI1GQM18C1FsN577chpw+x6g+yyuOXScm0DKfuOBTd21w6BtUrmdCoqyJOrdwID5gdF1mz6j94h7KWVMgqfEIAMN6Oeajup/2YsiQn16u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779144983; c=relaxed/simple;
	bh=IUdRJC56RBzqNCM1DPww5KqL+egKKwzZHSppoHwXz1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAfT4HZhmrd0W9m6Lvmk7iZYkexHyc3sXFFPiDHGcMd7UPzoqHOobC1Xopu9pdVyQVvtg6aScNO2PZF3MiOWB22rx0qFrROzQ6LgRR2k1czYPe+XT+MRElCxGDJUqC4NtACmLKmh0tc/qIzUk09GwEpqcxOaS5wjxKNiB2Vv81M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GbZumczv; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GbZumczv"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45AB5607FC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 22:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K5GExXMFsuyS for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon, 18 May 2026 22:56:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E9DA607EE
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E9DA607EE
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=GbZumczv
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 9E9DA607EE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 22:56:21 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c82a6278a4cso2205216a12.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 May 2026 15:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779144981; x=1779749781; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T7+IeU1q4KF73mOQ7FypKUKAYVqW8+sQGdeWvAZi1Ts=;
        b=GbZumczv1GxWVyA1cBvtymCjX9W/jTJzqMjIFGOpDrDPV6Rtna2uBwBccc/zg4uHli
         efNUoSpoF1v9nyMqsz6MI+0bjti2d6ku0ov4i5KYF2K2rtrFXJLSKJNvxJrOAsmlbkwa
         ftYF8MiGb3u5TBZdZ3L8H8QygwsFs6qqA9wCvD2yqEEFlTtYc7eXfnxaTwUjMyZTpPq+
         SOMLAz9z42JSrOw4yRate5h34RCT6WYOADqlt/Ic4RBxQn2PLITnS9glGqLwWpv7YL2Q
         pNuLrpl079obX3WNMCOj7Y75YmFL4lmrFmQr4NgT9FcDz7f+jjiPpqfAy0+Fhwjy3n7D
         Ybnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144981; x=1779749781;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7+IeU1q4KF73mOQ7FypKUKAYVqW8+sQGdeWvAZi1Ts=;
        b=XvMB+yU1hcuZojawQjx+DfdiMHzw284pRH+ouLcHMxsXIG5bfPlOX7KgCUukTZXxbG
         oBhM10kBfL18YFmr9kzDfn1LrFpIMrAMRH9BYEK6SfbSLdRjAm286iWxrnGHs8fjhv+6
         uOd+bFUvyeI6Z4d21RZUFU5fJuHFh+ot7pQtqfebMMu3n3ddg8ZpHBvk/YxZyynhOqtM
         e3FBiqUA8cFjo3WqqrMOYExgxluWe6MiF1fMbmYlK5Nx2rb5x6FzyhzG5sFd1ial3Kl3
         utcJ4L/iP9/nKVbnRF9yxpN6s8JkswP32eTKslUMsCR6QeiwPfM4VYB5ttw3XXnXk8LC
         j7Wg==
X-Forwarded-Encrypted: i=1; AFNElJ9R+YNSmgda8SoSjgQUwOnVGKQx6ZFRQBI2G1UttCWvdB21rOK4XU8fUClcOdpFSVBmkfn+m9ZefqWnYCnHpys/SwGJWg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyLrvsWZ5Sl6Z9mF001hRtGBoGJKyCmVJu0/mwHYxRYJLzyhyk7
	aesqE/smZ2aOUbeV0T5UNY+HKxqop5t+yxfKZtdCnAOVhoIX0irp5kZ1
X-Gm-Gg: Acq92OEnr3Rk255ipvRDxw7Bz9cn/BSVG/c2axXsI8gwTalBjjpOfXvpl+eFW9THB5o
	etVgZxnkAqRkBTr6UFhp7QfxQ0cdZp87I3CcaSB1qhQjCb76XhwgH6/9na7WOToOqGHJKLqGKPN
	XUdFYU7X/rWRAg1za11NZw7KZJERkObCIs2L5pq+I+OwqO9OX6cMyHPOUDH1j05DhNbb3RI/oi/
	2g6nnEpbZ17da/XZycbfbgYRAFrFMQS5q4pF2cX85oFSe9lz719QQBwtkFnrPEkQd6QQmMNZEf2
	xcLxBcuCvdzKOvTcYx1p24p6b90n+y0Tv4WYuG8QlYCZuuFrZh7q4dyFGe7opk28rX/Je8080SL
	U7W+9NMmc5e5OOcPrQZ+oLTYrUI7LTIMr7IYwmBBzOzKFRLwIYAaacMePe8DDMLzePQlsw1LGQ7
	t0fQAHOWlRnG/VG9M+Ca7t/QOrs58=
X-Received: by 2002:a17:903:2c47:b0:2bc:e62a:979b with SMTP id d9443c01a7336-2bd7e933cafmr193650485ad.30.1779144980702;
        Mon, 18 May 2026 15:56:20 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2dcsm161487735ad.13.2026.05.18.15.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:56:20 -0700 (PDT)
Date: Tue, 19 May 2026 05:56:15 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: jens.wiklander@linaro.org, sumit.garg@kernel.org,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
Message-ID: <aguZD_vcJCwXY--l@soyboi>
References: <20260513091031.145826-1-robertusdchris@gmail.com>
 <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
 <agat1sBHqkGWKzOD@soyboi>
 <e626963b-7f20-43fd-b3e0-e16d9b6f13f8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e626963b-7f20-43fd-b3e0-e16d9b6f13f8@oss.qualcomm.com>

Hello Amir,

On Mon, May 18, 2026 at 04:36:20PM +1000, Amirreza Zarrabi wrote:
> Hi,
>
> On 5/15/2026 3:23 PM, Robertus Diawan Chris wrote:
> > Hello Amir,
> >
> > On Fri, May 15, 2026 at 11:31:50AM +1000, Amirreza Zarrabi wrote:
> >> On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
> >>> qcomtee_object_user_init() is a variadic function and when the function
> >>> return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> >>> case, there's no va_end to cleanup "ap" object initialized by va_start
> >>> and that can cause undefined behavior. So make sure to use va_end before
> >>> returning the error code when there's no dispatch callback.
> >>>
> >>> This is reported by Coverity Scan as "Missing varargs init or cleanup".
> >>>
> >>> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> >>> Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> >>> ---
> >>> I don't have the device, so I am not sure how to test this change.
> >>> Thank you.
> >>>
> >>>  drivers/tee/qcomtee/core.c | 8 ++++++--
> >>>  1 file changed, 6 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> >>> index b1cb50e434f0..901a31e8201f 100644
> >>> --- a/drivers/tee/qcomtee/core.c
> >>> +++ b/drivers/tee/qcomtee/core.c
> >>> @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >>>  		break;
> >>>  	case QCOMTEE_OBJECT_TYPE_CB:
> >>>  		object->ops = ops;
> >>> -		if (!object->ops->dispatch)
> >>> -			return -EINVAL;
> >>> +		if (!object->ops->dispatch) {
> >>> +			ret = -EINVAL;
> >>> +			goto out;
> >>> +		}
> >>>
> >>>  		/* If failed, "no-name". */
> >>>  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> >>> @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >>>  	default:
> >>>  		ret = -EINVAL;
> >>>  	}
> >>> +
> >>> +out:
> >>>  	va_end(ap);
> >>>
> >>>  	return ret;
> >>>
> >>> base-commit: 5d6919055dec134de3c40167a490f33c74c12581
> >>
> >> Hi,
> >>
> >> Forgot to mention: how about using a break instead of a goto.
> >
> > Oh right. In this case, using "break" statement is enough. I will send
> > the v2 of the patch. Maybe something like this:
> >
> > 	if (!object->ops->dispatch) {
> > 		ret = -EINVAL;
> > 		break;
> > 	}
> >
> > and then remove the "out" label.
> >
> >> Then feel free to add Reviewed-by.
> >
> > I want to confirm first, if I changed the patch using "break" statement,
> > do I need to add "Reviewed-by" tag in the v2 of the patch or not? I am
> > still not sure when to add "Reviewed-by" tag, like can we add
> > "Reviewed-by" tag when we changed the patch?
> >
>
> This is a small change. You can add the tag when sending your v2
> as long as you include the change.

I see. Alright, I will send the patch v2 with the change and the
"Reviewed-by" tag later. Thanks.

Best regards,
Robertus Diawan Chris
