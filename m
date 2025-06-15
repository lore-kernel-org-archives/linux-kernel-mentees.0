Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F541E3762
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Jun 2025 08:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749976721; cv=none; b=INZQNNR23P56jyJ9xV4tQlK/xvny8UdM6pu0BpWD6rGfOLD4jLp92utxtxoSp0vqdKYweeRxGTyAxc45fYVxkB6oL0b2Ia2gQku1m+dAC3hxTUbmpKptoj0aumy9sgGi/Y6ON/6iyt4Cza+4N4EJm+Etf8i5zvRdhi00Kn+AgjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749976721; c=relaxed/simple;
	bh=GqpdqYG3SmZeEyG0mKgTNsxyagIR3PV7QRGf5meeoEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JxiokeqJg4tst1xWKnC07FFU1AaO7UoMRTjynGaN8mFH1baJtcZ/eopZfCYEPoS2t8Bb2bIaxlb3oZtO228SKJjyNq6hiq4VuCTx1YajeFIlzWkJGsJR5JhRO96m/d3G8KgI61BBVBDJz2jE9Nix0gjpMSQMs4VYn4Hgb4xELSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KuE0NTxM; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KuE0NTxM"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6960D6086B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Jun 2025 08:38:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LmgLLlvPTZ8U for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sun, 15 Jun 2025 08:38:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DEB1A607A2
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEB1A607A2
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KuE0NTxM
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	by smtp3.osuosl.org (Postfix) with ESMTPS id DEB1A607A2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Jun 2025 08:38:38 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-313dc7be67aso338565a91.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sun, 15 Jun 2025 01:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749976718; x=1750581518; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jLvwaubuksMTRXeeJPIzvRu7bLq6nCgwepjMqI9u5bg=;
        b=KuE0NTxMAjlG8EIO2RtGGh0pbBQHW1SyCqOPBOcxZh3j3NHXC2zV3cgvZTze6tk2Wp
         kBC9IqxbnX62De8CVgmVcsPfzDQaG2rFs/2xtA6qL1SdZjAlyLnMAf6BwNOFmZ93naev
         plPzLQgdYNW01WnZ2hQEScuhpZoQrD875nnTXqA8bDo5RI7Pu705tE11bHsK4j0pcRTV
         ii6GUxGImUzslx42vJjfNNy79AHjwt2/kj9+JZQuKn2f9aR3tLl0teJevKXy2ClkKmp9
         WgSiUpj/eCyn6aFQvkS57po3bxzrgUZIEhEUeU1giGBTNYtAXPgtodBXL4A6S2iEmi3T
         aE7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749976718; x=1750581518;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jLvwaubuksMTRXeeJPIzvRu7bLq6nCgwepjMqI9u5bg=;
        b=jqRjXD+uxwB2Rf9c89QEgBpNsdK8lxfE5XdsbzWFaVGL9sPBrFzLe1FPiQqEFNxP8B
         D68rMer+bT9kzEtdEYruwHfeoARTdzYGCQq7ARPkQGzAt7OvlXB8UOryWVfKBvipryAp
         4eAvLFHvuTJ327rWHKEz6ZB08Jir01PFUTMOrJJ/sDDJXp2oeLJCbB1xQIfijBeGIqm2
         nwm5qEQCSRbgzLs8O64xVFsmPcqO1UycsuglM0zTsiwoMSo1iRYAaJ9cqmGITirufpgw
         HuOfZSRmelK2IV6GmhD4zFe6qHxsXhuRF4qJTqyN2EFPeZeHhpBTvoW0t27KqmN8WEW/
         gpgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZQBwTC/StA7wS/TjTHuDT1BqL8xfWbjVSSSd8mB43eAY7VGgPkr9TB+y6rjAY2icWdBA+O2gBzHCCGK76Wp5OQmxMRQ==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwsuKmcvtRSLQR93RH4qlF9wbofVpHzrsP5fh8q/TuJincqenVP
	UA82K9jUyDRBAFMR4dJf/y9tngmMauF70KZMNs+hrJVLnZnECOyIbxcBh/G+YXnyTGTwZA0CP9T
	48bewdzU5ztMbl2aKBEKrSY2W8iDhiJo=
X-Gm-Gg: ASbGncs1GjA/ccV6q1nj2q+l+u8zMBhhWUULKgskORySr43l19cK99FeshsYvbfrqMs
	AU/YUf5jTFSW70vm2dSyGTIbUcMppYJVPz+85sjAaxN8V4bZci+WA+lUe7BCIcIPTeIKafYezlp
	ZIbVtKa1nR3TvV8r57zEXddT3WAFfdUW2eSkTrGHfd630Tc3rJmiVOfg==
X-Google-Smtp-Source: AGHT+IFqGuT3SB7N+d9lUjTCkh6mp4ctxdDL9EneNY8wraSsQ3JGsO8ntgtK4uZsUqghgHpp0A/3pCBG8BQ7wLkFmVI=
X-Received: by 2002:a17:90b:3c44:b0:312:1ae9:1537 with SMTP id
 98e67ed59e1d1-313f1b851acmr3181879a91.0.1749976718104; Sun, 15 Jun 2025
 01:38:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602232842.144304-1-marcelomoreira1905@gmail.com>
 <20250602232842.144304-2-marcelomoreira1905@gmail.com> <DAKFLKX7HS7W.29I8XUZP8L1KN@kernel.org>
 <CAPZ3m_hQF+ZHdfWTVZ3Z3dJoMu37Q8YcSecKi=fv1s3dw6UTSA@mail.gmail.com>
 <DAMGEMZF6UC9.1YB4QHDZIW5PS@kernel.org> <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
In-Reply-To: <CAPZ3m_jqnGJtOxff2cJre_qFLyOehbhZ+XVvE0BjzFv7ADqOAg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 15 Jun 2025 10:38:26 +0200
X-Gm-Features: AX0GCFtpmq8oVPEdcMBeQ_ReuDW-BQr3pLR9aOPT-TzhTUpFUwdxKh-mOgwEF5U
Message-ID: <CANiq72kmjEEsBjbmJ1rN-OYA7Tt7N_0j6mEB0=DPK9ng7uyuDA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] rust: revocable: update write invariant and fix
 safety comments
To: Marcelo Moreira <marcelomoreira1905@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 1:12=E2=80=AFAM Marcelo Moreira
<marcelomoreira1905@gmail.com> wrote:
>
> what about:
>
> // SAFETY: `self.data` is valid for writes because of `Self`'s type invar=
iants.
> // The `&mut Self` context guarantees exclusive access, meaning no other
> // thread can concurrently access `data`.
> //
> // - `drop_in_place` is valid to call because `drop` is only called once.
> unsafe { drop_in_place(p.data.get()) };
>
> I'm not sure if the line break in the comment is okay...

Benno likely meant to use bullet points for each one, rather than a
bullet point after a paragraph.

If you do e.g.

    git grep -A5 '// SAFETY:$' -- rust/kernel

you will find examples of that.

Cheers,
Miguel
