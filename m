Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6AE2EBB85
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Aug 2025 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755854907; cv=none; b=KZAXWbgwMlJrqF31Ld4jUTPGLb6vitYsoM5VpdoF6UEKU+L2fzgYQwjK8373oWHQ5Po3+SXRLDkFEA30goOeUwkHYpm4rbd+btZDPTLON1B0LUDSiRQ8U8a1l0SWG3fU+DKC6DVZ7TFfCoIgYiPXd1KpisStkWU4jrZhiLpNQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755854907; c=relaxed/simple;
	bh=h44br5LDQv0BseE3KnCb4hJjXarEdaBBlWW/KK35hVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a+AcUYsM16UQv5K/WnH+WwiEwLs1CCybWcrUS/Q7mp75waf+ncVxKd4SGsXts+JMsulso/VE7bqx0pjLBXUX71pbejTgmqneOVgnMHpHuP7RgSxwWcuWpZEUdnZNoe71so5k/GbWkYNj+eWzY4tzytoB9iiy+0hNImZsedf1E78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pw7qgBLy; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pw7qgBLy"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A72560AC8
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Aug 2025 09:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wCYjlEm-Rq02 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Fri, 22 Aug 2025 09:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5E165607FB
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E165607FB
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Pw7qgBLy
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 5E165607FB
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Aug 2025 09:28:25 +0000 (UTC)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-8921eb4befaso320394241.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Fri, 22 Aug 2025 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755854904; x=1756459704; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTifXRrK08jCyKqVxJKl2F+7vzPyJ0kiGwiVQHMIHWQ=;
        b=Pw7qgBLyTw67pMRpngFMYzXtEu6inYxfDninVuRpmn1qjZvZ4Sbv3wqqoMqOBqJ61R
         YCgNy4CBJZ3yldkL+8GHUMZgPoCaYGbfhV4ElSLl2ZYWd/MXatdSBmE2nkdP8ZgMF1F2
         rEpFM0IzWji2dVS0dnU1ywm+1tIeK0sLrVdohvJcC0tHOLelPqOs84Kix2kwua7Ddyq+
         5lLvS/wbiaNVO6SXSC859aj0RxoOaaduLPhM4qzfrZeRVJylMRypOrx3BJxG6IUdefv7
         JBuq3gcD4vVY1bjSCtr628RhHJz3Z+ilPIpsjq8noUQQl+GgB3LzhqX46fEXlj+cVJ2w
         1mnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755854904; x=1756459704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTifXRrK08jCyKqVxJKl2F+7vzPyJ0kiGwiVQHMIHWQ=;
        b=OfO5mV0LcyHMR0Y0QJlyMoUqlNSZnxEO6OMv7h5gp/JzHUg9d63lrRGTdfodf/b2YR
         hcfDR0eLq3w7wr2se/yZMPRvfhvUNILDwhiTyhvXs1+dTfFFZ0VPDbLrKMUOz2em+Z/2
         tMutvGEs93IBDjG5Lr6Q6nuttkzy1pg/0aDlAyci4BMQi2+2WjL8e3X7yOscGLFe46Gi
         WS3CffKYYZCVLDOzQdU97leHP1GeXf7btDPlTXKI44P9LPduNfJsdWpHuM/xrJ1Vp0ma
         A0bNQZkjkUttFz3OF4jVBAys5CsciWaFCAZwSkWyvT3ScR+V9agshrwhR6Yd/TDRV3vB
         6rvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEhuFkls7ubb8CA5Q2X3MRFhlKPkDkkkyxGcZPZ8U9dfBZoss714M6dgwDgV7KCCXwDmqwvChn6/X8rUzB20Z62Cok5A==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxgK4W3osDNfzCQqbA03XmKbuna0XItbWntqpjlRK5Z+CCp1z6Q
	yEYwX+Mu4kW+W/n0u8jBFZhAyHKhEOLIp4Z3tBVfMTCXXs2tX1eLg3maX4OOcAp874qEbTFFPai
	pNXPAYaqMEhor9IFQHmszJjMFM3V3Ftk=
X-Gm-Gg: ASbGncvkGXGcSFaoSZ/9qVQ2asTFLB/GzKK7YydWI1W3yXp8e1OTGT6j8/jA1Leukf2
	dxWWBDFHCr98r5ymEkx0dClzhOfEAgib5nm5wgfYqNJXd2VkF7wsUz0/n/WfMY56x+Ic6RTns1D
	Tt/m6D89pih89yjx2CzkL56rKPbw/MK1ZX0HSF0HaJrlp0tP8Y30Ci1MXWJkp5SZU4CQXvhfuuQ
	XMt3GnPip49zK/OdmmhaPVGw+f5VzZT50ISqeMtMIFVgDjQefpplr5m52NTXw==
X-Google-Smtp-Source: AGHT+IEeX0lE8kU6E9QdSAUzfVyV9wkWZKLrBlN769Y5Bh2TkuIKhVEec3g4tWpOuEtkPUO3AWcQY8ZUNGyC5qrXzrY=
X-Received: by 2002:a05:6102:c04:b0:4fb:dde8:76cf with SMTP id
 ada2fe7eead31-51d0d74d178mr515300137.13.1755854903887; Fri, 22 Aug 2025
 02:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250819113551.34356-1-kubik.bartlomiej@gmail.com> <87ect47e0t.fsf@trenco.lwn.net>
In-Reply-To: <87ect47e0t.fsf@trenco.lwn.net>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Fri, 22 Aug 2025 11:28:12 +0200
X-Gm-Features: Ac12FXxbEtb4LitNVasiGaFy0KDO2bDJJWDqQBSDd4eHWLeZZID6sTIa8X6RUK0
Message-ID: <CAPqLRf08i3FgXWNoP=gg1qy92hVhkZq3N3MeKpSuOs4U3KqeSQ@mail.gmail.com>
Subject: Re: [PATCH v3] docs: replace a duplicated word and add missing
 SPDX-License tag
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Many thanks for your feedback and review.
I will keep them in mind when working on upcoming patches.


On Thu, 21 Aug 2025 at 19:58, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:
>
> > Fix documentation issues by removing a duplicated word and adding the
> > missing SPDX-License identifier.
> >
> > Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> > ---
> >
> > Changelog:
> >
> > Changes since v2:
> > - Replace =E2=80=9Cthat=E2=80=9D with =E2=80=9Cthe.=E2=80=9D
> >
> > Changes since v1:
> > - Add missing SPDX-License tag
> > - Remove duplicated word "that"
> >
> >  Documentation/admin-guide/kernel-parameters.rst | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
>
> A couple of minor notes:
>
> - It is good to indicate *which* file you are modifying; I've rewritten
>   the subject line to that end.
>
> - Adding SPDX headers is a bit fraught unless you are truly sure of the
>   license under which the file was contributed.  Given the nature of
>   this file and all of the people who have touched it, though, GPLv2 is
>   the only option that makes any sense.
>
> Applied, thanks.
>
> jon



--=20
Best regards
Bart=C5=82omiej Kubik
