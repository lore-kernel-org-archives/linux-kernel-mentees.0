Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82897242D6C
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756142247; cv=none; b=VcVcZ2rlZBsC6pu2l8s0SxShfp4/fBmvG2baPnjIh8wyvCzhP0seX5GrU0qJ7b77lxP2HD69Xligt9lYVWpL/wef8lgPfWCLieFA++FKaMzhgoRhtYjsT+BtBSjS88+r/QYNL6UjfGv9sXktMFnx5/jIlQxJuUvf4dXfQlw0l4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756142247; c=relaxed/simple;
	bh=lz/vtaNLA1irUmT+ADzkgy3QqEusslG0LLplIKRTOZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nKbP3aOxizsYsv6Q+nYx9fByRKZOVzAYOy2NTpmibeE1TYym7UGmWTJnYazqJy9MJhAuVWYmjX32PFAZ+4I73xx3zcjmzHRiik82vpblOlUonKZymnvGSKuF7BWqFjRtmJKo5/XTOpIvPTKOWZFX1qalvNO9qvMExJWmB0PmH+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDN+BQJD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDN+BQJD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-61c38da68ddso5052161a12.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 25 Aug 2025 10:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756142244; x=1756747044; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HOt2WdWgfmIt264RtiHKtTdiUuhGCVPrX6tVa175yUA=;
        b=WDN+BQJDbW1W94FjT4KVgBx7QthSxswaVhOXOnKAlWivND10/7Hcivsv1eY2zTyO7Z
         OJtPOBBp+qG1ZmQhyIyfUPIKGj3zz4ImCLS4fTXlyAZAUAd/kyq78GQuu+7tiyfffc/v
         bMLQCDqvdETE7cFbkRWvbMSr8KhC7wle5ldjxcw2rhf8kln4JFgBcAkCYUHby2yZ3WkH
         TevvQwf0IhzsjQ5xDlDj0AYcnBkmbpEn3FjOVnZhuQZtFfZ3rZpU58pnQfdCe8ZBMVJy
         9xOay2UYkgSJN5hffbCJ+SCvi2zwnZSiYHWAwLQkEl7gxvG4uwY7B1wayk+qo2bUYV/s
         qtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756142244; x=1756747044;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOt2WdWgfmIt264RtiHKtTdiUuhGCVPrX6tVa175yUA=;
        b=hqxOAX4uiYHk0xwlLt4GiGcWJ7NtVnFlWDWXomAUtp4bGX5ZNBbAwW3uid7vOvKJMR
         scEzi58qhfGfniJ8xLOG3pZ0ySGqDr+7hrK93SOkvb1qf6TLGf0d19qlX5LRl9/il4OE
         sJP3wpUMv8OTFD3MyuTLu/0WnbKcN6Ntp3EOiXKuKR6RLcUIsZkc6BKwbLhUGGAEEyce
         SiTn7F0R/bUBbyJ1LBrW/MHaRfwFEar+0NIv4KbR0yK1po7ZUp1TYaxfGTbjgWFteusJ
         R2DGpeOrB/MmBhd4xOg+ZyCdvLXNgEEAlRlKZlhPyzfEcqrnOanpNX69vOHufWSL65SQ
         YdsA==
X-Forwarded-Encrypted: i=1; AJvYcCV1ocg1O7ZtzlqBhcxE73AFcSflrJ7TnjQEeR4i791M6LjMz88nIy15cIkeXGuXgHSW+cbJrCA87CWdqgf96sv0mY1bTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1zh5bo3RFhgy+O5aRqPBd9FxDwi0T7tdBsvXSIf/9sRF2QC3e
	hkCwo5s8hWKd6rgXkbwJfgriALGbAZD2SdDiMli4g7PAL8+/0p8QFySyubd0jBDko4KRRQDbT7X
	jJ4U3tKLgC9Q/O0b5SLkNtBLNnLuTI+w=
