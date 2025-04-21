Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7D61E531
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242242; cv=none; b=P0t+jTILyNjdYhoMgGxZaijd+tEqf6LPifQeZC63p/kQv9utpvx9sSs/Ddg48KdsOLWNTO+17JqLB3+n7wDJTH72z7oX+BBL/IlMwloU1Sls9d5DJPQG6sUEEWUXQRvNwlRt5wzXhoKWxIcfqE3AwrmkMf9DRgpTzTwFcSqcZ9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242242; c=relaxed/simple;
	bh=0i0TyAPOXKI3l8ZynRkKZgCnay0DHc9wh7EcFzo8lK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pj+bh4nlgJf/uhbX4E7HkhA/ThP09DmcvGEJ31yP/2Fwt5OI9guC5uw/cV4jX+qEmSqe+nZqzueX+AVwAZWFG6Prcy5DPIVhst1qbtUb5nPM9taU2tNIKGOz+fhVciLMHu50ucEMDIYpRZqoyurRYTq3DdGnRYqYsGUP5Vg1zjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrVroyyy; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrVroyyy"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47691d82bfbso79024081cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 21 Apr 2025 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745242240; x=1745847040; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zQCssDwzH4/Q4JlbcmWxYd7mPnpwvZY0f5zJ4LwIRE=;
        b=TrVroyyyzfP52yM2Sz+xITDZCydjXGvVSLAb+wGVA6cbwItmqu6txilXaoVP5L8haO
         DQ43Dab67xYEFknF6ITibpZSQ9OTLQbHewZkM8GFYXotwar4ilzXyO782dVQgMUsA9HG
         lqJJLIh9YgiOJVkjw0vpt9Ovl5ru9vzAZcWqz90hPqBWGvdJ0tTOA1Nqh9VZTEoZP7oj
         7WjIHFgnCg7zoUOWJDhs+F1Bak2FnvrvwzVYWDin8HYLkJF4TUOymF+H1RAN8YQLfx6U
         Al+Rl2TcIry3LJWUj5zQ/12zOp0PDA6xkxfnnKtL3T2t5rHi0Ks5tnthWeiCI1L/HBCh
         HRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745242240; x=1745847040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0zQCssDwzH4/Q4JlbcmWxYd7mPnpwvZY0f5zJ4LwIRE=;
        b=qDthw+UcQnKRYkf+nxgQ467vQeW8yElqoRksuTYw6ygXZYUWaBYIq7fttQsKJIFR3H
         FeHluKswRezOvcF7QQVad20qHU5Fv+qJ76qnKTJXhv9P+rEwwxwss2pC3ydLERp4cAZe
         4MQpUs5ZA4IlQAxBquGl6fKP+8rFvwSdHhi1IsOH05eb4OLetgrL+5xWwxYJg3r5YEQn
         LNhfTsE1diY26w0Qe0g1hzxB71Qeh5HwhVZtzLsHL1PnGhurBzyMGUqtjdYcvl1vyCxv
         DJpwvObgnuaRffgS6InAPOgu9Edw0hyy1iHue0Vhc+wHFWm+FsNIhgBxVzDi0gKrmopz
         er4g==
X-Forwarded-Encrypted: i=1; AJvYcCXldhDhYlICepvMrN1ZIG9T/foRk9b6t/wSKNTM735ZyNvFeRs2qbc7X9oCRQAAyBDiQpzRM/mHomxFAaewHX7fD3u6VA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzbsLABfH4l3gXIn8muuxIxBZgDb2ib7OI95fqQMbfQT5LqIIM6
	O2df6Fk/qDpr6GMdQ9sBZqLOsVm2Q/l0NTmbQoyk2afkUH22nMa2zt9pr/9dmnUG2QSmEj6d4Vw
	dWg2D/Zxf8dR/rQvHiaoq+/r5m+Y=
