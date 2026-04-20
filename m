Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D1D2D3EC1
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Apr 2026 19:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776712999; cv=pass; b=hji0sIz5Eg3AxafFLLWLpot5r1inDdGB2zidkwH1BQlZ3JGfuooXk1uvze5T06/8ztatepIwq1ZLnQMBoHi4x9UnJDqH9+bSX5Pq1JB5keD9hMdOmPStGuopZ6yVHsp3RzYdsIurgy4dcFWodJ+lf2hDqlQtV386dFEYYosXQuA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776712999; c=relaxed/simple;
	bh=Urc4fTcbbk2a40JtrOyUlkKJdjhGu8/jYnZtRKrjbmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cel0FNRH/OBJoVgmTaedlVqcj1ozaRHaBJ/OlPMtr4ojiumW1FEnSSLfwqOuBE53HZDGYTdnSGNuSMJ6ODhCyYNecLDB6/Ud1+o6A4d5BHKhtxENKZksfVw0fVv5K/OguWZpFIR/B5CyPxo1UYUYTYZwKRpL+tWAbQB4DLsumRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mk/+96oM; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mk/+96oM"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-651c5d525f6so3099555d50.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 20 Apr 2026 12:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776712997; cv=none;
        d=google.com; s=arc-20240605;
        b=EG3YkEl+5V19/Ye4ciZ+z8PNZKdfWxpTVCDWCcPy8sBc+D7p6TmFHq37ea7fVOejhy
         fODFc5X7QStSOmT0yRruyo0jJ5p5SOjXUd9TsheJv/4nzjLGmgAvU5FiUviCHnc5XfV4
         9YjKAuE8i/r4+bL5dgbphY9CbM93uwpRasf9qQEI/V0EDTT8ZxiJnUL1qri7Sltp5iCc
         dyXGDc7bGoF9DvQ1tHpab5SYkmg9JXqfYE+GQGn0a6t2sJiRvCBzeIy5KzgBNQMz7HmT
         Ifjl9QS5v47QIAUspnm1RNh7dgufvTg0EtrI/nrTQwJaA0FVKmYCZ/jgsEbUBHfmVr0S
         RIRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lUIn3hEw6JYFkddfNv6BL46EZAbPO+C2iSOKicXTGNM=;
        fh=s4m/uAO2/xyR028W4ZFQwKuTg0T7ez0I9xmUSTneHU8=;
        b=TCN1FzXVWLeN1VzKERehFNO4MO0c6JFnW9TJdpDJHZawzUpFZC6rv0FDCvuetj2VIr
         z8T/yLLB4bh9GZuMcSo3wsERC6CzVnAzq2phpK/gqndIutUtm3ipi+waMPRAjIbypS7d
         rvxWTN0E8tRdMVnvfaU8uJq/kGLyZqU7jvmBDadPgA7rv/KX1XwdebY6jqfFvJze6h9t
         jbBniBpFVsN/kzZfalFp9tNBr5OoIMY0wzj/OV3r6dleO2XghV3hYbCp7/wMPgIy2EJd
         DnL/KteNiU1+nO69l+zfc7+mKt1MUHHmHMqNz4+ayWhoW1ajbirVOojmxZtsdi5XK7D6
         Cugg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776712997; x=1777317797; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lUIn3hEw6JYFkddfNv6BL46EZAbPO+C2iSOKicXTGNM=;
        b=Mk/+96oM+JGLZIBwdBuuiRbppLhU9SY7d+goM/LkghLsw3/G/9V9pM6m+qho/WyvUQ
         hjxQDUpc2mAAWbvFC1IGW+/FUJsxY2GkzY4QOMQmb1+qbQERbGf5FGzZ93RLDbthAzFy
         SMilFr0exi6kyvXOD4SFEunlru/BV5zpn7oYSQuHXG++QByRP2UtkqTwZd3uO0xcOkXs
         kmeG0eUr8DaWMf8jiVKCFDDlTkRw3SJmNgIDqzflXOQuUcjLFzHrKfCLDQKDgd/bPye5
         c07QAKrJQQURrSunT/IgD84XESk19GKl631GTkKI7ZgWP1bec0HEKwvbwjBO6lBgUDtv
         DnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776712997; x=1777317797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lUIn3hEw6JYFkddfNv6BL46EZAbPO+C2iSOKicXTGNM=;
        b=jAJcPlnlzwWGir3CTUSGgaHK3RgyewtKdH7IM46pckm5sukloAalZ9V+GVElcDjSna
         trrbLlirOz2qxZRJALVzKn6+5ERLbSKaNG+Us+vIsYEmjwlxw5akPDte5Nn8446Uds9G
         a7rdTGM2FRu8Pf304X4dJrzKbZbRMTSG2xAayEFtJcRyS5AjfZYKA1hatB13O9BFV/zh
         sMJCqwCUjohDijXbfwf3UTd9sKFT3XHOWaZeX7IBUdCxQT2rLuF1X8nRigS+YdCV0lUa
         vkpcex8l7jJa+xBXf7YZ4X0RTD6hwj8yJQ2ky8KGrRxicvBfGKy9otPs4F6Fx+nPWPKC
         525Q==
X-Forwarded-Encrypted: i=1; AFNElJ+6IXJ5nRyvKR5KU5d+xrVHshVLG7c+kk60zeRjuyh0HXxXLuR068mfO5WNSarwwypC8Bu4C6/5d+oWMQw58h6W0mq05Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyI9UjpJFVsssDy9skiHLE6pP9vbOQdh/18r/B0wGSHa8mi15Bj
	GgKW+Az9CXriU0D9n+XtzQjhBM7UI66+TEdHjJCQfGk9ajv4wURceEglbtlWswP4ugUt2ziw2Dd
	GJrMllhqyQdLPUXGeAk7PUMuaEI77CWI=
