Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD942BE114
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152371; cv=none; b=PU3bkZGRpm2VBg3odapZ0uK8tlSMDUV9txQ5h2Nopeb6T3q/36+HuM0sWqcQrj+gEd2EBdrLzrPa2R19BIx96JUraFuu3jP5efJip4VUq1jgajMMESgZReByOSMmejojaHui9ZDs+itqZuWgbB85UWm0rAY5fuxAlhyK1RukX+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152371; c=relaxed/simple;
	bh=CGsMtWh+en1jfB7evlKjwAEgqDWRseR4+nQbwpeNFSs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TWpQbBwfrohY8ge2gRSPbv92V85VUpFRzuHr2oFMo5d1Ger3Hi81Qw4hjR4WiTW/MROvWRzxRdQSx/wQsSaKbPvHFSA5KVin21JsVe+KENAnLT0A7YsntxYw9K4/Eyfjbw+cfIUwuTPw7s+yGjprpDWO1sLDmpckaRS2CZzw64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=djVvf5ba; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="djVvf5ba"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-30aa3980af5so6963048a91.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 13 May 2025 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747152369; x=1747757169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHVqDu2jngC4pA6GXRUzaP3yGa+0ktKZ/g/NBJXtwGs=;
        b=djVvf5baMx1ddlugCN7RZP9El9Ty/pmAGegPPcsIo9QHw0jdGFB/oaUeYZdUKDNuOA
         Jhb63DbRF6tp+ViCcVCLoUs/QPRsqICMvO+uhhIZ+vKpfbiotE317eNIgsN3AusDGNul
         hEqkbfzP667otG6rosWxIsLGNSez6u5iOXKPP1BDoWHgBT43acOYGAQyPORqRQjsj9Zn
         LTJXsVHLz9xfEHDnr9mFP/JutopQ231RH9th99iOraShSmN+e/+x+mv4qkbgmj0dRno/
         Ed54aFI/5aL47c33Nsa7UdiiUXc/4ipXPLj5dNOoJ4B+fbKmupkeVmI0+oaXGx0R7fx+
         /9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747152369; x=1747757169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHVqDu2jngC4pA6GXRUzaP3yGa+0ktKZ/g/NBJXtwGs=;
        b=PqaJRv8QVwSQBgF+C5/5wSz3VQz8DJouqXaN8FdnkuCbcRnZElMmipmCALVHwIsVZ0
         kdMGKaIsFpda7jfmF1/epwnXKsnvCWaQ1w4DgwbDv3c2CDkfyx9SHyAKWpLRoTnZCFaq
         ZocJnWllzpMZNNNyk+YzBLqLJWjskg/sXAKoLNrI8737w/xX7F9dUkYVR7rFFHEb3UGZ
         e6Q4tUhzNCyZ/HKscX4WIG5Ud22PAGPVnmc1y4ALDzfXPThhWELY1/s+VpP702CCR6d/
         ga8sfBgT69jcJmVoKPkTPkVCKvZiaq1mmxT2GVuSWmDOyL4deIc2wq/PCsaLjXCe/9rY
         AA/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVu/sUR91Ol4ncyx0rdYtwaCNxbBBJIZUDfRN6xPPSYbXcHzk9xN59vZ0r0QCJ85DZUA5dQ0D2IKUJy2MmI4ElygqxgYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsNfarXXNyOUefe1LW79b1C87POpyU6fnWoZSyialiyAGWLO88
	/ikjPEu1gU3H9armMG62HdHp3g9mUc3Gm9rHVvE/n2qbg8XBYOaUKsvrklYwqeSSgbrYT8ofEZ9
	SHEkJSYgwVEFAACxqoFK5VUZPCMM=
X-Gm-Gg: ASbGnct2lPa24QIi9C7lPcpFldaqq6WNxouJFOdVe1+my5RQAw6hTPWD5gJVH21rAO4
	V0NeYFbNJvwvcB6t7i/7ewNzgPeWr9F8Ykqk6dRDNHuwoKjm2CUk7VW7mVSJpAL3KuwWGHKdXfd
	s9MT7yLCxSRyWMuqc9eQOp5Mg3mkJEakKD7bKNy56UTBzO9AYn
