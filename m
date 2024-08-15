Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444004AEEA
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 19:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723750359; cv=none; b=j4sh6DSJS1ka39UNS8f5vn2R344IfsQrxIOeDfsiY3kO04YYcYoJyGDRekcaKqOZKJYc5gVjOp3BEDUBE37//NA9fRyjuRfm4Oc8tsd+9xY9WflPYDIEszIoNqW9ecay8/Wu86OQs9KzfZk0oy9R2XL2i9qxndtPF+5XgvPzaZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723750359; c=relaxed/simple;
	bh=hlL28argICLuWvwcogXRPeun1O8bK02suZxF8cP+Ffs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=anuPgNc+N3AjRA0tUyeYv6Xo4HJRBL2OJMTvOoqsm8UB0abw2hrO+2h1ZTVDZitTms7wgKcbr3PILrEK5pUBtRROVboQn9S+eAeq/x1sBodEQiKjrIHKhJZt4Z2TEvIg47+SF9ZHcuOikGnojv5iE8MaWhfpXWqbm+Nhe7ooIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtIlLjzn; arc=none smtp.client-ip=140.211.166.137
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtIlLjzn"
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF41D4032C
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 19:32:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUJdfFhXbQVs for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Thu, 15 Aug 2024 19:32:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=sergio.collado@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A433140311
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A433140311
Authentication-Results: smtp4.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JtIlLjzn
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	by smtp4.osuosl.org (Postfix) with ESMTPS id A433140311
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 19:32:36 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ef2c56d9dcso15549141fa.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Thu, 15 Aug 2024 12:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723750354; x=1724355154; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VMWtIVUQceYpVvLsBLbPk3iyKD7Br7JtsGxqPKKxK4=;
        b=JtIlLjzn31Z9f7KOkW1XTsOm1cBhgg+fitGDPdKRU46A41sMEIv94ooJY/gqCbZ6O7
         4GYD/nQUZumxVPFUVfKSjJoQaDa9S7nSLV+PjWJK7CTwaYqae0d74cv/PaHTxaxtQ+T3
         c5Hp1lKMx0heXU222Lz/23DXrUABalVBA0I3+TOP0xL12mgK+4nxL0bWQNbWJ6Ly7PmV
         Yp4OlGEEtQLsBwUp4JHYcRsqyx+/C2GQohlVhcnejQBVUlrY5r7ElCHJnFyguQ+Ui2oz
         VfvL1O+RCCtRPSsGywnM8xinfHcccy2yqIDeGhwqvzRpeyGapmCLGA2nd+uVdWeHLMyF
         PY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723750354; x=1724355154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0VMWtIVUQceYpVvLsBLbPk3iyKD7Br7JtsGxqPKKxK4=;
        b=Q4iIf2fNBGVMskMtHi1F32u/IL/1ovNaOIzf3l+NVAOac8qHhPNUAe3CqeX9EFOPaP
         41yltdXzaLE2lICZ/Nah7KD20S/JP8ko5RdF1U406Ix6ThPmglLUDJqBEn/Q0s0kw7/G
         fFNbGiA6Q/yn9uJhWXy9r+A7LHpziMq34JstES8gS/XhmeDpTOmZGwhTc7GOvXnTP3zr
         3Dba7c8dDrlbuWuwxzKK+2+lLgVDmg33H3WLfYxeOLemJHfqrlbD9jHWXiVSRuPgJbjC
         0C4UlnEyuB5nnziYxfJbrbL6CXCxdBzYPzA7fzU3A3a0jkyY//px6p6mGH4SQerE/fVV
         8L2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8pgOEv+hAstJbSfsCn0enaPMK8R8AXci5OVxpcBNV8JkU22TG5uCdp2AZwpbBaRcHChjzcED+Jcd3HQx5wv8eYQIVNtnAuEIf3/aXl9UDYyO7bN8tczaK8ZvO6TX5
X-Gm-Message-State: AOJu0YyEjkFzAGE7nZxNPGHa302q1CkP+7mZTHDClqNabPCrBTae6j/P
	iMG9KdjmWSMT6chmwvffPh1ICCfpBqmo4tcesQ+qEm5YlrsCRr21lAoOdKy0xyRQxcs+EGzG/ev
	7udirT9IUnZnIc+tllx4jADhHIvg=
X-Google-Smtp-Source: AGHT+IFh2pRw1WXxjD533NOYR3CmzviYIbHdMSsqG1lW5W3Hf0Oh1ro001FUh4FCsYoILC2D9KjC+2LRp4j4b7/Mno8=
X-Received: by 2002:a2e:be23:0:b0:2ef:22ed:3824 with SMTP id
 38308e7fff4ca-2f3be57e68amr5908661fa.5.1723750353365; Thu, 15 Aug 2024
 12:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240730201315.19917-1-sergio.collado@gmail.com> <2024081227-habitat-cough-dfb0@gregkh>
In-Reply-To: <2024081227-habitat-cough-dfb0@gregkh>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Thu, 15 Aug 2024 21:31:57 +0200
Message-ID: <CAA76j92XEdBJzMVuK1w2bk=Or07NtMpsZ3B-K_DWXLSkWj7iCw@mail.gmail.com>
Subject: Re: [PATCH 6.1.y] jfs: define xtree root and page independently
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, linux-kernel-mentees@lists.linuxfoundation.org, 
	Dave Kleikamp <dave.kleikamp@oracle.com>, Manas Ghandat <ghandatmanas@gmail.com>, 
	syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

 The original patch is already in linux-6.8.y, so I submitted the
patch for the previous branches:

 -  linux-6.2.y:
https://lore.kernel.org/stable/20240815183641.7875-1-sergio.collado@gmail.c=
om/T/#u
 -  linux-6.4.y:
https://lore.kernel.org/stable/20240815185026.8573-1-sergio.collado@gmail.c=
om/T/#u
 -  linux-6.5.y:
https://lore.kernel.org/stable/20240815190146.9213-1-sergio.collado@gmail.c=
om/T/#u
 -  linux-6.6.y:
https://lore.kernel.org/stable/20240815191047.9737-1-sergio.collado@gmail.c=
om/T/#u

I have not addressed the branches linux-6.3.y and linux-6.7.y as those are =
EOL:
  - https://lore.kernel.org/all/20230709111451.101012554@linuxfoundation.or=
g/
  - https://lore.kernel.org/all/20240401152553.125349965@linuxfoundation.or=
g/

Please let me know if something is off.

Sergio

On Mon, 12 Aug 2024 at 16:37, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jul 30, 2024 at 10:13:15PM +0200, Sergio Gonz=C3=A1lez Collado wr=
ote:
> > From: Dave Kleikamp <dave.kleikamp@oracle.com>
> >
> > [ Upstream commit a779ed754e52d582b8c0e17959df063108bd0656 ]
> >
> > In order to make array bounds checking sane, provide a separate
> > definition of the in-inode xtree root and the external xtree page.
> >
> > Signed-off-by: Dave Kleikamp <dave.kleikamp@oracle.com>
> > Tested-by: Manas Ghandat <ghandatmanas@gmail.com>
> > (cherry picked from commit a779ed754e52d582b8c0e17959df063108bd0656)
> > Signed-off-by: Sergio Gonz=C3=A1lez Collado <sergio.collado@gmail.com>
> > Reported-by: syzbot+6b1d79dad6cc6b3eef41@syzkaller.appspotmail.com
> > ---
>
> What about 6.6.y?  We can't take commits only to older kernels, that
> would mean you would have a regression.
>
> Please resubmit for all relevant branches.
>
> greg k-h
