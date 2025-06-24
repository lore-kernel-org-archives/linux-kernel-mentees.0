Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F7762D1F68
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 13:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750773416; cv=none; b=k9mAcLWG9mDMsoeuuqVkV9pagLTyt5hCONn6dBRHwnpsVbvteOWaXk3GVyv5S83F1yYFMIYtO8o1wKNF17tWC9+b2O+iXsFzsc8yeBx75OwrV3T0bvJ2GaKCjmHhDUbe9xWG+1jGeN7mQx1AQqazGX+UhuhGE4Up9xFuB2hy0Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750773416; c=relaxed/simple;
	bh=BpzCqYrZgktHyHFsZFW3UfcXDFM+0KqnOLAMuBNHnj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGS4bH8AU1fD+fES6tMAkDLLUiSSQLeD8Qh5GQhvGvMCjE+JBoClkP3tKIJN/F/El0FM1peEpvezADm1LqELoLdGGgMCKin/7h7kKLZb/ULB1FFSPiIcw9llP3VssSAK+d1A06bXXnm6UprO0u72B6b0u+XNb/6EN7st6U1TeWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mQnwpYcz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mQnwpYcz"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553b82f3767so4805744e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 24 Jun 2025 06:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773413; x=1751378213; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yABC0w8DEfvFsnNOYqPanr5Sg2H2x2a5U7q3it7HMM=;
        b=mQnwpYczlEYkSwyL/+mlainV1bwumx7zf8LcbcfCQQOTMIMPw/aStbQHBeQi71Mvxt
         vwJxQZWl9acYj1GwHfWPl+H19doTFF8TkE9AgNxt+zmLRP6JIsq3fXC3UbqcRawAbqMs
         GbGc2ShFMjw+ak8cKZyrto6mcIZzsTuHsqU7sC93qzLJItimZX/lliMLSF01/UV+bYGG
         GnjNTC5Yn7KyjHn/qGoC5xcI3HXKzQm0UUWzRULwwick9r2n6h8yeWRFqxFWFS/KNcaQ
         2Wos2ifb01PaPCDeaJnQXskm+E1YD2R6pkXZppwYD7Dpa0akzE93O7lDO5zm+6UoL7qN
         80Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773413; x=1751378213;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yABC0w8DEfvFsnNOYqPanr5Sg2H2x2a5U7q3it7HMM=;
        b=c9jLJlz1AyNHNkGY9vm0GtenlGiWqjK94IHRprqqSQIkil3o5pHGTvVFFpaB18VhOu
         8FzgQG3O4sKj/pocEmlyW8wht+/GVRV8P2GV4sAWdrMNpUwdcOkAOYhFpd8kiotHunUf
         xy/UIin6wncAZ7yuK7yqvXl4KGOYcgwkQIgoKJKSqgXrEeX0M9VD0R/m4R4Y02CQQwuE
         JfUSIHjYSjv6Gk5qPMcMyprnM/6Ci39IGySaT55YfCo5JoIqnFS0OJ5PW75b0d98UDiN
         mHFkYqnKWKiQ+WZwxVBaqX/LNB6i4HOZJnajaotvJ9nv/nkWdorzzxNG/6dlIk9wfXqw
         mIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Rp5yZ6BBAzRqDxQclswwIu4zxWXn/iaSA31cOT7H/LUwXY4t/UjxOCd1pI81wnpyjISRNteaY17qEMJf156OfqgMew==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlfAhTc24ZglnDqVAN4bW9EQl47bmMqe4YEOCTi84Yp/ArFUwO
	ckudhgT5NXp2bVGbinddRwMr+boMvbr45BCCPh2UFQMcwFvz2kxHQKhXWvzRz6kWTBifzmP3NOQ
	iwo1ic3m45hdT48yzweEtIQu+Cqqc8CE=
X-Gm-Gg: ASbGncuzQb0d9IOAKH/LoLiB9ojGgkSytxb8Tyr09eeoShCqpLKxvJ2Qx5XvkT1W3FX
	GbjWqIEZuU5lUlal9EAYgP3rC6KlPx7IBCF6W0aE39oSgsVK3fvE1ZUGCwakyyFAhYOVKFdE41c
	FMEM4p4dWdQOri3xkdkAgyrC751afQ5kRDn6Z64mqB/PsT9bY013V/ykrb2heBd3Dyasl1ihCV2
	iJ6zA==
