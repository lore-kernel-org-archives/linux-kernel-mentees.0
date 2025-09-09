Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82532BF4B
	for <linux-kernel-mentees@lists.linux.dev>; Tue,  9 Sep 2025 12:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757419958; cv=none; b=ZLH+UfDZT4TRxSuZSMDJAqECT0wSjArVLSfe0E+jyD9MmbR3wfdX58X93Z8v7ybqN/w9Or6lSy4SXTx+Sxd+MJFRCwZ6zxgTUYMehaxCTLUE7y7DtfRkHqB6+joCZO95jPNixXLMbpqpM9ZylxNMxI/zFyzOp+M1mrT8CBrpwgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757419958; c=relaxed/simple;
	bh=UMuLi+2sTu67SCflOdJc4PIQVaIvN944yy3ZwdMulbA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=crfh7z+atFGbrAqAGLrwpnO2E5TygviLnU/IkpXvRQuGLABEojizRvex0bGP4F4ljdHT2hMyXzW0cRRd4PaB/454ujA++AsoQ9bcM1WKlaAriJevmi07hlqnKv4n7Nf+AYfKpQhtFk2JzWYZiZ/oekSMq7ee+2s61UaKhgcIapQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJuzQKxs; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJuzQKxs"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-411498d92deso5886245ab.1
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 09 Sep 2025 05:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757419955; x=1758024755; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkBEP56Uel40DX62RGXYLGaihWp1S3NRQH+BuVUs8SU=;
        b=LJuzQKxsjqtwFdtXZ4czoIl/fMp0H1WON/xR9A929IilKIz9eyCqipNGzDpg4XIAQs
         coh0ctORb5L3aNbLTcPR0g46su+ZVjo+siRyE1LQtp8Z3Y385tqdSpJEZPoDIDvz9O5J
         FDCnpBjjZELLL2heQfbMCu2CrCsbSDt6XKecWqpX7vZwO79PGINKmc1/p+rXw+agm+do
         V+P82DZcr4WsbURJTc8scToh6d79szvTuCTbqcTcv5T+Nbu0Ar06Ns5V3/U9bj1OueqH
         tKAWX6t5YRRJHLm9xThBZV3GkQ1qIl98OFKHWQT9lbF17CUQUY+z8bggIl4z81e4TAhC
         zzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757419955; x=1758024755;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkBEP56Uel40DX62RGXYLGaihWp1S3NRQH+BuVUs8SU=;
        b=ZASiP2p4s5r9aeZiBzWzW5NA5fnkJc2XC6yaf7OU6TPGKY4LKn4lPc53y3AwRPLIBP
         +DVLgp1yGgZRqnBulKpVmG5ORrC4D7y9vAcAyS9QwGakSmrqcs/8ivGoOZw+WI6LHg9z
         ae58G/d74uCH//LphBhN2bnToX2HAY6L9F8//w1lvBHbmbMgVpKMYVLOoFUon5mzClKz
         SdKP5YjrHKUvamMZ3j52WccfB1sqhLALeOBLseoYB49v9t99qoiE9hKGYP8UsMhEknta
         8YigLPMg1fIjCyf+pEFl7Tvt1PC1Kf1Z6sCfFMMLSy4ljaE3XhKaPni0oxhXQqmnkn2s
         tpkg==
X-Forwarded-Encrypted: i=1; AJvYcCUxZxXv2GyvGHs2d8N5TvRTLJdmrYNnndkbxEmcS57aMO3/R/MKg5/5sYVxftpyWC09gtYXXv0oFCjjfExqwb//NH3ijw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw4D5dI/1b3B//uQu/fRIMvpeZWaBSUsAt6d31Snc8hTkOh9Ury
	lYKo2Gg7NMv6YoCeIgUFEv88nC9DcqgsdtZ1oeTZqHvfX+n6uc0/eIglFVKtLd85+Ba3RLc7WD/
	h5vaN695OW1UbyG50WLn451YcnzfvwJU=
X-Gm-Gg: ASbGnctMgPSRbOmEzjAsv1o/3O2/CcbVRpWB8RKvmFwLfCHhH5wC5AnklIRHdsHArwM
	NAfZhCgGNI30Gnl/z65NKjrP5srvnwPF0dcUnWIiUqIwLjAQ9FbK82NvecOUoO/w2XjjH+G1oe2
	KcLvm9LKy+YZoxsxj5H65MpGMCTeKYGaBi4G7MPH4nrMl/ibIgmoYW6T3c/IkZ/xis9iUL16yPO
	pZybg==
