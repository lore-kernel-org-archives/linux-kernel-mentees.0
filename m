Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441491CF5C0
	for <linux-kernel-mentees@lists.linux.dev>; Sat,  5 Apr 2025 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743843486; cv=none; b=c1CY5p5hg+gJBeXRWWmTlUMhjCegNqjljTtFuryZsnVcijk/Dr8xNpbtpRwrW2rAAnYWriV6Wvo9X3r+3bxnT8quCn+5UhexBypzCEADLRp6hfoVEUwJoJfcCfL6Wj2xMAqBouV9Fj3L2dMC8eSls+tWkrDZh88nGRg/xGtyGVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743843486; c=relaxed/simple;
	bh=4B11vuoLMqSqCKCDLheQ3yvoV6EToF4tR4XWH1h7miA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VFhjVhrJz4iAZF3ubnzAqi0p99q+m94VxRy/Kj6EPQTBePoAKyHcgcCweN/KHQ13ZqCw76abmdJk8QRCLFNAPB8Yf4+8+h6OxbogXPh8zd7MyW08PgnmZfQfJXTrRzItAY5PDgfk2DGNu9Kt4frB16Ysow5ru8LmKobT2q/nrL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CxFGrpAx; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CxFGrpAx"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-225df540edcso42080735ad.0
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 05 Apr 2025 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743843484; x=1744448284; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wpj+U6LiNLvKI0gORxBfuo1ew0BWKjiW55LLe8Lju64=;
        b=CxFGrpAxEAoXCwjOjqnWD148wlgFuBju1xkTCO8z2B6Rw883oHCXKVJjSmfrbodULm
         Szxyt/hlFMKjwF0xP8v0Sg/uTsAnNKPX1eLuCQRSz8shMo0mD3CuHHYKzCa/5Aslqls8
         f6tdZK24wYwwxcZYM8PhkdqgBkEBWsim46/UJAJlk2DKwoJmvY3Fx/3f2OJRDPKpyc83
         GSAoZqKiGNL4OFsNXjApTDniSs++ofsZdCbJLQMWcV37MHT+Iql0kTgYXV/QbxVipjXD
         8DxqyJtCQIHRZjVMwUYEHpwKsizkTvKhfyiSrHQk2Hb23qPBFJVHej0JILwKkJY+T+2U
         9HIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743843484; x=1744448284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wpj+U6LiNLvKI0gORxBfuo1ew0BWKjiW55LLe8Lju64=;
        b=Rqj39CCM08Ak5USQLZ8IfkIcBSYV8fe9PTed91bN+iFtZd/w3vgQpFUuXh80wqnV14
         BaY/44U+0XHtq+zZ8w+ibdh0pfaXVH+UE1n4WIi2XXdFSe8HKjEf/LHa9FnLWIEQkYbD
         1alLfsD/FDmOrf99TeNZvV0iTVaZK65+j7CbBtsQZnvnN7ZJHZYwJS7E+5OFIVDsEHh0
         lyjw63tm+9l+ab9+D0uysXaTxcBCUQ+E6B3TZNBB0Ch/6FAYu1wJStccaChIIF+86jyI
         JVsKm+TTRuB9uSntVuKx4ds0eAH5yti+fedBi/eIotfEcAXPkNAFtAmTUdMpMB4qFreL
         awCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOjXdgsAW1CrJvNEPx1akN9uj8yFkRTx51flTQqdOv/+AszNAt33qPO4qUvWwGCJgvX7xGWMkjJReOmJ1pXEO1KHfD7A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/QgnUWUSdHUDL1waBikx7t3J5nHzPy7lhgp2miJ/VKW501qbm
	bWGC5dMR06Kcwlsz6qmIOHb2KXHPj+nusngom/A5A0m27J2SQ01UEd6um7Wy