X-Google-Smtp-Source: AGHT+IHXYi6I/UqWOT18oDq+1JOOpyKXM7cogsUpmD7YM+DSdmtZsArE5Lb3v+YDn6Av7/arwxcsKeYaVo5vgs03PuI=
X-Received: by 2002:a05:6512:b8e:b0:553:37a7:b217 with SMTP id
 2adb3069b0e04-553e3bf3e5dmr5544673e87.35.1750773412740; Tue, 24 Jun 2025
 06:56:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250623091929.366357-1-pranav.tyagi03@gmail.com> <2025062343-brilliant-laziness-e2cf@gregkh>
In-Reply-To: <2025062343-brilliant-laziness-e2cf@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 24 Jun 2025 19:26:40 +0530
X-Gm-Features: Ac12FXxXAIMa7msu1Ixldzq9g6VHMyrCm53AQgkcjWXSWvwjIHhI1C4QApdm17g
Message-ID: <CAH4c4jJtKP_MsqGBgt1kRim_nmWOS=Zd49iNYiHNM2-yDgMv1g@mail.gmail.com>
Subject: Re: [PATCH] cxl/port: automate cleanup with __free()
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dave@stgolabs.net, jonathan.cameron@huawei.com, dave.jiang@intel.com, 
	alison.schofield@intel.com, vishal.l.verma@intel.com, ira.weiny@intel.com, 
	dan.j.williams@intel.com, ming.li@zohomail.com, rrichter@amd.com, 
	jeff.johnson@oss.qualcomm.com, peterz@infradead.org, 
	linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 2:57=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Jun 23, 2025 at 02:49:29PM +0530, Pranav Tyagi wrote:
> > Use the scope based resource management (defined in linux/cleanup.h) to
> > automate the lifetime control of struct cxl_endpoint_decoder. This
> > eliminates the explicit kfree() call and makes the code more robust and
> > maintainable in presence of early returns.
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > ---
> >  drivers/cxl/core/port.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/cxl/core/port.c b/drivers/cxl/core/port.c
> > index eb46c6764d20..c35946882b20 100644
> > --- a/drivers/cxl/core/port.c
> > +++ b/drivers/cxl/core/port.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/slab.h>
> >  #include <linux/idr.h>
> >  #include <linux/node.h>
> > +#include <linux/cleanup.h>
> >  #include <cxl/einj.h>
> >  #include <cxlmem.h>
> >  #include <cxlpci.h>
> > @@ -1888,14 +1889,14 @@ EXPORT_SYMBOL_NS_GPL(cxl_switch_decoder_alloc, =
"CXL");
> >   */
> >  struct cxl_endpoint_decoder *cxl_endpoint_decoder_alloc(struct cxl_por=
t *port)
> >  {
> > -     struct cxl_endpoint_decoder *cxled;
> >       struct cxl_decoder *cxld;
> >       int rc;
> >
> >       if (!is_cxl_endpoint(port))
> >               return ERR_PTR(-EINVAL);
> >
> > -     cxled =3D kzalloc(sizeof(*cxled), GFP_KERNEL);
> > +     struct cxl_endpoint_decoder *cxled __free(kfree) =3D
> > +             kzalloc(sizeof(*cxled), GFP_KERNEL);
> >       if (!cxled)
> >               return ERR_PTR(-ENOMEM);
> >
> > @@ -1904,7 +1905,6 @@ struct cxl_endpoint_decoder *cxl_endpoint_decoder=
_alloc(struct cxl_port *port)
> >       cxld =3D &cxled->cxld;
> >       rc =3D cxl_decoder_init(port, cxld);
> >       if (rc)  {
> > -             kfree(cxled);
> >               return ERR_PTR(rc);
> >       }
> >
> > --
> > 2.49.0
>
> Note, I can't speak for the maintainers of this subsystem, but
> generally, making changes like this for no real good reason, for code
> that has been around for years, is really not needed at all.
>
> If you fix a bug with it, sure, but changes for the sake of "let's use
> this new feature" in here really might not be necessary.
>
> Why not add cleanup.h support to code paths that actually fix existing
> bugs instead?
>
> Also, you have added some coding style errors to the code now with this
> patch, which also is generally not considered a good idea :)
>
> thanks,
>
> greg k-h

Hi Greg,

Thanks for the feedback.

This patch was intended as a cleanup to improve consistency and
readability, particularly around handling early returns using
cleanup.h. I followed up on similar prior patches that introduced
automatic cleanup in this subsystem and aimed to extend that style
more consistently.

That said, I understand your concern about changing long-standing
code without a strong functional reason. I=E2=80=99ll be more careful going
forward and focus such changes around actual bug fixes.

Regards
Pranav Tyagi