X-Google-Smtp-Source: AGHT+IHttMERFW0A/KHZaBTOGR8TX/BI3COHvJIGooI6xnbMAbIF1hB7QCYj6I7hnqG3mC5gXf0qcw8Her+804dvKeo=
X-Received: by 2002:a05:6e02:2701:b0:409:58ec:2491 with SMTP id
 e9e14a558f8ab-40958ec2739mr74890145ab.7.1757419955264; Tue, 09 Sep 2025
 05:12:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250908070124.2647038-1-rk0006818@gmail.com> <87tt1djtot.fsf@bootlin.com>
 <93578759.11447.1757322260340.JavaMail.zimbra@nod.at> <mafs08qinn92v.fsf@kernel.org>
In-Reply-To: <mafs08qinn92v.fsf@kernel.org>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Tue, 9 Sep 2025 17:42:23 +0530
X-Gm-Features: Ac12FXzyioeKzeThxh8TxpOTJ5aYFfR6XxhutZ-VkjdtOnAXx2DXjKhkM9XUvkQ
Message-ID: <CAKY2RybqkE74EADTPnCUHAXpJLJmM9skPXQ6S3UOq8TK_y9EQA@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: sm_ftl: replace strncpy with memcpy
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, linux-kernel-mentees@lists.linux.dev, 
	Shuah Khan <skhan@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

Thanks a lot for the detailed feedback on my patch. I understand now
that this change does not add much value, and I=E2=80=99ll keep your points=
 in
mind for future contributions. I really appreciate the guidance.

Best,
Rahul

On Tue, Sep 9, 2025 at 5:15=E2=80=AFPM Pratyush Yadav <pratyush@kernel.org>=
 wrote:
>
> On Mon, Sep 08 2025, Richard Weinberger wrote:
>
> > ----- Urspr=C3=BCngliche Mail -----
> >> Von: "Miquel Raynal" <miquel.raynal@bootlin.com>
> >> An: "Rahul Kumar" <rk0006818@gmail.com>
> >>> -   strncpy(buf, sm_attr->data, sm_attr->len);
> >>> -   return sm_attr->len;
> >>> +   memcpy(buf, sm_attr->data, sm_attr->len);
> >>> +   buf[sm_attr->len] =3D '\0';
> >>> +   return sm_attr->len + 1;
> >>
> >> Are we sure the buffer is always sm_attr->len + 1 long?
>
> Yeah, that was what I was wondering on the original patch too. Poking
> around the code, I see in dev_attr_show() that:
>
>         if (dev_attr->show)
>                 ret =3D dev_attr->show(dev, dev_attr, buf);
>         if (ret >=3D (ssize_t)PAGE_SIZE) {
>                 printk("dev_attr_show: %pS returned bad count\n",
>                                 dev_attr->show);
>         }
>
> So I suppose the buffer is PAGE_SIZE long, though the show() API is
> kinda poor for not reporting the size explicitly. If we do really want
> to make this safer, I suppose this is what should be checked for. The
> strncpy with length being limited to the string length instead of buffer
> length is completely useless.
>
> Anyway, here sm_attr->data is (SM_SMALL_PAGE - SM_CIS_VENDOR_OFFSET + 1)
> bytes long, which should add up to 168 bytes, which is perfectly safe to
> just copy.
>
> >
> > Can we please just stop messing with perfectly fine code?
> > I'm sick of the war on string functions.
> > First we had to replace everything with strncpy(), then strlcpy(),
> > then strscpy(), ...
>
> I had a similar reaction initally too. But TBH if the patch made the
> code actually safer I reckon it would be fine. Long term, these kind of
> things can help prevent unexpected bugs. But here we don't even know how
> large buf is so there is no point in using any of the fancy string
> functions. A plain strcpy(buf, str) is just as "safe" as a
> strncpy(buf, str, strlen(str)), or any other fancy variation.
>
> So yeah, I don't think this patch does much...
>
> That said, Rahul you seem like a new contributor. I would say don't be
> too discouraged. Not every patch ends up going through. I have had my
> fair share of rejected patches. Take this as a learning and keep looking
> for other improvements :-)
>
> >
> > Don't get me wrong, I'm all for hardening code paths where
> > strings are arbitrary input, but in many of these cases all strings
> > are no input or already sanitized.
>
> --
> Regards,
> Pratyush Yadav
