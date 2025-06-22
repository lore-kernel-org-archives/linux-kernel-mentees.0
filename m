Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B851A7AF7
	for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750583348; cv=none; b=rG0n6a2xiMGbeBOez5NiHzsAkx9hiwYfC6SfLZnJ3+qtJoxzgSQrbnDfodKdSmnUGtiscbMZKU48l//JN8wV2WsWO9TlX65nafkkGQRPJezJ9rdYootT9qOmWlQQYxoJm+Jv1tNZghhVDmV2F+S5vI5xqlVbt0CGrRns62+0Oe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750583348; c=relaxed/simple;
	bh=SG62WGaCLDI8YObRNSqb0QuUj6a8+t8Yq3aLnKYD40Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sYi6S2yV18EnphqM1eU5Iku5canGnoViDcX85exUBLdiNEpO8SfCMBvUZE0r37S1Y+AuB3hcro2D+e9NA2vhTRlsZ0opwbzxqrRW0zsA5W0hVfJrSjz5kmzlJJ2U1rsROY1zuEXZ70IpApMoGohK1z4I0UQABYOdg6NZ7tyzONI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUK8aUfq; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUK8aUfq"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8187df27f8so421267276.3
        for <linux-kernel-mentees@lists.linux.dev>; Sun, 22 Jun 2025 02:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750583346; x=1751188146; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ujhMv3dGKnLx3efXHPVpQpjGtSxJ7hWBd9wshMdcgx0=;
        b=fUK8aUfqt3IMkKCO2PBzzQdBPwXQV7WgGNzNdA6udvc+yGNLx5XrS4Hdd2qWrOghTx
         15pQWCntDjX+3dzvDYBLrbrkF7uZ01qWnOSLlrnv9kXvHe0teNL5LaIskxHfYo9OR97X
         MG6gs4Mxwu1ksNpeJ73TJw2mHGus/LB3C2L0S6EJN/CLiVerLiSh3Z8PwGTwyWMqCG2x
         OzufSaSnN09+G76cMmvOWkhwxCQ0Ay6reulBQYySsPGRjP0VVRpv88jKd6vjL9GFvEr4
         fvsYaR6+/DRRQiuFlmjL/2KYNnF1U7mCyCeWlI+4v8yoaTJqcTmM7aoyZ4gGrNbbuS2g
         xCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750583346; x=1751188146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujhMv3dGKnLx3efXHPVpQpjGtSxJ7hWBd9wshMdcgx0=;
        b=aeKIwq3F//EvyL4GFFgg1MNYAid8+7G1/2tHuqgX172iGJGAYvoxBcGEOcc1LdHZe2
         zD7GUnDHqXZlqfikOaHQMy0dweypKzvgFTDjDhzEbsCi/7GB90GfLQvXlu5ohKzchXKQ
         gYPmtjJx31meZ4aCEELePqYa8sKTwZmXpVqcdLxq6JUWZhMzSuJHTY0NqjQeHCTsRGJN
         oTu5TOPlHm0aBsfYQVW4aDKgus32/Bdb93fp3YVHAZdkcQrC0eflQhmMf5/m1IaK21bf
         Va+dw6itkFianhbHxSxaBEvdlQ2iOXm0ugu8qCYdVIyxhpc/iYBORVcirJEcXl49ffbx
         dxww==
X-Forwarded-Encrypted: i=1; AJvYcCWHCDfbegKYMQN5d5utB1VEebUUYicNZ+uyz45Mx7B6l9V/barMVMltfkCiS4Vuk1EvOvPU19mg3Vn3qzfo8y3KyI9xjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6FgoikTLOPPnd58nzrQZaJxyJowuHSTNT9KLZDQcF2ehy52iQ
	daQgJ7QM+ABN05CWyp7Y4MJli+6k2ra6ddmqCJsBZEPTfAicGsPzK7bICT1znO+zMR89hN3IqxN
	U4PizKs5je3S7INuxGH5nsyvmQGLGLzc=
X-Gm-Gg: ASbGnctTvTfVo3txJkCcR5Z5cwh8oQ686hCjyT0QleCV6qG2ZBbz9xWM19o7lCDRd99
	xAqh9F+FYUlUexMuiL0l0aDrN8FhP43a4VG7OGMZ8xFpxgyNANWRJ7G0CbkAw5Q1vKFa8yiHbsH
	QW0jNyLHrB/kHJP7HPiT2gT09vjHRbAZkA7/AcCdKqwIgRtzbvuxEyaXSh
X-Google-Smtp-Source: AGHT+IFh7WNJwFrHdEgYCRMpR1lM9TCow1HkjDHvL18GOEccw9ufr1mk8LWJVVZnElFIF2l8GUZ2uMbc1nexIy+kOmE=
X-Received: by 2002:a05:690c:4b10:b0:712:a286:2ca2 with SMTP id
 00721157ae682-712c654cc21mr58791337b3.7.1750583345877; Sun, 22 Jun 2025
 02:09:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250622062724.180130-1-abdelrahmanfekry375@gmail.com> <aFe62dzYPLktxZrH@archie.me>
In-Reply-To: <aFe62dzYPLktxZrH@archie.me>
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Date: Sun, 22 Jun 2025 12:08:54 +0300
X-Gm-Features: Ac12FXy3mdUs4tZkvbrDhBlGnrvP9jUXcybU85gnVa4vnDKPKn7VQarwzDhtloc
Message-ID: <CAGn2d8MjZ5J1eMCLaYNdJSbL4nbn9npxLedkRCgBXbfwq2i+Lg@mail.gmail.com>
Subject: Re: [PATCH net-next v4] docs: net: sysctl documentation cleanup
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: corbet@lwn.net, davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	kuba@kernel.org, pabeni@redhat.com, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, skhan@linuxfoundation.com, jacob.e.keller@intel.com, 
	alok.a.tiwari@oracle.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 22, 2025 at 11:12=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On Sun, Jun 22, 2025 at 09:27:24AM +0300, Abdelrahman Fekry wrote:
> > @@ -1028,13 +1134,15 @@ tcp_shrink_window - BOOLEAN
> >       window can be offered, and that TCP implementations MUST ensure
> >       that they handle a shrinking window, as specified in RFC 1122.
> >
> > -     - 0 - Disabled. The window is never shrunk.
> > -     - 1 - Enabled.  The window is shrunk when necessary to remain wit=
hin
> > +     Possible values:
> > +
> > +     - 0 (disabled)  The window is never shrunk.
> > +     - 1 (enabled)   The window is shrunk when necessary to remain wit=
hin
> >                       the memory limit set by autotuning (sk_rcvbuf).
> >                       This only occurs if a non-zero receive window
> >                       scaling factor is also in effect.
>
> The indentation for enabled option outputted like a definition list,
> so I fix it up:
>
Noted , fixed it and checked for other problems like this , thank you
> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara
