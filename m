Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CD12309BE
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 20:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763496062; cv=none; b=I+VBIkUvs6jwF1hFjjHFMt0dIYfxtBbbGuMNNET6w0GsnEEvf/C6a9N3qmJ04XPg0AzmIbicoQgEzwNhRJbszaLCbRHX0KcM5OC46DrB5OpfGbxhTL0SwlJPL9PmYBo/06kTWsfNARb/w5WCy0L8xpqR0YiPzGFJjDrmngRtnS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763496062; c=relaxed/simple;
	bh=bxwZkyXgJK1eG2OMsfD30BKE+5u9fMN89vG41h1E+5s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h+LRt8AHZ2hPl/85qtwF0+1c8t7ofWAiCuTuZj8QHLZcvzYAyKadlWbf1k+0VArbGvEq2qU0T0vfp+rPuRsm3uR+XG9GFdrocD71tVezP3FKU7twXaz9SKCpbhVBFI/fZuhvFY0KdXyDju1H4StP3Z45ls7Xuu3Rdp9otAgSnWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eld8fGpF; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eld8fGpF"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-8823dfa84c5so65438476d6.3
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 18 Nov 2025 12:00:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763496059; x=1764100859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SB7FwqNIKbZ7R+GS+j9DGZBpb2NO6ssSsIVjR5I+uyA=;
        b=eld8fGpFCuQMdsKGOnuzhwleug9Hq0gBBuWHmBgjiRUelcpLrgS5MHzMEiGFFxVAfP
         kF3hSwiXUBte/mlQeUxG2xZOYA4LSVgmO6mzIO6IsUnaLyFDpzwWC0Ckcnx6naI5B2Ge
         eb8fLKqOZu2g5Ox8sX8C0D1WuCwwMOGgYCnVvgoleT4tJzklJ7Dq6w/tX4cnveNE/lZF
         QbxUvBx6QswBNxL9EOc3rzm/v0wyFTI9ZbwM3WAwWUPFtFHqgXuzO3tj1If6nh7Z1u5I
         EwJV7hAwjluWpxWS7u1pocIc0YOg9DY6VU9APECpYR5Ptwx2v5iYDcWkxhKK/5EI9Kff
         wjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763496059; x=1764100859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SB7FwqNIKbZ7R+GS+j9DGZBpb2NO6ssSsIVjR5I+uyA=;
        b=P0IZFZ3RTHxzpk64gAWlkBNomhFtduq6vve4kRpbEu6Hn+e2lxJInGtD+eYYhd+aWd
         U78MfMwkimmSsaxezL43ISgrpm9Tp80x/E3sa0vfO82JxbFyYX3SMhBmy5RDX0DPf7dW
         xeR1Xo7E1isuHotygQauCb1lxYRyXTllGfgyPsvvgPAZS2/VnA57oIDjw/gx96159kjp
         rWWxoWYiS377wAmSVkvD9+JZxkTIyYNvFZ5tgKKUW26OfrNgETiwJYTMIUqoQv3YL1k7
         5WSBFVGaU0Q3IybdADvWySi3VYuMYPUi609a4KkTo0YrhV0L7aTo/7BpS73oN/w/5KZt
         AWBg==
X-Forwarded-Encrypted: i=1; AJvYcCWgnlwvignaijdUm2w7/xkpKKefdfx9j82KD0bSXB5VVuf8nvwwRZE71N0VtVhzlnPtX9mnKXJOb8V5bj8ZK/gW7Nhg2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwO8X6hiCAwOjx7JTd9RBsYa6Bd8k968B+MArkgEyrH3zXGvpdV
	zBYT/hyeMr2C1u98YpyP/rxQmhZF9bwYG0xVyNB0koJ1PW0GiYh78AK6OPRRthWHR8vthqb2SHx
	cUUqgPUgynn8E4CgQzj0NilQ03BTACqo=
X-Gm-Gg: ASbGncv4CN8SXRYwheD/GWYgSy8xRxzs5CgFb6xBnKbvZBoQ7Sr46Y1zDMRxRazMmYx
	riUr3MKjqn+HazQ2wXUPEL+hSXLHcOC6EzsCSwIrIrSLuOHAB5kw+xz2inBWjZshog8ZChmGDSW
	SNrw+qtrRT8AYPXy9WvAbx9svt19x1ePOSk6WFVuTfTMtRN9e6vFtvMRSvXXfATHJt5GXEl/jJe
	0UYEoRKy7oi6Ilg9gcVZAQ2B1OTfHJtv85lNN1/GczKa5MsslM8D0yqFacPmRGkTCaB2qWpRKyq
	fjJINhV1qyZ7pIsT1oQoxQxwCkG6Gg7+bBSl6cvvejHiUqEZX1zzpYhIhapVmm8CNAgjDwreelZ
	8nWnykAA04ozNwZdCpfMGhfGl8PqPDf2+RBL/KHNgdw/GxNlvCO6b+wzsIIW399ttxPU2S9XWF2
	kyZhVuMOaqBFcRPWQommk=
X-Google-Smtp-Source: AGHT+IHhfzBJAEcCphFwzomj2W7zGvOCPeFDhl/lHKkpj3xi16n9G+ByWNLrLHv/3vIAjtNEDflU7OTWv23wgwwm1Ys=
X-Received: by 2002:a05:6214:cae:b0:882:4901:e960 with SMTP id
 6a1803df08f44-8829262506emr211040446d6.29.1763496058322; Tue, 18 Nov 2025
 12:00:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251118150257.35455-1-ssranevjti@gmail.com>
In-Reply-To: <20251118150257.35455-1-ssranevjti@gmail.com>
From: Steve French <smfrench@gmail.com>
Date: Tue, 18 Nov 2025 14:00:46 -0600
X-Gm-Features: AWmQ_bk518tBwIwq4km9t_okTCnI85hG63NOZgFy5r88Hbvu-haY_fDOfVuyttk
Message-ID: <CAH2r5mu72dDwVfnK1ffAELCa1iWa5b5XXwTY1+7CTsFvTnN7Bw@mail.gmail.com>
Subject: Re: [PATCH] cifs: fix memory leak in smb3_fs_context_parse_param
 error path
To: ssrane_b23@ee.vjti.ac.in
Cc: sfrench@samba.org, pc@manguebit.org, ronniesahlberg@gmail.com, 
	sprasad@microsoft.com, tom@talpey.com, bharathsm@microsoft.com, 
	linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	khalid@kernel.org, syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next pending additional review


On Tue, Nov 18, 2025 at 9:08=E2=80=AFAM <ssrane_b23@ee.vjti.ac.in> wrote:
>
> From: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
>
> Add proper cleanup of ctx->source and fc->source to the
> cifs_parse_mount_err error handler. This ensures that memory allocated
> for the source strings is correctly freed on all error paths, matching
> the cleanup already performed in the success path by
> smb3_cleanup_fs_context_contents().
> Pointers are also set to NULL after freeing to prevent potential
> double-free issues.
>
> This change fixes a memory leak originally detected by syzbot. The
> leak occurred when processing Opt_source mount options if an error
> happened after ctx->source and fc->source were successfully
> allocated but before the function completed.
>
> The specific leak sequence was:
> 1. ctx->source =3D smb3_fs_context_fullpath(ctx, '/') allocates memory
> 2. fc->source =3D kstrdup(ctx->source, GFP_KERNEL) allocates more memory
> 3. A subsequent error jumps to cifs_parse_mount_err
> 4. The old error handler freed passwords but not the source strings,
> causing the memory to leak.
>
> This issue was not addressed by commit e8c73eb7db0a ("cifs: client:
> fix memory leak in smb3_fs_context_parse_param"), which only fixed
> leaks from repeated fsconfig() calls but not this error path.
>
> Reported-by: syzbot+87be6809ed9bf6d718e3@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3D87be6809ed9bf6d718e3
> Fixes: 24e0a1eff9e2 ("cifs: switch to new mount api")
> Signed-off-by: Shaurya Rane <ssrane_b23@ee.vjti.ac.in>
> ---
>  fs/smb/client/fs_context.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
> index 0f894d09157b..975f1fa153fd 100644
> --- a/fs/smb/client/fs_context.c
> +++ b/fs/smb/client/fs_context.c
> @@ -1834,6 +1834,12 @@ static int smb3_fs_context_parse_param(struct fs_c=
ontext *fc,
>         ctx->password =3D NULL;
>         kfree_sensitive(ctx->password2);
>         ctx->password2 =3D NULL;
> +       kfree(ctx->source);
> +       ctx->source =3D NULL;
> +       if (fc) {
> +               kfree(fc->source);
> +               fc->source =3D NULL;
> +       }
>         return -EINVAL;
>  }
>
> --
> 2.34.1
>
>


--=20
Thanks,

Steve