X-Gm-Gg: ASbGnctz19Q/GrbpsPRxsSrf252IiYVowv8braomScZ8LgGiRgudz0misg7sSKMk2TA
	U+wNPOkX3eynXQF8LiX0d7OGE37YOJTY4sWp3TqLJ8QfA5kh2efIwwvnCOjXakHT+KXuILnfTIu
	ZF/MdJXJnbTdW24I5FyaQ4ydxaC336WeH8vNanLG9h8zN3gybOUZMjlXRSCYnCzRoVW2uX5vfT4
	jj5N6T4xPtCsus/wq/mo4R0Suar7+doWoSJXTqYRxJIVvc5PenfN9Y=
X-Google-Smtp-Source: AGHT+IEJdPBls5tzlHdIjJxUH56ZQVIsjehvg86rgOhctTXiV+0bVZgINoCJv4h9ZMKPQoL4jzVYau0eht2j6asIalU=
X-Received: by 2002:a05:6402:274b:b0:61c:5b44:b277 with SMTP id
 4fb4d7f45d1cf-61c5b44ba38mr4666947a12.13.1756142243835; Mon, 25 Aug 2025
 10:17:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250824185015.6312-1-viswanathiyyappan@gmail.com> <87y0r8c7ga.fsf@trenco.lwn.net>
In-Reply-To: <87y0r8c7ga.fsf@trenco.lwn.net>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Mon, 25 Aug 2025 22:47:11 +0530
X-Gm-Features: Ac12FXy4_W5223zNV2R4E_hB2Hpaw8zWvt8sB2dA_0Y6h7xR7tOjMTxHnc2vJcQ
Message-ID: <CAPrAcgP85f1unaHsLSeghPtjeNfAEtjfSXZMFrms1kyNnsMaMA@mail.gmail.com>
Subject: Re: [PATCH] Documentation: process: Fix grammar errors in management-style.rst
To: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 25 Aug 2025 at 10:40, Jonathan Corbet <corbet@lwn.net> wrote:
>
> I Viswanath <viswanathiyyappan@gmail.com> writes:
>
> > Fix various grammatical errors in management-style.rst
> >
> > Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>
>
> Thank you for working to improve our documentation...I don't think I can
> apply this patch, though.
>
> Your signoff should include your full name, please.
>
Just to clarify --- "I Viswanath" is my legal name as it appears on my
official documents.

> But more importantly...
>
> > ---
> >  Documentation/process/management-style.rst | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/process/management-style.rst b/Documentation/process/management-style.rst
> > index dfbc69bf49d4..4ae05a89950a 100644
> > --- a/Documentation/process/management-style.rst
> > +++ b/Documentation/process/management-style.rst
> > @@ -15,8 +15,8 @@ to do with reality.  It started as a lark, but that doesn't mean that it
> >  might not actually be true. You'll have to decide for yourself.
> >
> >  Btw, when talking about "kernel manager", it's all about the technical
> > -lead persons, not the people who do traditional management inside
> > -companies.  If you sign purchase orders or you have any clue about the
> > +leads, not those who do traditional management inside
> > +companies.  If you sign purchase orders or have any clue about the
>
> This change is OK, but what was there was OK too
Noted

>
> >  budget of your group, you're almost certainly not a kernel manager.
> >  These suggestions may or may not apply to you.
> >
> > @@ -42,9 +42,9 @@ actually true.
> >  The name of the game is to **avoid** having to make a decision.  In
> >  particular, if somebody tells you "choose (a) or (b), we really need you
> >  to decide on this", you're in trouble as a manager.  The people you
> > -manage had better know the details better than you, so if they come to
> > +manage better know the details better than you; if they come to
>
> This one changes the meaning of the sentence
Sorry for that.

>
> >  you for a technical decision, you're screwed.  You're clearly not
> > -competent to make that decision for them.
> > +competent enough to make that decision for them.
>
> ...and this one was fine as it was.
>
Noted

> >  (Corollary:if the people you manage don't know the details better than
> >  you, you're also screwed, although for a totally different reason.
> > --
>
> In general, this kind of playing with the wording for text that is not
> actually wrong is not hugely helpful; I would encourage you to look
> elsewhere for places to contribute to the documentation.

I see. Thanks for taking your time to reply to this.
>
> Thanks,
>
> jon

Thanks,
I Viswanath