X-Google-Smtp-Source: AGHT+IHHqlQhuep0Pzh0cX4T275zpKOXukg1oLGUyTS8Dh+y/IZUOCee/gIiBM7WtxGBMugjSaaGxOt1eyFn8M5Co9g=
X-Received: by 2002:a17:90b:38c6:b0:2ee:b2e6:4276 with SMTP id
 98e67ed59e1d1-30e2e62a163mr163721a91.27.1747152368750; Tue, 13 May 2025
 09:06:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250513015901.475207-1-khaledelnaggarlinux@gmail.com>
In-Reply-To: <20250513015901.475207-1-khaledelnaggarlinux@gmail.com>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Tue, 13 May 2025 09:05:56 -0700
X-Gm-Features: AX0GCFuw_2L0dg2ioYzSm6CFUTAyxrdk5bP1SjHoy6KH5Z5Etsu7Qux8CgONlco
Message-ID: <CAEf4BzYVoV7_w0-WxPShYDKWSNXiG92ieLxVPwRZ1W3VoKhmgw@mail.gmail.com>
Subject: Re: [PATCH bpf-next] docs: bpf: fix bullet point formatting warning
To: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net, 
	martin.lau@kernel.org, andrii@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, shuah@kernel.org, tj@kernel.org, 
	kernel-team@meta.com, memxor@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 6:59=E2=80=AFPM Khaled Elnaggar
<khaledelnaggarlinux@gmail.com> wrote:
>
> Fix indentation for a bullet list item in bpf_iterators.rst.
> According to reStructuredText rules, bullet list item bodies must be
> consistently indented relative to the bullet. The indentation of the
> first line after the bullet determines the alignment for the rest of
> the item body.
>
> Reported by smatch:
>   /linux/Documentation/bpf/bpf_iterators.rst:55: WARNING: Bullet list end=
s without a blank line; unexpected unindent. [docutils]
>
> Fixes: 7220eabff8cb ("bpf, docs: document open-coded BPF iterators")
> Signed-off-by: Khaled Elnaggar <khaledelnaggarlinux@gmail.com>
> ---
> Hello, please let me know if you have any comments, thanks!

Thanks for the fix, it makes sense. Applied to bpf-next.

>
> ---
>  Documentation/bpf/bpf_iterators.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/bpf/bpf_iterators.rst b/Documentation/bpf/bpf_=
iterators.rst
> index 8f0a4a91b77a..189e3ec1c6c8 100644
> --- a/Documentation/bpf/bpf_iterators.rst
> +++ b/Documentation/bpf/bpf_iterators.rst
> @@ -52,14 +52,14 @@ a pointer to this `struct bpf_iter_<type>` as the ver=
y first argument.
>
>  Additionally:
>    - Constructor, i.e., `bpf_iter_<type>_new()`, can have arbitrary extra
> -  number of arguments. Return type is not enforced either.
> +    number of arguments. Return type is not enforced either.
>    - Next method, i.e., `bpf_iter_<type>_next()`, has to return a pointer
> -  type and should have exactly one argument: `struct bpf_iter_<type> *`
> -  (const/volatile/restrict and typedefs are ignored).
> +    type and should have exactly one argument: `struct bpf_iter_<type> *=
`
> +    (const/volatile/restrict and typedefs are ignored).
>    - Destructor, i.e., `bpf_iter_<type>_destroy()`, should return void an=
d
> -  should have exactly one argument, similar to the next method.
> +    should have exactly one argument, similar to the next method.
>    - `struct bpf_iter_<type>` size is enforced to be positive and
> -  a multiple of 8 bytes (to fit stack slots correctly).
> +    a multiple of 8 bytes (to fit stack slots correctly).
>
>  Such strictness and consistency allows to build generic helpers abstract=
ing
>  important, but boilerplate, details to be able to use open-coded iterato=
rs
> --
> 2.47.2
>
