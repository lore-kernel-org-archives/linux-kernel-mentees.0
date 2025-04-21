Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDE5C147
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 12:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745238794; cv=none; b=DeLlGX3ZHhZIBXQxerwLZKTDXu4h4UyTWDPyO+mGEWlv50odW8yOQOoZhIMiRYdWb4CsbW9x23c5mcg9oSGVThpCVEEYiFfJwTHkEzQifCvoH2B8LYo5RUeAvkxn/CmS2Q+zJvQaL1e6ab08UmPXlZLm4UgpTGVgnDfN38H+9fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745238794; c=relaxed/simple;
	bh=wqrJORC7kXaeaHHCXjKjEWLJCiYSLyOiCXagiUJd88k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VCnR59qgG6qNL2BE7yxSzd9ZQIa38M+kBctTzPiaruS30uw5Qe4ZdHdUw78zP9tzvqnGS5Y9kUMiMxkUZ7JAU6R6DQsu6Rqvw0+Fk0/CEiRJaXS5FAZ3l76YaOmYY6cs5FyES2O39e8iHyWIy9cDm+xXChT9dyjSVmspoTYmiIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mvS8ABch; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mvS8ABch"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4766631a6a4so43301751cf.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745238792; x=1745843592; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eChZmy5qVC82sBxIFmHOSjXPUbGZooL1QoxWZm005kw=;
        b=mvS8ABchf3IIuE+jNuOhEmU4FkQ78pu5guGs03P8xWRRfEkafimgJNEWASb662qs2E
         k7z85XsETLTvLgSbtoTLRbSxrW5hzl8/ltjLg+aeitdNwsUW0JfSFgpDhcakNcfofg2k
         NUsXRczh6sO4qiNjpYHe9DfPoDnukiSmP1euGkPXXJ5hIWre3r+lSBCJkldgs5mECNHO
         MkKmo6sMDd7RWnDxIrzDiSfeghmkrdxTwxQ5XF2WhroL9IN/Nn3mVTk8b9Zb6gTkCKay
         4FXR2j28SyqBFbi2HDXCKU5kijyyX4tcgMevRB6W+bMgfso+dK+xWs7hQ9g1zrADofHd
         T1Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745238792; x=1745843592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eChZmy5qVC82sBxIFmHOSjXPUbGZooL1QoxWZm005kw=;
        b=l88YJpZffKA0Ewu28XfstApLnNZHweMrRT8hmwbQ+44SjD1gsr6DNCnLC0y7ZWqmb7
         Lx4BahGR84QYhsqwWU/lgpZcFSX+trQZd77xXNearzEgTgOfSyKcqoCaSIq6KzPWaAdD
         fy/5XR5oqfnk89i4/Vcj6Tw4JTTZ1ccFfu+aOsGZolNwrb43M1ZJo4jVxm/IH9T6ajQ0
         AE4QnaB0IKqmW+ApyO9DStl28u8vOhn0gLvr5hTc1AmGuDfIU8LdzwfxT9ytsOhYWYgQ
         8ZNYc3ONAWA/Ma1z+8NJ8aOrWrT5ksugXRDlAWIimP4lvZvO5x5L7vOE0FDZGu4BB69N
         G7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMJVGG31LzrF/jNmsups/rjVE9q9IdvB8HVoU8KVZrtrehuUiarnmfv9MtbRJYJZvtbs0SKtZ/mf0kIBNetcLRIqQ7EQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgQaH+nuZQ1Cwsy2lcQRQAnaF4Cv/YoVAErA28egF64biToeLS
	uq+KkI1WF5ETU3Dik3ZhltB5MdW7KwVmxFAN2daO5oWijM4gQ3aXMBGK5uuoAVFOhQRb00lZ8Zw
	iStkVXCUJwqOc37Vl2js0CsX1CGs=
X-Gm-Gg: ASbGncucpmjIw4RL9z3jqGTSgxrlqQYRA2wympKDMJV5VBvQzAWcqqv4VyK/wrQTqjG
	8W6Fr4C0t7JlBJi+bk605ymm2XIUMieSZEjWlBQitLLBsdrfkZbHS1K28kMYDfsOx07AfLURHwQ
	w+76BS5Gwuwzwqbyt6Ac4R/cu5ymQSV4RlJD3QKixM36CpKFoQNB6sXQ==
X-Google-Smtp-Source: AGHT+IFaaX6+2xHkLcgslU01jFDOcbqs7hltQ40RQ8wzUyG0YQTGtEbDeKrMYngslEzC06BAytv+1r5cQAbAPsNsUq4=
X-Received: by 2002:ac8:5795:0:b0:472:1d98:c6df with SMTP id
 d75a77b69052e-47aec4d23aamr183858731cf.52.1745238791594; Mon, 21 Apr 2025
 05:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421122819.907735-1-gshahrouzi@gmail.com>
In-Reply-To: <20250421122819.907735-1-gshahrouzi@gmail.com>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 08:33:00 -0400
X-Gm-Features: ATxdqUEyX9qpK523GiiHqFgOS3IQGtJNf5CuM7NiXhHEXKOmyJfQdgOJZiEIlUA
Message-ID: <CAKUZ0zKgvwhzgq8+_HG845QDze2SGN2fPwdXuN=UkATea6Nuag@mail.gmail.com>
Subject: Re: [PATCH] iio: accel: adis16201: Use IIO_VAL_INT for temperature scale
To: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com, 
	Greg KH <gregkh@linuxfoundation.org>
Cc: skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Not sure this is worth mentioning but one of the emails from using
get_maintainer.pl on the patch listed a deprecated email:
gregkh@suse.de.

On Mon, Apr 21, 2025 at 8:28=E2=80=AFAM Gabriel Shahrouzi <gshahrouzi@gmail=
.com> wrote:
>
> This is a leftover from the patch: commit cf96ffd8c2ed
> ("staging:iio:accel:adis16201 move to chan_spec based setup.").
> Initially *val =3D 0 and *val2 =3D -470000.  However, they were later
> changed to -470 and 0 respectively but their return type was not
> updated.
>
> Use correct type as -470 is an integer in the base units.
>
> Fixes: cf96ffd8c2ed ("staging:iio:accel:adis16201 move to chan_spec based=
 setup.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/iio/accel/adis16201.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/iio/accel/adis16201.c b/drivers/iio/accel/adis16201.=
c
> index dcc8d9f2ee0f1..1f27386edcc4e 100644
> --- a/drivers/iio/accel/adis16201.c
> +++ b/drivers/iio/accel/adis16201.c
> @@ -125,7 +125,7 @@ static int adis16201_read_raw(struct iio_dev *indio_d=
ev,
>                 case IIO_TEMP:
>                         *val =3D -470;
>                         *val2 =3D 0;
> -                       return IIO_VAL_INT_PLUS_MICRO;
> +                       return IIO_VAL_INT;
>                 case IIO_ACCEL:
>                         /*
>                          * IIO base unit for sensitivity of accelerometer
> --
> 2.43.0
>
