Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2C1192580
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 17:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752773133; cv=none; b=rYTOfHPzmvM8tPrP6IzAEIjGrZEm1+kTco4207YdhfCg3uazmEXmzJUvr/rSxHCsHSc+Lr27uKplRSeydfeEScZ261AKvvX45SuA2o9MauP/Olu/aY8onoVG1T140valvoLel0KKx6rTktxNOSB+P2S0lGPzm6LZHYSwKmCxGT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752773133; c=relaxed/simple;
	bh=FHZgRD2EXHypECk3pwgEZ8+Bh5htm8l/IdmFuPwgm6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jN2M7PT1P9GJc0ox8NLcMfcRqQoBNE69kh7lCqXMILBn728OzT6ef1FNBL3HXg06NTTMXCmkbbAjYSv2bOn8C6717Y0qoTzdOKs45Y47gYDL2/qNcUQFnoVMR7nTNMB1mf4hKhKGTucOqm1Fp8SjqAovoZYAA/AEq+NblDSaIXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2+luoC1; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2+luoC1"
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-60402c94319so538983eaf.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 17 Jul 2025 10:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752773131; x=1753377931; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKUAsFn+BYvl4QRv6W+0B4YT2et3vNZIFHPMajMeuYM=;
        b=e2+luoC1pOAcP8OL+z5GwR3rntV/PtIUsPTrypbujKiJsAvizVK4rPVbhtm6yhzt6O
         zsHMbnLYb6YQSJ0j4Khvkti3lHkZUBu4NTq++iNnCw9ibL2WUWzCR35gtJsERH9mZ6b2
         8JkvO8zNNQxwhgXvvMSF3HRPyL4C8lNeBrVTfSExbsCU8in0RlX3/ngdKF/FpKGfd7OB
         kFkePva17SQIGUICSCtXhHsOUx9RoBFjkArefGu74HF9Fh+mVL74BUZvpDtbeiOpp18+
         cmExybvE3JnxHTT7REQKsRsweD3bGk3t6NITdzLhtUY8uMuPtB+Dq++UgUz5X71HwEvW
         P48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773131; x=1753377931;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKUAsFn+BYvl4QRv6W+0B4YT2et3vNZIFHPMajMeuYM=;
        b=RWdB+G/DZarrbF2zYQOSNOFbg8BjN8uGXPiB7VqX851ga6QLOZwOUpLurBynMMq9cf
         iXol90Ph87LzAwIaUr1pGlnOXTEd8B38N0YKJY8FHv4hOE6VvKMA+ZvtPxCzT6pazPWN
         7C/niMx37Ds1KrsC7B3GdhLyiWuaEy/6UIxBl7IrZkDv0a9ntQZ58FO3VCfhcZKb1DOn
         rLdHmcy1KylEYgb2Z4W1XllP+hJ3d5D2RN2rvm14l0Kqf7pGnXw25c2LQCakX22YznoA
         Kw1eV39O1nt3oZJkC8qpgHi/EG/V1MmATdhGVY9r7OZAyfnXJO1gMXWoY0IsoEYmgMSo
         X9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhoBHTpdSQ2pZ001fMT5rGDDbnzmT2Qm+boNjwbuQFKKJ9FafgY/31zC3RyRMbifqeEnDMy9GyFt4H6NjPtbqCweyBzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Vlje+O9Hs7xzxBP3xu/NJSC6EUsTBBPyp4dF5twlXKIaewFz
	PokBmKVEbW0T0Syhj8p3vJ1uWFWnh96vhvb655MEJAytHuvYr/2XZy5SLC/1KGpysGKsRFv+2T6
	HJY+n6X0i8LQqdF5dO7eFU/TUOJAproU=
X-Gm-Gg: ASbGncvk4Z+ZyAhvKc3XvecXV3euRmsHyV8SvHKJEU0aRbOlTUlm3I38+oeZf6W1dcZ
	Oq9hD/GGngGcOhOCBXb8Wb1WBTo1aMhF4MAVPQNQW3hL2DnhsC4Z+dsZ/fe9RnZutUmStckLHsA
	20+JL08KDYLXxoZdnFFqDbQldfHi+0WPejUJ743PbnynyVMUdwqUNTQVugPjzrPApOQ/30nq2xU
	CRYjLYgUD7k0vfgsyI=
X-Google-Smtp-Source: AGHT+IFV3LJemzAq2naa5xnK/QNurVq5M/iO8tvRMpRLLz6WN5u9FanyUc/XuoKYnP3llvLeMkfTFWXDD3gwJGr/r1M=
X-Received: by 2002:a05:6870:71ce:b0:2e9:95cc:b855 with SMTP id
 586e51a60fabf-2ffaf5a15d7mr6374088fac.34.1752773131235; Thu, 17 Jul 2025
 10:25:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250717115936.7025-1-suchitkarunakaran@gmail.com> <CAEf4BzZ+OTkaXmtWPbOGB0OWz5xmj-d06UWchooO+iUyDHar4g@mail.gmail.com>
In-Reply-To: <CAEf4BzZ+OTkaXmtWPbOGB0OWz5xmj-d06UWchooO+iUyDHar4g@mail.gmail.com>
From: Suchit K <suchitkarunakaran@gmail.com>
Date: Thu, 17 Jul 2025 22:55:20 +0530
X-Gm-Features: Ac12FXzHUYvB11EN96RJ87w4mJ-AVBHzefF2DLUAQSIjyLEeP8_edkErqdrKA6Y
Message-ID: <CAO9wTFjZwOcpaSSJJu_khQ=hCdiiQwuVm-=zOAdTr04gbaa45w@mail.gmail.com>
Subject: Re: [PATCH] libbpf: Replace strcpy() with memcpy() in bpf_object__new()
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bpf@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Jul 2025 at 22:49, Andrii Nakryiko <andrii.nakryiko@gmail.com> w=
rote:
>
> On Thu, Jul 17, 2025 at 4:59=E2=80=AFAM Suchit Karunakaran
> <suchitkarunakaran@gmail.com> wrote:
> >
> > Replace the unsafe strcpy() call with memcpy() when copying the path
> > into the bpf_object structure. Since the memory is pre-allocated to
> > exactly strlen(path) + 1 bytes and the length is already known, memcpy(=
)
> > is safer than strcpy().
> >
> > Signed-off-by: Suchit Karunakaran <suchitkarunakaran@gmail.com>
> > ---
> >  tools/lib/bpf/libbpf.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/tools/lib/bpf/libbpf.c b/tools/lib/bpf/libbpf.c
> > index 52e353368f58..279f226dd965 100644
> > --- a/tools/lib/bpf/libbpf.c
> > +++ b/tools/lib/bpf/libbpf.c
> > @@ -1495,7 +1495,7 @@ static struct bpf_object *bpf_object__new(const c=
har *path,
> >                 return ERR_PTR(-ENOMEM);
> >         }
> >
> > -       strcpy(obj->path, path);
> > +       memcpy(obj->path, path, strlen(path) + 1);
>
>
> This is user-space libbpf code, where the API contract mandates that
> the path argument is a well-formed zero-terminated C string. Plus, if
> you look at the few lines above, we allocate just enough space to fit
> the entire contents of the string without truncation.
>
> In other words, there is nothing to fix or improve here.
>
> pw-bot: cr
>

That makes sense, strcpy() is indeed safe here. Thanks for the clarificatio=
n.
