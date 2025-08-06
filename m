Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8376292B3F
	for <linux-kernel-mentees@lists.linux.dev>; Wed,  6 Aug 2025 15:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754495166; cv=none; b=VbIukezzBR5QFk1EBFog/y0oiQuvCt6qbAyT1+EGAdNwQDiYX1EjdKmm9e2B360Alh7tC0b1LS8EG/Zn1/l+GANXUqYRS7/phLo4wxexnMaG4a7dzSKHMWDsYgYlKe5h/Cb/Zr5RSgJacDLmYpLIi88Rt3ubYb8fh8QQErv9SOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754495166; c=relaxed/simple;
	bh=jmUH1JzYQAfaDnXZLVWzBEI4r9jrLU/kenC5OLCdEOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Isl3PdDc4I2AnYOpa8tetScqIAAkh8UJN/FdAv/KVJeGlRj3+29VhTvUJllVAci0GOuJv81sa6b+koX+1Fh/b3ujq6xgRAXBkowscZfUw4tUbe0bwtOZN3C350YELWqvpNNxBhx4vDT7Eq69Nhv8aB3DbryV1sFuafsJ0xRPkic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XyXen3Sw; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XyXen3Sw"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55b978c61acso3639e87.2
        for <linux-kernel-mentees@lists.linux.dev>; Wed, 06 Aug 2025 08:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754495163; x=1755099963; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zmrMmlSKNc8Wry1y8dWX27pKFPjQrw0O9VLnGzkRYw=;
        b=XyXen3SwQLGztt3rzUH0NrWUSG6FJ/HUvrhceG7FQnx5vLzHcCHDjNc2pe3mydCJCm
         GdwPJ2HEcv0KpRP0wCZ1bFDOSDDvlQRJPbTNHFvzrAzzIVSJ0wBL/Xlc+VzmFouz4oxk
         Ezr/uyDZXwRgTq9I2z1mFuTnQurt0vZeeKX/s4i6LVxIlUkTJTfZ2iQY2PbjOeCjk/C0
         UmNOUNHOp+m9VzKvy2LHCAEgw0ojcN4iOBmIwT1WQkbHBhOkMqtptMxAM1NHwcRE/eXF
         4bY9teeB1ZM9isse6uCx3SxGVPsc2b//BFkvH/MuncA7FRzCoPM22D8zQ1x2q9Dm2MRV
         tslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754495163; x=1755099963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zmrMmlSKNc8Wry1y8dWX27pKFPjQrw0O9VLnGzkRYw=;
        b=YmGWLIWrNJBaoXgCKYtKFLZR2yilBfOQKVLx9Pv8ZpFptlMhdGH4X4gRzyJsogUFof
         ETCkJh+TMEX0jgIk8oEsVqpLoh0dgDz9c1Xg6rXd6e45BPGGsm11/Xi/DJDDHDXzB+P2
         ptAEgYP87iiLR+IvxO1p1yl7gSsEWwuE1vW5QLB2NI0pvnKsubO002KruYm/8KEjJA+r
         MdCeD/joZd7pyGGG282eleJk6/OBoVh6B54DJO2J5a9cwQy3YUMz1AKpMtiCoBM8kdF+
         QZBUP3T5Eti464hgwU2r//Mi4n/Yql3+cHw3A1nJrtgae4zIpjIrQLK+kalBv1Qz7glc
         lnHw==
X-Gm-Message-State: AOJu0YzCGLq5g0IPNcq0Mr2U7uPYYLdt2tkhKbqCmd5rFghXHNhR8Vls
	OU/OkCoh4YzkPhi1mgG5BjdEafd7BXpuUNdIviNoOfIsAaCA7q6DbO4ONi2eNa0W3A9v/88vxOx
	6cUriLiGNxqiDlX82FCEXCvZ/3aqkJE3feWqIWRU=
X-Gm-Gg: ASbGncvyMtpBzE3nh57zr9OyPYzy79lcj+0SOOnpywnpxQ4nW4nvJFU7WGHkL2O+3KM
	7dRuhdH7+ATsrc1oh9YVIZFRxMkNua6mnpY8MmTORBj5r6gjJhz2OtoafFjRAEkg0OfCxboloK/
	zSBbVt8wywLjag7YwVc5o9J51yDQTkmUUlcO8laOi42o5haQ3c6MeJqJmOjp92XA7hEV7AC/U8g
	/L2a8LJrI7l/TIZOf1diOu240JQGCzKnzU6WzdZhg==
X-Google-Smtp-Source: AGHT+IGXosmjvzExQ3C4RK78Mcex7Mn1Uk/h0JUj5QUxdn/C6gvDfKT6OI5wS9vLx2H97RSvkUJIJkgfNFNXTPXKb0g=
X-Received: by 2002:a05:6512:118a:b0:55b:82b8:c2f3 with SMTP id
 2adb3069b0e04-55caf5f82b4mr1212425e87.43.1754495162686; Wed, 06 Aug 2025
 08:46:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250730142301.6754-1-pranav.tyagi03@gmail.com>
In-Reply-To: <20250730142301.6754-1-pranav.tyagi03@gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Wed, 6 Aug 2025 21:15:50 +0530
X-Gm-Features: Ac12FXyNkNIXJt8LjQHrVLUgBnSRkW0iOHvQddA77ExTJZswxw6Wx4O4SJ98_zE
Message-ID: <CAH4c4jJ8VywRUfn2z8HnA73vNxviZ53DZttcR3JaPULF3JFkQA@mail.gmail.com>
Subject: Re: [PATCH] selftests/mm: use __auto_type in swap() macro
To: akpm@linux-foundation.org, peterx@redhat.com, shuah@kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 30, 2025 at 7:53=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail.=
com> wrote:
>
> Replace typeof() with __auto_type in the swap() macro in uffd-stress.c.
> __auto_type was introduced in GCC 4.9 and reduces the compile time for
> all compilers. No functional changes intended.
>
> Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> ---
>  tools/testing/selftests/mm/uffd-stress.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/mm/uffd-stress.c b/tools/testing/sel=
ftests/mm/uffd-stress.c
> index 40af7f67c407..c0f64df5085c 100644
> --- a/tools/testing/selftests/mm/uffd-stress.c
> +++ b/tools/testing/selftests/mm/uffd-stress.c
> @@ -51,7 +51,7 @@ static char *zeropage;
>  pthread_attr_t attr;
>
>  #define swap(a, b) \
> -       do { typeof(a) __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } while=
 (0)
> +       do { __auto_type __tmp =3D (a); (a) =3D (b); (b) =3D __tmp; } whi=
le (0)
>
>  const char *examples =3D
>         "# Run anonymous memory test on 100MiB region with 99999 bounces:=
\n"
> --
> 2.49.0
>

Hi,

Just a gentle follow-up on this cleanup patch. From what I could find,
this is the only use of
typeof() left in the mm selftests, so this should be the only instance
needing this change.

Thanks for considering!

Regards
Pranav Tyagi
