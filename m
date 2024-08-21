Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9A31B2ED1
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 17:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724262510; cv=none; b=DYc0414YMif8iRitRvwjrE2sGCy75eKFrLqlCkilv5aqeeALr5amd+WUn13vcn6CNPlkZFEn1IBVo5QOPSkH7EbS4AOW8GqFo3+KuevNcOKpdp52F6VFD/5IDxDDo2LQ1Q8fq6tsdVKEyTjjKc5OsHqjYEeTDbWM4vyQbtTBY1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724262510; c=relaxed/simple;
	bh=vwmaLh4zcZU9ysYQatGWVZMCBVdhOOp8fnW9VPNyhBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J4cWY6hV/wDYkX9dheimkz4wtgWWpChNXLb2yT35lbcHW4eNhVm09irXVMF1AWxc25AEBxkwsiTHns04BaoDtqPHG6jW9NMi5kuH3SYV/LSXVDBMw3PwMxDDqG7sM8Hx4jaFIKd9LqaKoqxNlyLwvTXTiw3E8XvQ4hBuYqr0iAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SEV0hjp4; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SEV0hjp4"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88EE540096
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 17:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SuZql9Eg8l41 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 21 Aug 2024 17:48:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=abhishektamboli9@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8309040352
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8309040352
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SEV0hjp4
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 8309040352
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 17:48:27 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-71433096e89so19902b3a.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 21 Aug 2024 10:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724262506; x=1724867306; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P2QitwiEuNNARUtd2MSbapEJMilFbV4RH639T4iAGcQ=;
        b=SEV0hjp4XAhyKz1uTf+LrX+0m42f58Ip3vfPgkvPwCfJAhXpW4jr7vFRjlsggree0W
         hqGrFr+78O0tjGG96LFZBLv1RLqXHnhSgWhOpMb+nSMKAy2o7m364UTwPaEUxfIBTWu5
         LNpzT4kffY9CqNYuJhVs58uV4CPm/dpyr/8RlesOPHvds/7DCyqTHk3D2CFaqo/+Qwh6
         uQ9+yCxnAb5dFp3F/iIWwA1EuDjieuae5ntoGIpzrdZbFUmyGeWOoanDft5D/xev2fV4
         QBW9Ff4QLfMCJ+5LcKs72SPwgWpFc8XaU+wVErbnVWUOYBupWGjaA/r+Ct6//0K2c0bq
         rrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724262506; x=1724867306;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P2QitwiEuNNARUtd2MSbapEJMilFbV4RH639T4iAGcQ=;
        b=sbMN7fpKrjkuh788BcyqXrn7bCFZGpgV8E3fprNLM2jpbXduH8ccuJCLMuRXHurwFB
         X5WDIKxvGw3gY4J+gwIIA9/xoAc2PFsSkuT+K0HDTpEUlP0XzHhLlTOenpsfHTHdbxJC
         xpg/nOixgEvN9JIQUi7i4rsGtv6Ef8qCQ9dQihamTzdhKE/N+6GDMPy+qL10Jvg6UjB5
         hrBHqRitQNj4MW1h1Q+KJUpL6xJOfm0h0lc7lvQIX881NjtIXqSQ4jR6nCWXdhMqqmvA
         ygo0ThEFQVcX4u0XKyieppR+SbZT2eS+VIc01Blt56J4Y/7JeI3MG2jeqwvvRDpQgx3T
         2Vfw==
X-Forwarded-Encrypted: i=1; AJvYcCU3nw9JyBsGPFjydSk30x47EOsxCkGAoTHoHw/68NpZyBmtZJhve90qOtlJfr6Rwcrw3rYboZ/ithcJ/axBo2a7et0Xkg==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YzvCGfyIA2LAeDq88NJk82DrSXObBlO+Bl/xsusy9ghvYJH9mXp
	bIqJMOIndA7iYQXJf2rHkyFYPoQ7EFBiwd434FYNRfAozrBFXijY
X-Google-Smtp-Source: AGHT+IHA3fTEXfdi31zERq05Tq9B7V+Rlr4+hXgnN3j/g16WdRD+7L3ipGO6qiUlAiZ/IvKdrYyzxg==
X-Received: by 2002:a05:6a21:178a:b0:1be:c262:9c0d with SMTP id adf61e73a8af0-1cad81a4224mr3879325637.44.1724262506432;
        Wed, 21 Aug 2024 10:48:26 -0700 (PDT)
Received: from embed-PC.myguest.virtualbox.org ([106.222.234.36])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71422afda7csm1734551b3a.27.2024.08.21.10.48.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 10:48:26 -0700 (PDT)
Date: Wed, 21 Aug 2024 23:18:17 +0530
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <ZsYoYe+8k0YEyS2U@embed-PC.myguest.virtualbox.org>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2efc687-07bd-462a-b0a5-58e09bde32a7@stanley.mountain>

On Tue, Aug 20, 2024 at 10:29:47PM +0300, Dan Carpenter wrote:
> On Wed, Aug 21, 2024 at 12:12:16AM +0530, Abhishek Tamboli wrote:
> > Replace strcpy() with strscpy() in rtl819x_translate_scan() 
> > function to ensure buffer safety.
> > 
> > Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
> > ---
> >  drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> > index fbd4ec824084..970b7fcb3f7e 100644
> > --- a/drivers/staging/rtl8192e/rtllib_wx.c
> > +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> > @@ -61,7 +61,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
> >  	iwe.cmd = SIOCGIWNAME;
> >  	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
> >  		if (network->mode & BIT(i)) {
> > -			strcpy(pname, rtllib_modes[i]);
> > +			strscpy(pname, rtllib_modes[i], sizeof(pname));
>                                                                ^^^^^
> pname is a pointer, not an array, so this doesn't work.
Thanks for pointing out the issue with strscpy.
> >  			pname += strlen(rtllib_modes[i]);
>                         ^^^^^^^^
> pname is incremented here.
> 
> What this loop is doing is that it's going through all the network modes and
> adding to the string.  You should look at the rtllib_modes[] array and ensure
> that if we printed every string it would fit into pname.  (Currently that is not
> the case.  Probably not all network modes are possible.  But I have looked at
> this code and I'm saying that we should just ensure that we could handle it if
> they were all possible).
I understand that the size of proto_name is insufficient if all network modes 
from rtllib_modes[] are copied, so I need to increase its size.

Given this, would it be better to use strcat?
This would eliminate the need for the pname pointer and align with 
the current code's method of concatenating the rtllib_modes.

Regards,
Abhishek
