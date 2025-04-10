Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E03C1F09BF
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Apr 2025 19:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315184; cv=none; b=WpmBz82jYdd6ciMfRDjZ1ek74fyAZDS91WnW6Fe7XdE7HmEpa10xG1vhCgLIyZzeozYtojdjC9MBCeZqNp9jeQ+JBc6XpKN6HBgZY/p9680ITnQQPPxCoyKoTkJ7PcSgA+GUeSMdBJf9xr8HpEo/vndFIMHv+UeUTBSx4ASB/ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315184; c=relaxed/simple;
	bh=NW63uHkLkcM39Qc6iSVYuH58ir45xfXAXIeZclP1MP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KIuorI7Jme71kczpnpuznDgq3Hl9Jy8K1VFCSEf9nfUmvjK9tJux2dqJ74BrADE6iIOu1gE5ul8NT9xUnz9ocryqaRCXbQXlw8AcSFHpmqDKceUtmbWM5aITgZU/iqlRP40iDjPMz3t6ycAu7j3c1xHV1nB5XbjbNA07F0QTxwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KJwvQ02u; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KJwvQ02u"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-549967c72bcso1630710e87.3
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 10 Apr 2025 12:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744315179; x=1744919979; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwHmA378W6NLdb94l0kIXEG6dN9f+MTetUXmPGeF77o=;
        b=KJwvQ02uMbk6p4bSNyikmzVYhbX2TO9KnMoHRKJPJbUi7XzpwT/QL6VCqSJiLje89y
         sBITASm9Vp9suDkzCLBplrtDUpTykgDh1mFgKSo5f3m/l2tfY3hVMxHtIJYxlJvOgP41
         6Odym+ydsbxkldHa8YpvXoDkkf8gyA106EYt/WmKRGPquDZ4kZ+Qd1IgfeSB86b1z9Z7
         J5OjqsVNOafMjR9GQGpObkwsEPxywb/E5ds+c0625zTWqCgGn3jeFuy9OvXvt6ix9iyW
         0o3uDK4nhDDVeTJ91V62a6JszuGFqLJDH+NnnqnnCJey/TOUe6Ltvi94GwSfmCoPyodp
         BSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315179; x=1744919979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vwHmA378W6NLdb94l0kIXEG6dN9f+MTetUXmPGeF77o=;
        b=bdJQYcmuKIFFdJKeGEgqeL6fkSIRlof9akYqzqx4C8uBNmhmWsFmZGV5BCksAQtv6y
         zSmlWAiXr7KP+kNybf4smFjnox26XAZbx/Iq/gdRnMMqajTtv7KVaY8OyuBw+vTdFYvb
         zzC4DnTxmjZbOYMZBo3q0bbsUWD861I1dbnK4xTg/TsySWHBw4XWer99CjzHlrDjgbOt
         U2TkJNJCEKg5d139Sq2WOTjhwTEUOTn2WKrFKDSnUEbELpqj/u7hXAh11EVCMR1ipGnL
         v+V1Zjme1S44/WK2E1ndTjFF7HLF3sRTqLPsskHr5QEw2yEw0dWN7ceKJOGIjwwWAI2i
         4zDg==
X-Forwarded-Encrypted: i=1; AJvYcCWf2lNXTbh11ve76WreKEJFG2pMgTPaTnYBs6sV5+wFc79Z1c+5f1WNTCYZp80qrOMUxtvv3gWibBjQf4dOrww8o9PuLQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5xMs5MAJDysFREtRfc7YM4CJnLiLmDlX4VHGYg0Vo2d2b/FgM
	0a8/apnU+HMw28d7y883efJew1uP+CKlC7+MuwdH/Z4vXYFi6ynJObfKfj3Td15PacvJcxwE652
	rMn3XBY88tW9KoCMRiLTxN2XCDmE=
X-Gm-Gg: ASbGncs0X9ytkjHCx01rI8+wzrwFDvmvFS5tOS8NyDBc3PVmVfBVld5gNEI0MCJnazu
	JRQ5lMsBJ/DzAiXu31FakezRcQ2D9RQKbcXoz6f52intQBJi5c76JMkhPTRSzxscNkOwO3/8e54
	o2EPCsNGU1BDrisyePl6myBlOVdERxqRYHGXfT3FK4l6kVPOIgO3XZL54=
X-Google-Smtp-Source: AGHT+IGY4oluoFyz6GVB34MFhj5G3ks9xo2ahSRLku9GIJQXukB383ULsfDKfh+ZtOCcwWEADCve3h2EUoyMATCSseg=
X-Received: by 2002:a05:6512:3ba4:b0:54b:1095:6190 with SMTP id
 2adb3069b0e04-54d452d7ec2mr10657e87.49.1744315179118; Thu, 10 Apr 2025
 12:59:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250408185759.5088-1-pranav.tyagi03@gmail.com> <1168af15-14dd-4eef-b1d7-c04de4781ea7@amd.com>
In-Reply-To: <1168af15-14dd-4eef-b1d7-c04de4781ea7@amd.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Fri, 11 Apr 2025 01:29:29 +0530
X-Gm-Features: ATxdqUGWkHq07QDYT837wHsiO-ekWuaZwFRrPK3PdsygZOVdXNU2Ad9m_XoQj00
Message-ID: <CAH4c4jKm9ewfL3G7SAGokzGT3VpLaKWQrbrxcLAnb-G8_MUjSA@mail.gmail.com>
Subject: Re: [PATCH] net: ipconfig: replace strncpy with strscpy_pad
To: "Nelson, Shannon" <shannon.nelson@amd.com>
Cc: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	skhan@linuxfoundation.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 9, 2025 at 3:14=E2=80=AFAM Nelson, Shannon <shannon.nelson@amd.=
com> wrote:
>
> On 4/8/2025 11:57 AM, Pranav Tyagi wrote:
> >
> > Replace the deprecated strncpy() function with strscpy_pad() as the
> > destination buffer is NUL-terminated and requires
> > trailing NUL-padding
> >
> > Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
>
> There should be a Fixes tag here, and usually we put the 'net' tree
> indicator inside the tag, like this: [PATCH net]
>
>
> > ---
> >   net/ipv4/ipconfig.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/net/ipv4/ipconfig.c b/net/ipv4/ipconfig.c
> > index c56b6fe6f0d7..7c238d19328f 100644
> > --- a/net/ipv4/ipconfig.c
> > +++ b/net/ipv4/ipconfig.c
> > @@ -1690,7 +1690,7 @@ static int __init ic_proto_name(char *name)
> >                          *v =3D 0;
> >                          if (kstrtou8(client_id, 0, dhcp_client_identif=
ier))
> >                                  pr_debug("DHCP: Invalid client identif=
ier type\n");
> > -                       strncpy(dhcp_client_identifier + 1, v + 1, 251)=
;
> > +                       strscpy_pad(dhcp_client_identifier + 1, v + 1, =
251);
>
> The strncpy() action, as well as the memcpy() into
> dhcp_client_identifier elsewhere, are not padding to the end, so I think
> this only needs to be null-terminated, not fully padded.  If full
> padding is needed, please let us know why.
>
> sln
>
> >                          *v =3D ',';
> >                  }
> >                  return 1;
> > --
> > 2.49.0
> >
> >
>

My initial assumption was on the fact that dhcp_client_identifier
is directly used in DHCP packet construction
and may be parsed byte-wise. But on going through the code again
I see that it does not require to be fully padded.
Would strscpy() suffice? as it ensures null-termination and
does not fully pad the buffer.

Regards
Pranav Tyagi
