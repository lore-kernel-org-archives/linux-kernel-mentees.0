Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041913CA9C
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  4 Apr 2025 06:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743749594; cv=none; b=XKIQpZh/6reN+8l1qwGNnaXIminzuOl1fMLWkmWlnWi3+0xSV9dd5wPN687PIIx9v+baX0kzGJMbXMdoQsZyjPyKMFcyh1pVIHWPP/oEKwwvaYkBMJktEex9xI1ExEotW2zRF7b46O4s94OJMKY+qvX8hMcLGle6ZQU6egBL4fQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743749594; c=relaxed/simple;
	bh=wagEcAUCHG05vNZLORykGW7a7L+MU7y4dAnfJ7Prwbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UgH48o9VPUjqRal3FfKaW8EJpK+f2k90+ZFg0O+cj1LNK7hK6LKNBkVKmA243HAAz+XqJsSWzGuI56kBnK3+7ZneT8xt53x5QdQyZwJy+zdawJ+0QCfyvGsannzwn4LJbzye2sVDNDI1e2XkvewUoYLgigz8A9oDpKIGFqWNg5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hM3w3MoQ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hM3w3MoQ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-301493f461eso1276449a91.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Apr 2025 23:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743749592; x=1744354392; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wagEcAUCHG05vNZLORykGW7a7L+MU7y4dAnfJ7Prwbk=;
        b=hM3w3MoQmCDFccGiUi+n4FNhdwP1r7ZTUA7taWkAOX8ZXl44UcMBI0IJb2ao6wOQRO
         zIqF/WXt+EF514FzYA80y9dUzqUjKDM+3JxAE3/DaEwTmwi0x7fjycxtdLROHxkx5WA0
         wW7Tls+GHOoYeTvb8TzmijqPMZ9rS0Semej71sTNsYxgx9hcBGBXyNgUTEd1dRjNxVf2
         pauDhPm30D/a1ld6ZXRDSCdjzrkH7UmGC7mxQuoQl9zDAsCxZBeGiPSbt5gDM51ZrI2t
         kDeG244ZPI5UFbiN8ofPn+4UdXPSiAOvddxin5uuMbp61BmwSSNyoqLg78yI0nb0NDcK
         ndig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743749592; x=1744354392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wagEcAUCHG05vNZLORykGW7a7L+MU7y4dAnfJ7Prwbk=;
        b=sgkIXlN+RFlSMp2oTJnfepOMiyHaVeAbBDzB2Bkcn+UlNDCDsjJQW8CI/Y/corDn/m
         Shj9MWD/dfDDIrTjO6UoOenCbLwgEWtG/pa9HsypnFPxbgf6jnSxpIRidpFHApWS1WM7
         RNhl+tBCcVc/EiOypHY+ITuNj3s1oLH0h/TcZweyO6a1UC6K0e1088frZqmf1ISFTIRm
         W2gWqN4qq5+9EXvyH8JMJO4RWXHJaY1I4UYjRNtj1wIuW1Tnq9Deyjb0snOUtgHqPTN6
         A9Q1ZD0BtlaJU5v8FHdI5eycCOQ+u8ePyLtWjZebh0YhR7oUaqs6X7Fz5Zkq+aCflYcG
         ZFIA==
X-Forwarded-Encrypted: i=1; AJvYcCUS+V2CEhFhwNC4I62Q2/Umzi+HbXt+XtygGF2aSqyBDXRIuOXOnzx6rao1ibXCSfsjNlBoUNYkt7L07J5zxFJwCOSVNw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0fC+6wzpXopGFCYOJNmdhnBVy572uhBJM2iaPj/ndQIUazAtY
	WAolMSBWel5qY8DDWGHQrk8itUxJzurD5HO4zNqL15+GJJwF2eheT7GgXrbvT3XxUsp221GL+3i
	vKdBUOfE4UwPtjC9CLZswDeiq/uw=
X-Gm-Gg: ASbGncsOEQUMvdHGy5jca3YtvhhWAjVrWqAZzvmOyA+D5KKcQa627Ms/fn8JDS+7Wv9
	g8hnBJeMM1dGa4N9JJSmk6o4R0nT/iaZnNi0Fkn+HCSD2xxv313UoYdFyn4g+ffFqgExyz6u3Hd
	cOTIw+pq8OULcfLgJukvn+5gk5IHLRCPsHnifN
X-Google-Smtp-Source: AGHT+IEL7jgtpRh1nW1SS7zZ3z7a94wwMUS7u52cjNfkU3cMCpt/OhXhPeGtWWkv5f5GksecYqHZpamDGK2sAf61OpU=
X-Received: by 2002:a17:90a:e18f:b0:2f1:2fa5:1924 with SMTP id
 98e67ed59e1d1-306a62138a0mr1822038a91.26.1743749591696; Thu, 03 Apr 2025
 23:53:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250402161043.161795-1-bharadwaj.raju777@gmail.com>
 <zjqewsg6ijvol3x3rdjfyjeji3wy24nw45yb6mkqj7vwsk7mrn@yxnvgpj4i24k>
 <CAPZ5DTEGi8RXBMui823bwnt96PcqZSavH8AQ+LPhRs=sJ-Br1Q@mail.gmail.com> <ciw5ocj6io5q5p2tsv3sqpga2ff73eqwhlrrug4el63ggolcho@iviprrqsaemj>
In-Reply-To: <ciw5ocj6io5q5p2tsv3sqpga2ff73eqwhlrrug4el63ggolcho@iviprrqsaemj>
From: Bharadwaj Raju <bharadwaj.raju777@gmail.com>
Date: Fri, 4 Apr 2025 12:22:45 +0530
X-Gm-Features: AQ5f1JqhQjzHwVi0_Dvyw6YFPjyd625XIAiKSOF-1GZqntHD3yyuAojBkP7y-AU
Message-ID: <CAPZ5DTGWC2Xemgby9E8EL61Vio0NYQrKBd5FNpvERwwBoEP8tg@mail.gmail.com>
Subject: Re: [PATCH] bcachefs: don't call sleeping funcs when handling
 inconsistency errors
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-bcachefs@vger.kernel.org, shuah@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+c82cd2906e2f192410bb@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 10:08=E2=80=AFPM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Apr 02, 2025 at 10:03:10PM +0530, Bharadwaj Raju wrote:
> > On Wed, Apr 2, 2025 at 9:47=E2=80=AFPM Kent Overstreet
> > <kent.overstreet@linux.dev> wrote:
>
> If you're feeling particularly adventurous - print_string_as_lines() is
> a hack, I think we should be able to do something more robust by
> skipping printk (that's where the 1k limit comes from) and calling
> something lower level - that will require digging into the printk
> codepath and finding lower level we can call.

I tried looking into the printk codepath, namely vprintk_emit -> vprintk_st=
ore.
It doesn't seem like there's a convenient single lower-level
entrypoint we could
call which just avoids the 1k limit, rather there's a lot of internal
code mixed with
the truncation that we'd have to just copy if we want printk behavior.
I don't think that's a reasonable option for us.

> I also just noticed that print_string_as_lines() needs to check for
> being passed a NULL pointer - in case the printbuf memory allocation
> fails. Want to get that one too?

From what I'm seeing __bch2_print_string_as_lines already checks
for the lines pointer being NULL. The only unchecked pointer is prefix,
which I don't think needs to be checked since it will be something constant
from kern_levels.h, not something which could be NULL.
