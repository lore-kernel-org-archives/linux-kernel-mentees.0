Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03D731716D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 05:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778822622; cv=none; b=mcMj/6iaXID4kcWaQVLOGN+UwZS1krB3Sc4xRS7J/0O+MyC9nhqBLucr+/UlP+e5NRn3NQ4hXIP5RRhcPJRVMGyT0kmGifrYAene1E33Z7/IQ+wjkDIk73aT/bcjwlcx9TLWcVla94guLElDRodM2nkSqYEUBTV5kQYqgUTEBDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778822622; c=relaxed/simple;
	bh=ixr6UTkPaqIoywLFWnbYraaAvOuKOaos+d5WnYABLqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkPWqnBJWh21L2nvpq3GlcqFM0iHqN01zTK2kYy727QlxPgcMCYsKev8MJKfTfOXr7oSy6dmtNOPE7Fw9JbKZpxvW9n8HIkix+syAwBS+DZ5wA7FurPVYON5k8fvx8RkO3XeY8g3IPOazye3xynRvnwhmrZTqjlT2HQmAAgQrVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6FgWGZb; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6FgWGZb"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898588336D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 05:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6ymtM2F8cCl for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 15 May 2026 05:23:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=robertusdchris@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D070B8333F
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D070B8333F
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D6FgWGZb
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D070B8333F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 15 May 2026 05:23:40 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c80170db7d6so3551444a12.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 14 May 2026 22:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778822620; x=1779427420; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GpC4Sy2ohSEgf27E/5DP9PBOmyJ/jHfS/ZObuxuM5HM=;
        b=D6FgWGZbT4uahg5G1xINLnBMBmCYIYl7cls9uqNmpDnicbtbZm9AKHonZK3OPMxa+e
         yd+w4GHGedRWmSVXRNxv8U9CT/BxT0Zq2Hb9q8AcP5CdSUiO2aDqZEpcBGyEOjYs2oX6
         gMej8vykJ55Udg4rYySYgIO9NpXzv2tTw6GHXs2XDXGcYqpHEZb1ojbOmTQZps1YFuFn
         31Nd8ysFULgvDrkNWEtHaphw50KOgnBLAu/Mctp8dfds2l4up5sy3Lb8S4MdTI3UJjtR
         tBF3IxjzVcxU4EYRT5N6bmCeNePA1zlezVV3nHy+NqoiPINPAiD3N/t5V3v8ZjcmJk6c
         c+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778822620; x=1779427420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GpC4Sy2ohSEgf27E/5DP9PBOmyJ/jHfS/ZObuxuM5HM=;
        b=Z2IbI9ea0V6Cp4UsSiAbZr9eziK5AW9ZuhB2wytvrB+uLsmn4Iqdag1SEgS0elUrO8
         14t0ywhHypvAy4YRtXKxLfgBZpzJDDJ1lsaPPcgNuesIIqSRHyesTrVX2PQRoeGPiWLC
         MywBVftK164CxZw7ktAOwBA3cWrv1avIzmrT6w3T/Y8AN6GyzngWxyB0BuZa9cga5YpK
         ZUUNAHWCkRwglQ1W8nsqbKOUGg0yXz8J3XH6pL6merZcPxECyfdkDcRixrt+gCPAdOxW
         V9Mkp0NU0DlisJhZF3dfe9ziu9GTIeE0trSfr4MXVsHa4E8wBNkQ+wZJ6+k2kM9oNE9r
         cuug==
X-Forwarded-Encrypted: i=1; AFNElJ9v9/0tA2tN4k4o41+wi8uXY/9WG41zmAtbKGcOPB+IJrCQ55keBnmIpi57sSim++vMVvugODZcOJRyunB0Z+5kkxLNpw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwOsTtdJXnOhXdOvuuUT3Zy0VoKm9Pst97y+mqX7kpMQO01W2UM
	gSN4uZJg6/QjjydBsD7xED2VUXnUK0PyITsX8gwpQjNQb8YJa9/Q5df1
