Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EBA2D7DF3
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Dec 2025 13:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766926863; cv=none; b=dAD8g9HVxig4PHHG9pDa0X5SNNJAm6truq8c1767JwJyQ8WZ9JmlDbOUzoOUWXqYHhU+Ui/3lCD6c7xxzHnzsvHlnGjJLVWVDW6s7x6eJMXtAya6uUDjieCMsxG1hktu4yQxnqP627ka8CyQ6GpaADQnWndyaCcMy3yQ1uIldro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766926863; c=relaxed/simple;
	bh=fz4fB8c3LX5ADF1KLg3YDwRVnUBMr+BnH2+yhoxJ2YA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwWH97HrdV/VXduPcnQbNdyi1ko6UPUkUyr0pOVpsx31NWuD8/G2S9++8IvLFbBwEktxSBAsZcPPqZ5ctYb6FI/SkB24RLPceEL++csaaXIaCQao+0cOGxc6vibk4der5HzvBswvYQQji9xcR3kOIwisAwTh4jrv5MAGygHwUlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eMXIO66I; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eMXIO66I"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5eae7bb8018so3246087137.2
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 28 Dec 2025 05:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766926859; x=1767531659; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMlB4HkqDtdsbd8UCvJsDayybz1XaRYAS8E3HvSH/6Y=;
        b=eMXIO66IEmHLY+o7dwshsiEfI1LbQTR9KRrSKAyBUrz2pzAGx7EBDOdkp2/p91Uq2z
         20GEnn7dmiKK1+YnxWijEkIsyJVS6ROswGjh2/xnt3TYo7imOiSQ/OAQP3WMz3O2clzP
         4NbrdHLHQSVht9xK12h+RStzzsncIhvvrC9lsVSJfXoZvc2BghDrbqCw8f0/zleW2bTF
         oSqymMV/o5BQkao+vvfseoB0Geim640jfGM0nTErjH5Y1v64VKO8m5XzfzWStKNZXt5p
         Xnw6E8KuPmX78gS4v6Jsio4lqN2t+/F/9T7cur/UBlObyH68R4UNZ0OOumcZDCHjsWzN
         +gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766926859; x=1767531659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MMlB4HkqDtdsbd8UCvJsDayybz1XaRYAS8E3HvSH/6Y=;
        b=BCPJ7DOGadpTQUc9cpUD9h7H5qmz327Q2wyGrfuz0zpOyWytb5Bb11hMXp/myXAwB2
         ams7VtzUHxQwmw2C0T+pij04PZx5UD+1F3CXw3QDP9upWBKi8iueIOSEh2AzvhjmJiF1
         ILgw3Zh2WNMFJ2s20hv8/uehAxoIBCYqKUH9ByzOtMWraxtMqw0otEF6PQ6r/VHAUUZt
         rHqrUURJfWTgeIavyDWwwd7YN1Si0kChXWJNINPWIAJaCY/R7m05xMy0gsdu/+hyKUzQ
         J51elaSS/UDVPLOUhTjEPVOiRWnUaiyxxNbFqoYSGLq1X4UI7fp9KT6/msM+v4bVtEj4
         8FYA==
X-Forwarded-Encrypted: i=1; AJvYcCU9f9zI2nTV/UH4hc6nGny0PdEEPBmVZiU4DJLn+Pwpc0Qy74W9dJ40vR+xFNdZirkGYISfl/fBv5IuErSz3XdJ44mYKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFD29oUyzWygCPELHsVBY2jBZnJFKp6COCrLMPp+49QuZNyFI/
	ZcGeyCB4ZSpOjj7lW9Ju3u7ycZmqEMwPi+iro6bnlomZ0wiaHCUyQU93ciHpgMUrJc8H5qsTWE/
	KAbPYLt1pqKXBGcTFUy33W/rH3QjJUOs=
