Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1E12E2847
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761033733; cv=none; b=MBtT0A9IZsMtrvvMCgML+sZ+vikcNiN7Ox4n3nT/FvPB6/2zP4/tzg7SJ6GkAhSozIs83V9ejDVjg88XLrZwNy4nBqp18dIOiRDDy9/raZbUvHkWiCdQrL1KC8NLOO6t1KCWBARxaM5Ex0kAvsnRIofynflaJHtIqcvtr+YGu9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761033733; c=relaxed/simple;
	bh=i+m3PusaxM6Zgin3C3En/lGk4W/S63Hvd6XwDnbd7Ug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zz+ZnO0QX1JpXVzPnjKr1Qx1J8BrcMT0TQdlpzW1ChQADWEbO+N7odkldh6B6nm1+KKUhPnatZdWT/QmyQUPbLS8f/kK9SHhZYGms12GMgGKxMB6u/Sfm0oNHgPEOXlvL5wQxd6nbqobXgETF2ZKQVcDZNgtYHZevTdheO5V33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=TYuHOqdD; arc=none smtp.client-ip=140.211.166.133
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="TYuHOqdD"
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BCBEA40527
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 08:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.089
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35-cPPvJ76sX for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 21 Oct 2025 08:02:11 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com; envelope-from=jinpu.wang@ionos.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C867A403B2
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C867A403B2
Authentication-Results: smtp2.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=TYuHOqdD
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
	by smtp2.osuosl.org (Postfix) with ESMTPS id C867A403B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 08:02:10 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b484b15e72bso123115166b.1
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 21 Oct 2025 01:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1761033729; x=1761638529; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0VWPqCHv6+ZQuDCTFQQ2tUl50NtMLOJ2aVBSBufBxc=;
        b=TYuHOqdDRZSFfYXm5hJtqdhB15hM2sEA3ljKKsVuWThM9g36mrtAZDLKygom32B9c+
         xyMlooxlr8Wht/NPuE7gE4EmuWtB1zltcIjgkUtFtyhlguPfwvucRataT1LjOmFFa7HJ
         iCdw7w54ZoIOB7jsmd33FmVm7TdlcEDFh8Hk0YBWVJXbV3rnlLOQUfk9Z2lWXc5xUNo0
         6J0sKIJSVF6CXm+GWQn2UCfG1S29wyX2Qb9psR39/G1x5yhJudsiBV9IAcIS4RYgx96p
         dMR0uYsUTGhcl/SZbcLJ7lnD3qDFs0AZ0sNyBmSXpkzhhSEPzWXPpHTTEtA+xvx6sKgF
         eAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033729; x=1761638529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0VWPqCHv6+ZQuDCTFQQ2tUl50NtMLOJ2aVBSBufBxc=;
        b=rqLV/WefM2r5ODQhkzu1xrZIqWUH/zAOjkQlfKphSvxPnpj8SAb2IYeCLSaRx7Uoj6
         fJi0YbCAmPhtInll+W+PyOenQD/o3RqrzVskzoYG8wuI33n0W1mnEUVOMU87jTqvRF6j
         EWDw3rFQ85dTPUcH2sXZnjOqKuK2hsXk3iWm/Vudstn+lKlrzYBPuxC+7Lu65kLbGFPy
         ZhtxAzLwoXAjYt0DNS/cwnBkLmocr2oIF5WI+UerKrhAQW1+RfoELzdC9Tu5QdCHXrif
         PXpCCaZvTQ1PFktk9GYGynhg4iCjFHjhZnd2c7HYF8Es2qBnlgBOisda9vLh5l0SPuvv
         Cgjg==
X-Forwarded-Encrypted: i=1; AJvYcCWQqGKL1PiVK9i1MA9ZXzSqJXqa4+5/T6gtD68LA70L653M3wZe8zRsaMbZm2kpy0gGJ5NjC1vC7NF204kJlhJwW8k7Bw==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YyTP19I/uOladZnp7wLG0j5mN7gb8EjhKgUR2rPy+wuCs9EmItD
	Mex+8RkuVnT8dxq4NYt1eM/QQbX3lGjWaQXLdtYPc2XCA1dzsAZKfG4BW3eIWKSt6fKAFkgAJO8
	CDz8WGtwveaZ2UOVSBdIMWpP6/9wU3paLRNBOfFdMMA==