X-Gm-Gg: Acq92OFwpp82IMzMSBFkcihgWWEJR+Ib6nPhGopx5KvLu6bHQMCK/aoYHxICzI6TmbX
	9lNho+uy8m/jialiDfNFvXxIQ/rz28xIfJpl6oeuiszmIUKgwJeJc2B1cPlssQCAydsGW5nHfmR
	Kf0vzF+LNx7xTkIj0FhWtjxFVniIAyKHzOjyRxrtD1EQs8GYpOTQD+7xv+qJh/MWEGFEuJO53XD
	IUad1t1aG3oIZX9Jtdm7/KVwSZLfoapZb8eyuG/K33Cr2i/sRnxuhrlPEF0W2pyPejwPDhK5GIb
	jHjIw0Ws96S9EzbKrMui+8ilduiflhlkPyjaJbEMTkaNOnVz6wKUY4c8XtONths2fe1q63/CVsy
	xplvwMNMF1cbjmP1xlro/W1U8DN4yyztYpmIQb2zNgNZj43e1VJaj+jGMan7x48VNidp+sKplpn
	g9mtNlRYY8w+4xPFpTvXyJ+W7Kcsk=
X-Received: by 2002:a05:6a00:2a08:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-83f33a18fcdmr2722540b3a.0.1778822619721;
        Thu, 14 May 2026 22:23:39 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:dc10:22f6:2ac0:a51b:5d77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f1942a83fsm4766005b3a.0.2026.05.14.22.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 22:23:39 -0700 (PDT)
Date: Fri, 15 May 2026 12:23:34 +0700
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: jens.wiklander@linaro.org, sumit.garg@kernel.org,
	linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, me@brighamcampbell.com
Subject: Re: [PATCH] tee: qcomtee: add missing va_end in early return
 qcomtee_object_user_init()
Message-ID: <agat1sBHqkGWKzOD@soyboi>
References: <20260513091031.145826-1-robertusdchris@gmail.com>
 <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8182784b-b6c2-4136-af8d-3aea4f5a4662@oss.qualcomm.com>

Hello Amir,

On Fri, May 15, 2026 at 11:31:50AM +1000, Amirreza Zarrabi wrote:
> On 5/13/2026 7:10 PM, Robertus Diawan Chris wrote:
> > qcomtee_object_user_init() is a variadic function and when the function
> > return because there's no dispatch callback in QCOMTEE_OBJECT_TYPE_CB
> > case, there's no va_end to cleanup "ap" object initialized by va_start
> > and that can cause undefined behavior. So make sure to use va_end before
> > returning the error code when there's no dispatch callback.
> >
> > This is reported by Coverity Scan as "Missing varargs init or cleanup".
> >
> > Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> > Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
> > ---
> > I don't have the device, so I am not sure how to test this change.
> > Thank you.
> >
> >  drivers/tee/qcomtee/core.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/tee/qcomtee/core.c b/drivers/tee/qcomtee/core.c
> > index b1cb50e434f0..901a31e8201f 100644
> > --- a/drivers/tee/qcomtee/core.c
> > +++ b/drivers/tee/qcomtee/core.c
> > @@ -306,8 +306,10 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >  		break;
> >  	case QCOMTEE_OBJECT_TYPE_CB:
> >  		object->ops = ops;
> > -		if (!object->ops->dispatch)
> > -			return -EINVAL;
> > +		if (!object->ops->dispatch) {
> > +			ret = -EINVAL;
> > +			goto out;
> > +		}
> >
> >  		/* If failed, "no-name". */
> >  		object->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> > @@ -320,6 +322,8 @@ int qcomtee_object_user_init(struct qcomtee_object *object,
> >  	default:
> >  		ret = -EINVAL;
> >  	}
> > +
> > +out:
> >  	va_end(ap);
> >
> >  	return ret;
> >
> > base-commit: 5d6919055dec134de3c40167a490f33c74c12581
>
> Hi,
>
> Forgot to mention: how about using a break instead of a goto.

Oh right. In this case, using "break" statement is enough. I will send
the v2 of the patch. Maybe something like this:

	if (!object->ops->dispatch) {
		ret = -EINVAL;
		break;
	}

and then remove the "out" label.

> Then feel free to add Reviewed-by.

I want to confirm first, if I changed the patch using "break" statement,
do I need to add "Reviewed-by" tag in the v2 of the patch or not? I am
still not sure when to add "Reviewed-by" tag, like can we add
"Reviewed-by" tag when we changed the patch?

Thank you.

Best regards,
Robertus Diawan Chris