X-Gm-Gg: AY/fxX4lMc+eAgYR2U0SvjZPK7n4RPAyPD7eeWYzCuHDX9mMTN9AcW0FzPkckvVRPUT
	yUWU3Hm/+qfQdBUVDnctRd7r1lmpoocbztZtBlChLKC0HuYNLvQcl2lVA9Imnw3+UgmIYO4PP+b
	Ynospzd8uRQZ9x0eBw/3GbCiskw2m9SScoilZIE9z8s7UqZujb8KGVIlP+j6ybIANQYPzQg09+9
	wqYVot3cucHfMzKtR0ZzzMnZJG8mPRDLRN2kTJUUI2LXHAeyZvzGHgl/JH9TYCt83wBC9I77BaL
	+7NgBi4IyPV8Q3m/D6/vuBZvw4ojRolgAbDqkVYwqUTxp0Gqj4m6vEE5kw==
X-Google-Smtp-Source: AGHT+IFFTtcullLfa96LNQCWSwjtHzlb6Hh8bwjn7V4IIxPK5Fciwjwn9p54oxZzw8YYGJOtaKYbtanBaGeF85pw0eQ=
X-Received: by 2002:a05:6102:d8c:b0:5db:fb4c:3a8f with SMTP id
 ada2fe7eead31-5eb1a8429c0mr6504010137.39.1766926858777; Sun, 28 Dec 2025
 05:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251223215855.2486271-1-kubik.bartlomiej@gmail.com> <b09e6934-6924-4f9a-a866-82599fe64879@huawei.com>
In-Reply-To: <b09e6934-6924-4f9a-a866-82599fe64879@huawei.com>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Sun, 28 Dec 2025 14:00:46 +0100
X-Gm-Features: AQt7F2prZvEoT0Nv_gEYMYL1GopFvS8Mdzq_tYpG4TelRR8HdL9Nkix5oYqVZAU
Message-ID: <CAPqLRf224VcJJM1rmiJTnFXg+5tNeF4HC+AEBWpBpWZO6VxbiQ@mail.gmail.com>
Subject: Re: [PATCH] fs/ext4: Initialize new folios before use
To: Baokun Li <libaokun1@huawei.com>
Cc: tytso@mit.edu, adilger.kernel@dilger.ca, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com, 
	skhan@linuxfoundation.org, khalid@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, 
	syzbot+703d8a2cd20971854b06@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for your suggestions.

On Wed, 24 Dec 2025 at 02:39, Baokun Li <libaokun1@huawei.com> wrote:
>
> Hi Bartlomiej,
>
> On 2025-12-24 05:58, Bartlomiej Kubik wrote:
> > KMSAN reports an uninitialized value in adiantum_crypt, created at
> > write_begin_get_folio(). New folios are allocated with the FGP_CREAT
> > flag and may be returned uninitialized. These uninitialized folios are
> > then used without proper initialization.
> >
> > Fixes: b799474b9aeb ("mm/pagemap: add write_begin_get_folio() helper fu=
nction")
> > Tested-by: syzbot+703d8a2cd20971854b06@syzkaller.appspotmail.com
> > Reported-by: syzbot+703d8a2cd20971854b06@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=3D703d8a2cd20971854b06
> >
> > Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> > ---
> >  include/linux/pagemap.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
> > index 31a848485ad9..31bbc8299e08 100644
> > --- a/include/linux/pagemap.h
> > +++ b/include/linux/pagemap.h
> > @@ -787,7 +787,8 @@ static inline struct folio *write_begin_get_folio(c=
onst struct kiocb *iocb,
> >                  fgp_flags |=3D FGP_DONTCACHE;
> >
> >          return __filemap_get_folio(mapping, index, fgp_flags,
> > -                                   mapping_gfp_mask(mapping));
> > +                             mapping_gfp_mask(mapping)|
> > +                             __GFP_ZERO);
> We do need to perform some initialization, but doing it in this common
> path is clearly unreasonable. It would introduce unnecessary zeroing
> overhead even for non-crypto scenarios.

Yes. That could introduce unnecessary zeroing in other paths.

> Therefore, I suspect something was missed in certain crypto-related
> initialization paths where the zeroing should have been handled instead.

I will try to fix this in the crypto-path only and send [PATCH v2].

>
> Cheers,
> Baokun
>

Best regards
Bart=C5=82omiej Kubik