X-Gm-Gg: AeBDies2chIm7ZXE6hnbupoKFWQF1ycwga2xCXAKE52ksoHmJqZBEOa8aqzkMH7TG2I
	uf1/vrEo6wmFzKTKr3FTF8VxrTHa8ivVATGKbFF3oqznfX858fe1Ak5kR/pMNP3d4y8/q5NHhup
	xrU89hZqYCu7P/X6jh0q/svJBv8zmmJGvlGkLuxhBWmzs8w/OXhq+YRgRtmdFCX12NjDGmmvSBT
	0snzRdM2pqi/n7GH8bS4TkBFIpm4jMxrtGLb+LM+6uMkweRcQuTtWc2THYIUmEMwk687auxjPFY
	iio+hoPm9864DA4kaIipLzlEYEgHaTrH304ALBO6YqOp3rlwX8eFDxXs8IZDyH+nWtr5q/Lzhig
	J2g==
X-Received: by 2002:a53:cf44:0:b0:651:b86f:3657 with SMTP id
 956f58d0204a3-65310a0bde6mr9520237d50.36.1776712996801; Mon, 20 Apr 2026
 12:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418053401.128483-1-suunj1331@gmail.com> <20260418053401.128483-2-suunj1331@gmail.com>
In-Reply-To: <20260418053401.128483-2-suunj1331@gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Mon, 20 Apr 2026 15:23:04 -0400
X-Gm-Features: AQROBzCElDRvhVtJbXCcMB4PIv35kNLuKPjgXleuneDJqn-BnYQgD22cYaV6t4o
Message-ID: <CABBYNZLBoU3byfK_G+=sTkBx3wNwEh2X6_7dG4+4LFtrc3Skpw@mail.gmail.com>
Subject: Re: [PATCH 1/2] Bluetooth: ISO: Fix data-race on dst in iso_sock_connect()
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: marcel@holtmann.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, me@brighamcampbell.com, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi SeungJu,

On Sat, Apr 18, 2026 at 1:34=E2=80=AFAM SeungJu Cheon <suunj1331@gmail.com>=
 wrote:
>
> iso_sock_connect() copies the destination address into
> iso_pi(sk)->dst under lock_sock, then releases the lock and reads
> it back with bacmp() to decide between the CIS and BIS connect
> paths:
>
>     lock_sock(sk);
>     bacpy(&iso_pi(sk)->dst, &sa->iso_bdaddr);
>     iso_pi(sk)->dst_type =3D sa->iso_bdaddr_type;
>     release_sock(sk);
>
>     if (bacmp(&iso_pi(sk)->dst, BDADDR_ANY))  // <- no lock held
>
> This read after release_sock() races with any concurrent write to
> iso_pi(sk)->dst on the same socket.
>
> Fix by performing the bacmp() inside the lock_sock critical section
> and caching the result in a local variable.
>
> This patch addresses only the bacmp() race in iso_sock_connect();
> other unprotected iso_pi(sk) accesses are fixed separately in the
> next patch.
>
> KCSAN report:
>
> BUG: KCSAN: data-race in memcmp+0x39/0xb0
>
> race at unknown origin, with read to 0xffff8f96ea66dde3 of 1 bytes by tas=
k 549 on cpu 1:
>  memcmp+0x39/0xb0
>  iso_sock_connect+0x275/0xb40
>  __sys_connect_file+0xbd/0xe0
>  __sys_connect+0xe0/0x110
>  __x64_sys_connect+0x40/0x50
>  x64_sys_call+0xcad/0x1c60
>  do_syscall_64+0x133/0x590
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> value changed: 0x00 -> 0xee
>
> Reported by Kernel Concurrency Sanitizer on:
> CPU: 1 UID: 0 PID: 549 Comm: iso_race_combin Not tainted 7.0.0-08391-g1d5=
1b370a0f8 #40 PREEMPT(lazy)
>
> Fixes: ccf74f2390d6 ("Bluetooth: Add BTPROTO_ISO socket type")
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---
>  net/bluetooth/iso.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
> index be145e2736b7..14963ba68597 100644
> --- a/net/bluetooth/iso.c
> +++ b/net/bluetooth/iso.c
> @@ -1169,6 +1169,7 @@ static int iso_sock_connect(struct socket *sock, st=
ruct sockaddr_unsized *addr,
>         struct sockaddr_iso *sa =3D (struct sockaddr_iso *)addr;
>         struct sock *sk =3D sock->sk;
>         int err;
> +       bool bcast;
>
>         BT_DBG("sk %p", sk);
>
> @@ -1191,9 +1192,11 @@ static int iso_sock_connect(struct socket *sock, s=
truct sockaddr_unsized *addr,
>         bacpy(&iso_pi(sk)->dst, &sa->iso_bdaddr);
>         iso_pi(sk)->dst_type =3D sa->iso_bdaddr_type;
>
> +       bcast =3D !bacmp(&iso_pi(sk)->dst, BDADDR_ANY);
> +
>         release_sock(sk);
>
> -       if (bacmp(&iso_pi(sk)->dst, BDADDR_ANY))
> +       if (!bcast)
>                 err =3D iso_connect_cis(sk);
>         else
>                 err =3D iso_connect_bis(sk);
> --
> 2.52.0
>

https://sashiko.dev/#/patchset/20260418053401.128483-1-suunj1331%40gmail.co=
m

Seems valid, so we migth just use sa in the place of iso_pi(sk) to
avoid using it without sk being locked. Other problems it may reveal
need to be addressed in separate patches.

--=20
Luiz Augusto von Dentz
