Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998EE15748F
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 09:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837241; cv=none; b=j+ofo1ANfFqc64ABz5CjfgCHjdlxF28oVL9hCzVEWJ+SVXc6EIKOWb3Kli0D6CbXHEerT61YasxY+weq2GW3b8hE3HS/OB8iKa71osHR0iQCINvZSvHiblv8YUNLzYBjiVj1BYzmizoXn2XVMy+JjGymVjsabPHdV4fOU3jimkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837241; c=relaxed/simple;
	bh=ghZnaAJ+VEThr3FH9O0jb/lJbXGZiKDJOo57uVGeV1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCDDK+1yNIW2RMyRCxcrxjQpNC9ZnjiXIpxOFASsifWaVTUroyB6ulGes+DXAJSIJj1U68R+9zJr9CInlRxZ9rAg5K4/fLGPdAsya+YJNuz72xCm+ms/J9WsjptJWI/V6Idy92Z8qeSIDFpvGQilXEJj7qx9e/Y3r+84D9j0QGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DmiPg5fQ; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DmiPg5fQ"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A87D81328
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 09:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPM8o-bSh3S8 for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Wed, 28 Aug 2024 09:27:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3864881324
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3864881324
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DmiPg5fQ
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	by smtp1.osuosl.org (Postfix) with ESMTPS id 3864881324
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 09:27:18 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-20228008eebso4042745ad.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Wed, 28 Aug 2024 02:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724837238; x=1725442038; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jSCip+Bemb8ICBMigULdX6HCTnC9f35hc67PS6U5/Fw=;
        b=DmiPg5fQ6Ev+jPygR/wKgbHDGw/4EFWrrPmrz9W6A3v99/Qk1LUEPFZtd+yLOZza3B
         VC2H3sIWm4KrGCtzuwKYa9Sc+ABBbWXpURds0nL3Sz+z/usCmQShge3pkgwyRDgMC5XU
         7NDTHTWWrXtJH/8NpRc7tQQjgcg9nIekia0cwTC8pq5uRL7iJS4OokGc808EosXWlzns
         YEHTK2eMh7AUR7orsvahxp1T3ltHZg5dy9GQfknZgGpUTiBVKwTN4M8XL9VvGh1oWoWS
         Y3zFDlVWt8sfDS/E7BH3IFwpY+LHvGoMK4pArciW+T195MCNM3j6QZTgkevPPVjIBVbo
         SPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837238; x=1725442038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jSCip+Bemb8ICBMigULdX6HCTnC9f35hc67PS6U5/Fw=;
        b=U5WO2Jo6oBP+SfcaoCz92gGbIeT7LLeUvk4SDaMx9Qt8aTF8fOL35VDnWt32U8WgHd
         8Y3xk0AKLrxIV5xycpYMWPAA/5LXMeeuPVd5x5AfZhQaHUryL17CZYDK7LfoMrq9WGCc
         HZYOOMBKjnr1hWmEP4ZNKEkczCJMeR5/fpAr9mPjREsb9ofUfJFWi1/LZXeAco9p9jPm
         qjBJGt6i0SQAzJyoRx6J1cVec9Ad5WJdB7IKbGhBGFWktj0vnRJUaaCuU/jcee3cfUSc
         ozi4wSMPqWHwvyh92LxHi9yUxz4ym129qCH1Bj12Ugcnd61/6Zz93fkJj5OCSVNqDt/1
         rKuA==
X-Forwarded-Encrypted: i=1; AJvYcCWNHX1K9cOOXoEyPkNR8A6Q1O9+2BWmumRXS+ljfzosM9Qp7iwJcNaRypvS69JH8+6+01mSWSexQAFFjpGyJ0iUP7i92Q==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwZhzosShcZytCJmT+0Q6rrXA6+7FBw53ipBHG7USOhTJAacvhR
	PfX/3vjnaamvSafCtrqKxRQGdCjpk1o/Q1LjHUKYOHoxPnms/3D/zBPZPSEl0bzL3qCSiaNcFnN
	dS0ysYVlM4AE6PrUik8WXO8GZpdI=
X-Google-Smtp-Source: AGHT+IHyABdB0poHBT0/yxTNrTjxAPxluXkzEFpqADvsChc4IObbGax1uCnmgL3SyLpTCbNWSKm7+t/J+ZYVTPfTe38=
X-Received: by 2002:a05:6a20:6a0a:b0:1c6:a62a:9773 with SMTP id
 adf61e73a8af0-1cc8a0d328emr12063523637.5.1724837238318; Wed, 28 Aug 2024
 02:27:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240827184359.46968-1-simeddon@gmail.com>
In-Reply-To: <20240827184359.46968-1-simeddon@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 28 Aug 2024 11:27:05 +0200
Message-ID: <CANiq72kOKAB6ptLzGDuRe5wStppAqWZnED-bcoUN5V5MYO1UfA@mail.gmail.com>
Subject: Re: [PATCH V2] scripts/checkpatch.pl: check for non-permalinks to Zulip
To: Siddharth Menon <simeddon@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, apw@canonical.com, 
	joe@perches.com, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2024 at 8:44=E2=80=AFPM Siddharth Menon <simeddon@gmail.com=
> wrote:
>
> Zulip links to https://rust-for-linux.zulipchat.com can break in
> case of renaming the topic or channel if they are not message
> links (which are permanent links).
>
> If a non-permanent Zulip link is referenced then emit a warning
> and direct the user to the Zulip documentation.
>
> Permanent links are of the format:
> https://.../#narrow/stream/x/topic/x/near/<numerical_id>
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1104
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>

This looks better, thanks!

> +                            "Use permanent Zulip links when possible - s=
ee https://zulip.com/help/link-to-a-message-or-conversation\n" . $herecurr)=
;

That link is better, yeah.

It may still be a bit confusing (one needs to search for "permalink"
inside the page), but perhaps Zulip will improve those when they
introduce more permalinks (?).

I guess we could link directly to the section at
https://zulip.com/help/link-to-a-message-or-conversation#get-a-link-to-a-sp=
ecific-message
-- it may help a bit.

We could also explain how to shorten the links if the line is very
long, but that is probably best left for another patch (possibly
another warning).

Cheers,
Miguel