X-Gm-Gg: ASbGnct4ZYXZEs9N24TRyO4wgiXjiyBP+aLIgpweBsZ9V1UCYwEiz3yOPuSXmEI2Mod
	qy2CZs/8YpDggHJnTxC3X2Y+MdbPdLgbigHwphdvSkgiDLS1VA8W/dkiBaBdTt3mLcaMyN+yK7+
	wKr+BcMwYDkcsYoqCpFDISjCCXnVbcV1EiFAPByUJHrIkqHLCbClk/2Kz1zV/schTMqBsusm5gn
	fVzHvF39SHyvpwwO0f8PtMJmPKV6Len4MrTCzZ0DvG8yP7nQEHgi4APGFoo
X-Google-Smtp-Source: AGHT+IEQfgvHZuihlbBSJlVb+dcEnjFV14dIS2e3QeU28hCgVySmEX3k7+tkYGmNfEgLKxBR2Hkp3zdbZ2HHX0oRDVA=
X-Received: by 2002:a05:6402:2115:b0:638:e8af:35c7 with SMTP id
 4fb4d7f45d1cf-63d16af7935mr1354397a12.2.1761033728661; Tue, 21 Oct 2025
 01:02:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251021-rnbd_fix-v1-1-71559ee26e2b@gmail.com>
In-Reply-To: <20251021-rnbd_fix-v1-1-71559ee26e2b@gmail.com>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Tue, 21 Oct 2025 10:01:57 +0200
X-Gm-Features: AS18NWAjr1vMpIROYlrNqm-3ej7s5Tkh074kVV9erysvDSTuNEiz5Pc19hwQJzo
Message-ID: <CAMGffEmsJjeqW8DGnKapVyM0Gporn_UuDB2xNosRmD2GduGgzg@mail.gmail.com>
Subject: Re: [PATCH] drivers: block: rnbd: Handle generic ERR_PTR returns
 safely in find_and_get_or_create_sess()
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: "Md. Haris Iqbal" <haris.iqbal@ionos.com>, Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	david.hunter.linux@gmail.com, khalid@kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 8:21=E2=80=AFAM Ranganath V N <vnranganath.20@gmail=
.com> wrote:
>
> Fix the issue detected by the smatch tool.
> drivers/block/rnbd/rnbd-clt.c:1241 find_and_get_or_create_sess()
> error: 'sess' dereferencing possible ERR_PTR()
>
> find_and_get_or_create_sess() only checks for ERR_PTR(-ENOMEM) after
> calling find_or_create_sess(). In other encoded failures, the code
> may dereference the error pointer when accessing sess->nr_poll_queues,
> resulting ina kernel oops.
>
> By preserving the existing -ENOMEM behaviour and log unexpected
> errors to assist in debugging. This change eliminates a potential
> invalid pointer dereference without altering the function's logic
> or intenet.
>
> Tested by compiling using smatch tool.
Thx for the patch.
But I read the code again, find_or_create_sess -> alloc_sess, which
only return ERR_PTR(-ENOMEM) or a valid pointer.
I think this is just a false positive.
>
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
> ---
>  drivers/block/rnbd/rnbd-clt.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/block/rnbd/rnbd-clt.c b/drivers/block/rnbd/rnbd-clt.=
c
> index f1409e54010a..57ca694210b9 100644
> --- a/drivers/block/rnbd/rnbd-clt.c
> +++ b/drivers/block/rnbd/rnbd-clt.c
> @@ -1236,9 +1236,14 @@ find_and_get_or_create_sess(const char *sessname,
>         struct rtrs_clt_ops rtrs_ops;
>
>         sess =3D find_or_create_sess(sessname, &first);
> -       if (sess =3D=3D ERR_PTR(-ENOMEM)) {
> -               return ERR_PTR(-ENOMEM);
> -       } else if ((nr_poll_queues && !first) ||  (!nr_poll_queues && ses=
s->nr_poll_queues)) {
> +       if (IS_ERR(sess)) {
> +               err =3D PTR_ERR(sess);
> +               if (err !=3D -ENOMEM)
> +                       pr_warn("rndb: find_or_create_sess(%s) failed wit=
h %d\n",
> +                               sessname, err);
> +               return ERR_PTR(err);
> +       }
> +       if ((nr_poll_queues && !first) ||  (!nr_poll_queues && sess->nr_p=
oll_queues)) {
>                 /*
>                  * A device MUST have its own session to use the polling-=
mode.
>                  * It must fail to map new device with the same session.
>
> ---
> base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
> change-id: 20251021-rnbd_fix-9b478fb52403
>
> Best regards,
> --
> Ranganath V N <vnranganath.20@gmail.com>
>
