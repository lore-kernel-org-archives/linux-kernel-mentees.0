Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A632216605
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 19:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739819113; cv=none; b=q+bSCwDdlem0zK++MqGv7BD6qMF6LIDo2Jw1cgspE7cHNCreG7xn6D7sXDwYTMbJm8jxJMdNbWzEhXURA/GjhxZxlL8YXiFnesfvYE1pErRLLtIyLANqNov4hoRyJcKFXUCBAPcZElmthRhCgsDmoxLw0wb+uZuekOEZaRWwcnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739819113; c=relaxed/simple;
	bh=RPskkqbaNW21ehKIYfEfNFLQLoxMN20fJReVtLMfZiY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9L3eX8cifMuaMNplesNyWMXHzxATgitVD6q0O4P3JBzBSuE8EV5moJeCpVUeRejx5xJReg1+194bZWdm+n9jSHibwV8HZJu/xu1wLI0maKN/70/M9sH+655/SfB+QQytqpDesNXalqSVH9a0pvHma4+T32SsT/BI/H8Ptp8k9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJV24xbR; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJV24xbR"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3f37207259bso1120807b6e.1
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 17 Feb 2025 11:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739819110; x=1740423910; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z9LcNXhBDFpkuTJe4Uy1LJYi6piFdxgiASQiQasAa30=;
        b=MJV24xbRwhmGYeLwAzHrn2QqEBM6X1H9L6l5x08vJhwBkU8XKRC8U5F89P1CBT3mGn
         q3Sj7K4GoKJXhW9X3ZuWOPNjOo2jARKRdfWxc0Tj1ykv6sL8PHzIMhDn10M1VNvtAasZ
         FKMhcoeUqiGfZJE3HKbbPMtxmq3VB42NCAvkCgE1pyYES0JJdiVLYkqoASUrQmewrqFp
         G2JjsvH+cNjD6kwRkn5dZCPOgy7Ch0VKBWIagQDJ/HQjvlGeSdsFbrQO4MsCX3lJaoQC
         nZnXbsiq/FMU/3K24uZ3rlFI66K+oYSLgdcbHmmkS+A1UJRBEvFO616HHpiv8ZE/sW7B
         lsYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739819110; x=1740423910;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z9LcNXhBDFpkuTJe4Uy1LJYi6piFdxgiASQiQasAa30=;
        b=to+bYex2K8I+0obR2898iXxNrKuADxYPOkYNC/1NzbO3rbwfu44MkhwfaV571Mk6Jc
         mEqRkId5vPanyvoPOdjH7WkzbCOtWEU/7GvH5IfbK08q4n+2WgLjQpb4Bpbux6ZAoJAF
         XjE1Rme4wQSQ00rdXD5JuZ1daym2vLI4usDnf+YPPXcqSmfoV3kkaRVSZNQXQkRroSeG
         g3PxhxvPBNBX9HtfateOB0GA6BGNGRzrYoPS6mlEY4AF/7VD+/trUTWsZAXAmwrEse8X
         y4k0OTbxK17YCyF/6HGBlRx1Uu1M337ibif2csgC5kQ8C1gGEMISip/hT1Kd4EmdigPE
         eyWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEzZJdqww8zPhhveLw+zJ9/Pm1PLu0O3kLCbrOBGwErvQMGyMbfZ5jHYILTH2ndJ7iLIinLdpeVPQoLGt7QzzIwPzMYg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaQCmt9oTQdCOzm+q6jX0xElcN/0Xfwiig6FToiYB4ny7Zd/ut
	6ywTBuKYbkYGVvYo3n+JBIrXFzK1iZqn1kogHRvoWQYgN6+dGwKFPBskU6ZW2xsCP9tzX2o0LKG
	zuh41NbD3PdiJIw2f3Sr6+Xg5Gao=
X-Gm-Gg: ASbGncuA2nBAm94NvVdA0pD2QLcivusEVJALDF6d6rboEr+RzjWVkHEa66LuVY2Vnjw
	sEnhGCe7NGe8hexCPS2D+Gi8Ia9YhCX+maTBsYZTCLfeOJxm9MwCXw5jCaZsExNJvgORXhns=
X-Google-Smtp-Source: AGHT+IEGUO+ZKW5MdSbkeK7bIPHZpL9q92U612lbCxDsvfg2NvHooHiWe6mGJE1DbxzwMq8gJ6pgOBgWgRR9vwNigzg=
X-Received: by 2002:a05:6808:f89:b0:3f3:e81a:d244 with SMTP id
 5614622812f47-3f3eb11b254mr7490498b6e.31.1739819110557; Mon, 17 Feb 2025
 11:05:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAO9wTFgtDGMxgE0QFu7CjhsMzqOm0ydV548j4ZjYz+SCgcRY3Q@mail.gmail.com>
 <CANn89iLjxy3+mTvZpS2ZU4Y_NnPHoQizz=PRXbmj7vO7_OGffQ@mail.gmail.com>
In-Reply-To: <CANn89iLjxy3+mTvZpS2ZU4Y_NnPHoQizz=PRXbmj7vO7_OGffQ@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Tue, 18 Feb 2025 00:34:59 +0530
X-Gm-Features: AWEUYZlOdUlqrxjWVWF2pcnSub5BpZ5scnbsGSXPPLTq5j20PzqKxfTetl2e7Ls
Message-ID: <CAO9wTFjaLBbrT7JKBBN=2NMhSRmxzPk_jLSuG=i6Y5anZJnvEA@mail.gmail.com>
Subject: Re: [PATCH] net: dev_addr_list: add address length validation in
 __hw_addr_insert function
To: Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, horms@kernel.org, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,
Thanks for the feedback! I'm new to kernel development and still
finding my way around.
I wasn't working from a syzbot report on this one; I was just
exploring the code and felt there is no parameter validation. I went
ahead and made this change based on that impression. I realized my
changelog should have been more generic. Sorry about that. Also since
it's not based on a syzbot report, is it good to have this change?
Your insights and suggestions would be most welcome. I will make the
required changes accordingly.
Thanks.

On Mon, 17 Feb 2025 at 23:58, Eric Dumazet <edumazet@google.com> wrote:
>
> On Mon, Feb 17, 2025 at 5:54=E2=80=AFPM Suchit K <suchitkarunakaran@gmail=
.com> wrote:
> >
> > Add validation checks for hardware address length in
> > __hw_addr_insert() to prevent problems with invalid lengths.
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  net/core/dev_addr_lists.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/net/core/dev_addr_lists.c b/net/core/dev_addr_lists.c
> > index 90716bd73..b6b906b2a 100644
> > --- a/net/core/dev_addr_lists.c
> > +++ b/net/core/dev_addr_lists.c
> > @@ -21,6 +21,9 @@
> >  static int __hw_addr_insert(struct netdev_hw_addr_list *list,
> >       struct netdev_hw_addr *new, int addr_len)
> >  {
> > + if (!list || !new || addr_len <=3D 0 || addr_len > MAX_ADDR_LEN)
> > + return -EINVAL;
> > +
>
> We do not put code before variable declarations.
>
> Also, why @list would be NULL, or @new being NULL ?
> This does not match the changelog.
>
> >   struct rb_node **ins_point =3D &list->tree.rb_node, *parent =3D NULL;
> >   struct netdev_hw_addr *ha;
> >
>
> Any syzbot report to share with us ?
>
> Also, a Fixes: tag would be needed.
