Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4855A47A6A
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 17:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724519400; cv=none; b=DtxPqRoYs+2XoYESPSxZNUVSOxhYGBO2xHM8vC7UNE07BloYibAFdXIYEGaEcmkxU/Rru3dT624PsM9ulXR73nYSUJ+PkhFV/zc3mJPPcRqI0BbfH3UQE9w2bd7vPCh8TnN8+0B2DyzBrNIoUaXYTqpYdJyqfmFuXFAWalJLAXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724519400; c=relaxed/simple;
	bh=La036WycZQy3mqYzLfhylb4KkfjLHAUpK50Cg8o1hp0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kceMbyGr+Vtf3dNNp/RRdV36RQ08K1r3fmc0aiMbBeLACV67Hc72akxUNSLLoEAz1Q+J0xT/QdU7nvS87osR0PeKE3EbT5BzTEGpQKCK7q5IrJyOFVqmBSIh498aRap7qwX9ub/VKkpHrgHUHn36OHy0sgEb62IMGsNPuSQ6Sek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is2zA+Tr; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is2zA+Tr"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C68EB40245
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 17:09:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id suayVR8hY-wn for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat, 24 Aug 2024 17:09:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB47C400DA
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB47C400DA
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=is2zA+Tr
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	by smtp2.osuosl.org (Postfix) with ESMTPS id BB47C400DA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 17:09:56 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-714114be925so2557825b3a.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 24 Aug 2024 10:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724519395; x=1725124195; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZPJk8EyuuRtmKqUwvIeHzU/+eqZnjDPiW4lHYi002sw=;
        b=is2zA+TrtkKhyFH2CFKF3M38kEAO1+VTh37SZ9gymdczZXsAA1UpPjafva0slAM4X4
         XW5RWSj6IrAUsWTTLiq473+KuwyBDKfreKIo6SFfVPFwtJo5WJTACR+wx5adfWUJ5IGK
         eYwUsDNUgpxJATtKQ4HwvMuUVtdZOSxhgL0sCQvvdKbW0weSkw2RpXhvzMFXZKTTaOFt
         JHmUGeXv3MlqrD63aL66GcNk5pMn6RKTrgpiX5Ayb+92XMzc5d2CiFjScf31AUEo3sDM
         5gGji0ub3UBOfL7+ZcbJ2leHBadvucLsRzNYSSJGdg0UV7C7irKi1BWM1BvNALhuLMYJ
         OTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724519395; x=1725124195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPJk8EyuuRtmKqUwvIeHzU/+eqZnjDPiW4lHYi002sw=;
        b=Ekdik05KQeTRyfu88resEFGGUaszzhxGuCVlQoatZNgyDzIv82atqmHb0yGP7LMssb
         S6yniwAhFhdc9W6omrU0n2swYRPGZYvMPgnQar57PvKhvCApxD3iNzGxqs07aYe3L/Am
         23NL9m+6nznlc4W4rDAvv30Vo6vPIbBZC+m999by42dzp3GNvG06ErnRxbh2O5cOaO+h
         3TEyBC6zKQXs+NuKjidkJpUFNrb/bt/UAooT+8qvNK7Ki1HQwKnF53lRSnrHm+UsDFc5
         SUm9KABpkx2Mwg5Boay3AP01k1v02e9bCePsxEMCshaP9GjyoOqsKCQDd8q5ty93ABdH
         XmCA==
X-Forwarded-Encrypted: i=1; AJvYcCWh1/yYtR6r+lh3WQ2zukWXoi7rNin/HgXXgJvsi+pWTrakIjgpMqVSLaiyai+j0igN6nQ7rd3R8tjdbVVKf7L/zK+RHg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0Ywhc5XX3JOh/58C89OhJewHxxd3itmNRfhzyLdO2KmsWAnZdNmL
	c17UUtNTfRZmyUVl9nVM+86x38zJ6x9uxsdOLVasY6xlnZ6ug35a
X-Google-Smtp-Source: AGHT+IGsTpC0pTthXoZnHjqhn53xX6WlH/J3bzT8ObofnPMW8MYz5akRV1EXCigvl6F1amd2VZsX9g==
X-Received: by 2002:a05:6a00:3d10:b0:714:2069:d90e with SMTP id d2e1a72fcca58-7144588dea4mr7293669b3a.26.1724519395389;
        Sat, 24 Aug 2024 10:09:55 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.233.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143422ecedsm4714403b3a.25.2024.08.24.10.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 10:09:54 -0700 (PDT)
Date: Sat, 24 Aug 2024 22:39:49 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com, christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in
 rtl819x_translate_scan
Message-ID: <ZsoT3eQq6muDPh5Z@embed-PC.myguest.virtualbox.org>
References: <20240823153411.74142-1-abhishektamboli9@gmail.com>
 <1c640c3d-c5db-4eb7-8a22-6d9886a1412a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1c640c3d-c5db-4eb7-8a22-6d9886a1412a@stanley.mountain>

On Sat, Aug 24, 2024 at 02:21:47PM +0300, Dan Carpenter wrote:
> On Fri, Aug 23, 2024 at 09:04:11PM +0530, Abhishek Tamboli wrote:
> > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> > index fbd4ec824084..ec0c4c5bade7 100644
> > --- a/drivers/staging/rtl8192e/rtllib_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> > @@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
> >  };
> > 
> >  #define MAX_CUSTOM_LEN 64
> > +#define MAX_PROTO_NAME_LEN 10
> >  static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  					   char *start, char *stop,
> >  					   struct rtllib_network *network,
> >  					   struct iw_request_info *info)
> >  {
> >  	char custom[MAX_CUSTOM_LEN];
> > -	char proto_name[6];
> > -	char *pname = proto_name;
> > +	char proto_name[MAX_PROTO_NAME_LEN];
> 
> In the end I think we don't want to make this buffer larger.  But if we did
> this define is really vague and slightly confusing.  I assumed it was something
> else when I read it.  It hurts readability.  It would probably be better to just
> leave it as 6 instead and add a comment.  /* Large enough to hold "N-24G" */
Okay, I'll revert the buffer size to 6.
> 
> >  	char *p;
> >  	struct iw_event iwe;
> >  	int i, j;
> > @@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  	}
> >  	/* Add the protocol name */
> >  	iwe.cmd = SIOCGIWNAME;
> > +	/* Initialise proto_name as an empty string*/
> 
> This comment doesn't add any information.  Every kernel developer knows what
> memset() does.
Sure, I'll remove it.
> > +	memset(proto_name, '\0', sizeof(proto_name));
> 
> Normally we would just say 0 instead of '\0'.  The other way to do this would
> be to initialize it at the start:
> 
> 	char proto_name[6] = "";
> 
Thanks, for the feedback. I'll do the changes.

Regards,
Abhishek