X-Gm-Gg: ASbGncuuEfemBgJDETZ9gQNApbGOLC4PM0iC1xmvw/NT2mkcg7lRg7V/qiI38/Z70sk
	55Qt4Q+pLX6YMVudlMqlPeQIh2wQ4byLj4jSftedd+mhxo9kP8pwSLccEOdhgPaklnEvcaP4G9f
	Bv1bEze9ghA1OgunwjDjnxXlSZgk3BHjl5jzZLeEjD1KtiTY2GbYyDvkuwrT8TsKhkSlZ+pm5ux
	SfBJ+x9qwEdwackmJ9mYl/m4cMPYN4RKCuaSrSm9NeYgQus8oaWdEKOgDuI9DxcSq/6XG8BqRQ3
	TwL4l6D8srTINl42k/fT5oFz0u16o6yY8FibCWnOd1B/UCTM64cg8Da3zUC5NqoDXuQIs+Nm
X-Google-Smtp-Source: AGHT+IG5yymPElohyIpCvRwLjjd8mcIsrLt6BLzCEe2+J4N5vd5JyR9PUE7RxV9on84tC2TCWuScEQ==
X-Received: by 2002:a17:903:8d0:b0:224:24d3:60fb with SMTP id d9443c01a7336-229765bdf6cmr148765415ad.10.1743843484445;
        Sat, 05 Apr 2025 01:58:04 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:fb4b:850a:b504:c8c8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785aea7fsm45347855ad.2.2025.04.05.01.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 01:58:03 -0700 (PDT)
Date: Sat, 5 Apr 2025 16:57:58 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Florian Westphal <fw@strlen.de>
Cc: jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH] net: sched: em_text: Replace strncpy() with
 strscpy_pad()
Message-ID: <Z_Dwlvrvwzq0ZQv7@vaxr-BM6660-BM6360>
References: <20250327143733.187438-1-richard120310@gmail.com>
 <20250327162325.GA30844@breakpoint.cc>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327162325.GA30844@breakpoint.cc>

On Thu, Mar 27, 2025 at 05:23:25PM +0100, Florian Westphal wrote:
> I Hsin Cheng <richard120310@gmail.com> wrote:
> > The content within "conf.algo" should be a valid NULL-terminated string,
> > however "strncpy()" doesn't guarantee that. Use strscpy_pad() to replace
> > it to make sure "conf.algo" is NULL-terminated. ( trailing NULL-padding
> > if source buffer is shorter. )
> >
> > Link: https://github.com/KSPP/linux/issues/90
> > Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> > ---
> >  net/sched/em_text.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/net/sched/em_text.c b/net/sched/em_text.c
> > index 420c66203b17..c78b82931dc4 100644
> > --- a/net/sched/em_text.c
> > +++ b/net/sched/em_text.c
> > @@ -108,7 +108,7 @@ static int em_text_dump(struct sk_buff *skb, struct tcf_ematch *m)
> >  	struct text_match *tm = EM_TEXT_PRIV(m);
> >  	struct tcf_em_text conf;
> >  
> > -	strncpy(conf.algo, tm->config->ops->name, sizeof(conf.algo) - 1);
> > +	strscpy_pad(conf.algo, tm->config->ops->name, sizeof(conf.algo) - 1);
> 
> Please drop the 3rd argument and then resend with a fixes tag:
> Fixes: d675c989ed2d ("[PKT_SCHED]: Packet classification based on textsearch (ematch)")
> 
> As is, the last byte remains uninitialised.

Hello Florian,

Thanks for your kindly review!
Sorry for the late reply, I was on a short school vacation.

> Please drop the 3rd argument and then resend with a fixes tag:
> Fixes: d675c989ed2d ("[PKT_SCHED]: Packet classification based on textsearch (ematch)")

Sure, I'll do that and send v2.

> As is, the last byte remains uninitialised.
I see, may I ask the reason for the last byte to remain uninit? It's not
going to be used so we can save the time to initialize it?

And why does dropping 3rd argument can make the last byte uninit? I
think "strscpy_pad()" always makes the trailing bytes in destination
buffer to be NULL, so it'll always be init, shouldn't we use "strscpy()"
instread ?

Let me know if I misunderstand it, thanks!

Best regards,
I Hsin Cheng