X-Gm-Gg: ASbGncstXCZSUfwR4+4hh238Srzh2sZPt+MTeiNfitzJgw4sWiQCAqqHuQpmcX2eOWn
	UP1rqPX3godoisJLhhmfe8YrmMS03TftI4gj7IBdEBy9r82UNq72gk3ibJVEMCbbFEQnRdrS6Tm
	6Lvaaee5+/HdztDV0s7gWfhutPDUwngCrWX9PYgEX2D/UMl4itX3nOCA==
X-Google-Smtp-Source: AGHT+IEm/xmZibX65FV52m6B71Cf1v/smej0rvz4PepDzm+vnpKDYokJmknT/gvG+/daSiiMQVPrZ+vfMBcrOATxF+Y=
X-Received: by 2002:a05:622a:c5:b0:476:6f90:395e with SMTP id
 d75a77b69052e-47aec394390mr200563501cf.21.1745242239708; Mon, 21 Apr 2025
 06:30:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250421122819.907735-1-gshahrouzi@gmail.com> <CAKUZ0zKgvwhzgq8+_HG845QDze2SGN2fPwdXuN=UkATea6Nuag@mail.gmail.com>
 <2025042153-rearrange-shakable-e404@gregkh>
In-Reply-To: <2025042153-rearrange-shakable-e404@gregkh>
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Date: Mon, 21 Apr 2025 09:30:28 -0400
X-Gm-Features: ATxdqUGnztcWcF1N5kH7d2yvCEfHpZd5DNAmlQzLZRVaObw_MrkullbHFSfrZtw
Message-ID: <CAKUZ0z+8XQo3P47Q53kg4YSowvAG+RisUfUMFWmpdKbHipSBOA@mail.gmail.com>
Subject: Re: [PATCH] iio: accel: adis16201: Use IIO_VAL_INT for temperature scale
To: Greg KH <gregkh@linuxfoundation.org>
Cc: jic23@kernel.org, lars@metafoo.de, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Michael.Hennerich@analog.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 9:16=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Mon, Apr 21, 2025 at 08:33:00AM -0400, Gabriel Shahrouzi wrote:
> > Not sure this is worth mentioning but one of the emails from using
> > get_maintainer.pl on the patch listed a deprecated email:
> > gregkh@suse.de.
>
> How?  Doesn't do that for me:
>
> > >  drivers/iio/accel/adis16201.c | 2 +-
>
> $ ./scripts/get_maintainer.pl drivers/iio/accel/adis16201.c
> Lars-Peter Clausen <lars@metafoo.de> (maintainer:ANALOG DEVICES INC IIO D=
RIVERS)
> Michael Hennerich <Michael.Hennerich@analog.com> (maintainer:ANALOG DEVIC=
ES INC IIO DRIVERS)
> Jonathan Cameron <jic23@kernel.org> (maintainer:IIO SUBSYSTEM AND DRIVERS=
)
> linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS)
> linux-kernel@vger.kernel.org (open list)
> ANALOG DEVICES INC IIO DRIVERS status: Supported
>
> How did you run this?
I ran it on the patch: get_maintainer.pl
0001-iio-accel-adis16201-Use-IIO_VAL_INT-for-temperature-.patch
Lars-Peter Clausen <lars@metafoo.de> (maintainer:ANALOG DEVICES INC IIO DRI=
VERS)
Michael Hennerich <Michael.Hennerich@analog.com> (maintainer:ANALOG
DEVICES INC IIO DRIVERS)
Jonathan Cameron <jic23@kernel.org> (maintainer:IIO SUBSYSTEM AND
DRIVERS,blamed_fixes:1/1=3D100%)
Greg Kroah-Hartman <gregkh@suse.de> (blamed_fixes:1/1=3D100%)
linux-iio@vger.kernel.org (open list:IIO SUBSYSTEM AND DRIVERS)
linux-kernel@vger.kernel.org (open list)
ANALOG DEVICES INC IIO DRIVERS status: Supported

Running it only on the file the patch modifies gives the same result
that you got.
>
> thanks,
>
> greg k-h
