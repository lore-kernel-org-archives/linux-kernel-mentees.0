Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E321C5D72
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  2 Jun 2025 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748874156; cv=none; b=hlxjhkmtPR2L4Y4gLGvuTpXpgRJdbL2JdP+MyRi8vWx9nmLKU3eXTYJQFAdJoXMvC4qd39Nxlx1TeQ8vvE1AlfaIjcOHm/8fVRloiOy5QJENQfbZ3kgNFGfMGYjA0yIW7ahN2/f/j4i8RJgQ9OoJD8a3cVM/c+9S3NKuoBRRtR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748874156; c=relaxed/simple;
	bh=4asGXC+3cQS1Vtxvk8QtAW0Q9zZdEBvNR6Cj25g7FHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoYdBFuutvm6aq4HIPB5ykEnGwxjelICRDZOXb1Xvo1+o8AtE66UX3cajLwwdjaPYwnb0bQApaF6odJQmDdYlxcbl1KaccLURk53o+hCSrgQHiXVJZqyCMPMSFCU8h7KQR7mIyNR4+IOyICjU85sE6nLjnYPrwr+3e+m1okorgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORH50qg+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORH50qg+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30f30200b51so44189631fa.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 02 Jun 2025 07:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748874153; x=1749478953; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YvWTXPKPlqF0Qo0JqfM4yt9Sti77l2uaO9tTuXi5U5g=;
        b=ORH50qg+y4FavOsN3jOr1xDyx1Mow01uEkr1gcxbZu89qq9UpSOkOCMFKsO6unM0rX
         pWySAJusAaapY+7bmQWxw5bgVO9xxZ5aP1qXsAA7wgYNCDxWtSJWH6DlfyqOajAhh0Ta
         H//4GEB3+gH+zIKu9Yv+nFjTwR47gvPbgJXpGDJAAUixlFvditEmqRnUexKi1cJT4ebe
         0UF6EG+YTNF4eCTOkVxflBjaOCtJs+DN7T+KF6MMtZOA8kBLDEhwNPN/cALcYmO343Ey
         I/3Ar+JeXILNI5KuXvfUObNLZobKBcfz7Wzj4ZbgSNt6xlv71QvPiDCovjUyvslhbns+
         15Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748874153; x=1749478953;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YvWTXPKPlqF0Qo0JqfM4yt9Sti77l2uaO9tTuXi5U5g=;
        b=YVfhWg4HFSFzEf+mlZfCF+JE0G1TMJ+NzjfNtUGp/mlUmlCoTZEOEOlcqBxY8o21gD
         oem+cqETIf9yVmrqnFC/gEWotZBbOVwiYIS27/rac31DQJgr1Vun0/6rnxZVaFLoR6I4
         FBCwqpUqror5wSSF60gPB9NEENHK0t8OqVAWaVjasRgs/gnZTL301ElBoqj9u0vtuJXo
         qFUxGhHQaQEG2338JR0hoEaAp6clyjPmS/TiD5OoRYOCpfnQTIIvqqTL+pTf0VOSjhH3
         rHoUPtFGZEne+6H9RcHQXlFzxaN7hs2HhQz/V0bUaZA5JKAJIDkYOXPFDgVAkuiJgRYf
         kR1g==
X-Forwarded-Encrypted: i=1; AJvYcCXSUScbabIgfpizjjho2aIrHxo+iTLhjtHYBec3o0ybqMXpA9CIFI/rmTY/J3Bdwt2S2+VCD/oMDsd7oa09+aZ1lQCa+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzFm7+fZW0UR0iprp89Fm6FZvw1fh4Hr2iBQntH4/38eImx55Bo
	j4woDf8L+CdbTqWnnvEpaUT2ZkSQ1xJAeSLta7Sdm7FpuyA1PnPicPDXTo4Xqn1JTD+NdJRsS46
	n6H09lPL3TbOWKVJMOF7FWvgxCEtBbCc=
X-Gm-Gg: ASbGncv2b2dMZ2+4YUZr3y52eAcuNMIx4WlOJbTtK3kab0PSYsbenPbyh2h4VErcrQl
	OwnpvcqWerJZa0DtQha7rj9sPyURxTC0Bf8fow+/KINI1BZdUpZrKU5NZpqxLywmVdHSQ0K3wIS
	JI8ysGGkpCon7DlayH51kdJpouX6xpM8ORWx45EyGZg/sANdYfyPvu77p3KBh6NiAlqcYJOqUJ+
	o9RGQ==
X-Google-Smtp-Source: AGHT+IHmMQ5umwgAaQsxy+DfEQa54r62K54cfCeV/2DUTHutNDjoygIf/pTFf55KcmMrjin8z35F7WklY2+5DsgGAZY=
X-Received: by 2002:a2e:a581:0:b0:32a:778d:be86 with SMTP id
 38308e7fff4ca-32a9ea675c3mr23004991fa.31.1748874152720; Mon, 02 Jun 2025
 07:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602135932.464194-1-pranav.tyagi03@gmail.com> <EEF63CCD-BEED-4471-BF07-586452F4E0BE@kernel.org>
In-Reply-To: <EEF63CCD-BEED-4471-BF07-586452F4E0BE@kernel.org>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Mon, 2 Jun 2025 19:52:21 +0530
X-Gm-Features: AX0GCFth8659Ha8JYy7z_o7EgLsVB1j9purYjddl2or_1vq465S9rAnAtkqnsAI
Message-ID: <CAH4c4jJYxXr=Q_cWCmDrRyWGEHnSfyOzM1kWCBWUC+jSXFafpw@mail.gmail.com>
Subject: Re: [PATCH] net: randomize layout of struct net_device
To: Kees Cook <kees@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, keescook@chromium.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 7:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
>
>
>
> On June 2, 2025 6:59:32 AM PDT, Pranav Tyagi <pranav.tyagi03@gmail.com> w=
rote:
> >Add __randomize_layout to struct net_device to support structure layout
> >randomization if CONFIG_RANDSTRUCT is enabled else the macro expands to
> >do nothing. This enhances kernel protection by making it harder to
> >predict the memory layout of this structure.
> >
> >Link: https://github.com/KSPP/linux/issues/188
> >Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> >---
> > include/linux/netdevice.h | 4 ++++
> > 1 file changed, 4 insertions(+)
> >
> >diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> >index 7ea022750e4e..0caff664ef3a 100644
> >--- a/include/linux/netdevice.h
> >+++ b/include/linux/netdevice.h
> >@@ -2077,7 +2077,11 @@ enum netdev_reg_state {
> >  *    moves out.
> >  */
> >
> >+#ifdef CONFIG_RANDSTRUCT
> >+struct __randomize_layout net_device {
> >+#else
> > struct net_device {
> >+#endif
>
> There no need for the ifdef. Also these traditionally go at the end, betw=
een } and ;. See other examples in the tree.
>
> -Kees

Thanks for the feedback. I will update the patch accordingly.
>
> >       /* Cacheline organization can be found documented in
> >        * Documentation/networking/net_cachelines/net_device.rst.
> >        * Please update the document when adding new fields.
>
> --
> Kees Cook
