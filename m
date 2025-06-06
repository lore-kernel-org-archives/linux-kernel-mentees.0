Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7A528AAF8
	for <linux-kernel-mentees@lists.linux.dev>; Fri,  6 Jun 2025 15:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749224590; cv=none; b=UdUMAj0e4Qg3qidGIWlOFykMzZHEZFyPd1DyGE6dx2pMz75D8AI3jUbSgB3aqCUUkaXHFygLW9RjrCuFPL+PzhyMCen6YBM11f/etiPZE3RutZiwFS+1lXj3ZXvQCoVb7pyZB7ROQxSpOvKBvjez7KydEoQVO7HqaLh/+gCIbls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749224590; c=relaxed/simple;
	bh=BssSf538SCQ3bExCodfPwCOVcFqz70KXS8ab1xagiEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hK8hB4+SGdrv4z3IE7Nt2HNV75hBbswahewz+3xUDkm7wzzy9BfWXqcuNxsTA56/EHKxfzswJx1hIY3VPcYA/zqFg5pKYbEuQXE/sfXj/wRTZlo0Uyh2+hWaqPGZX4Xk2quxJraBPbzWINFWiF5/B2Uw7VUrzNgCR/3O3jqVOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wd9z46hN; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wd9z46hN"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-406e31162c6so729038b6e.2
        for <linux-kernel-mentees@lists.linux.dev>; Fri, 06 Jun 2025 08:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749224588; x=1749829388; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=atBrsiBQdovA6XQSD3owooH8KFvjiwxKuYkfC+ytQP0=;
        b=wd9z46hNidNnnimM9MI+6v4ZL2YjcLMGDGCafQudD11S/i4fc/trLdzo3/ZVtK4sEt
         aMJ16ZxVuUzC1lTDygJYp+KA8THmPxGkxKt73bTG0ZJAQLtSsc7oIgT7DlCYBwFTMRnT
         jz79Ygl4QGGnBPD4iQJCbeeYGG+jYQYcHGRGk8gLJhwdCVhkn6+u8hSKRKjprun6YuHJ
         wpG3n6n+pf1t20CSFwdFX/8n6060IpTgyNCaiCFDRmQWI6EPIt7z6sSnl0kkAumV6Ewk
         +nnKY2jABg8o19jVZHwcL51CwBXy32DsRyL6lh3aGvGT8e40YER/140AWWBkh/2FMV2q
         LP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749224588; x=1749829388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=atBrsiBQdovA6XQSD3owooH8KFvjiwxKuYkfC+ytQP0=;
        b=OFMiwQzVs18xBHa34A3ycH6Hae0BLC8JlFaFYsZBQeOJ8Edbapk4ex8Lkg6nrVgrsM
         b6qTFPwypD1XPdYabDvslz7/tOYq9JGMPsJx28zksU1Z3C3gPsz5sxkmgAjKOPk+4hJt
         KQbIcYVWisQU12W55d1xwavd4HJwq0Xh+lEAH0ZvEt80vHDuyyUKfG3x2oFIbBCmZpDZ
         ueHMbIczYTp2Zvfc7Ta0rfL1VVj+5Vnp+GVxQyBuapOq7O4a17dwv6cUATP+rbLdGoDq
         rz7cmTH0s8u2GK/PbEhSCQIVI/3Ot3BwvgKfkFIy5eVlg6yjY9Rp7sudOfMjNJwvG3ZX
         XcMg==
X-Forwarded-Encrypted: i=1; AJvYcCUVEIaRVlB4cge0Z+zhVEC0mBjN/KOgQg4rdbVW6guZYeaKXIzpwaFhJ9kSTnmCt8vP1ACJU1IA+zY2imcwVM9f7dup9g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz71E9E0Rr7Q9kdPpMunU22bip26F4ij3ILJpkDoOP7uUSnrg5F
	jAkVKq4lQgJngAykRrcEQNGgKY1uFgQAcf7AN4VILHFP+7bd/iG9uC/bIxJxPsw54jDu7V5JHMr
	vFPCgBUSeQ4panqeu1ScfONaRkJouwSplX6aSWLk0hNo1i0BAbHnpyJhw50Q=
X-Gm-Gg: ASbGnct1SHqCleqz19XuFd/hJ4Y9+wKEIKvv+JxlARwW+7RMO1BosCF3OnygP5p609U
	TDLCNzDE+W5s/W2/YF8QAtY/qE2cxVSG5JqXYvagn+n94o0uctpFyv9lZkKJtnV1vUbcG60GqAk
	DLn/HUChBI//bx4Cc61AF2pKQ9vLl4rkln1nWPFW05I34=
X-Google-Smtp-Source: AGHT+IFwZt96R27Gw8zd/WO1DCWRNwmmGO5Su5CRhGAMCitk7Zp+EPKl0GeXrmi6Y9mF2xBgCReQybypIDNLM8S7cR4=
X-Received: by 2002:a05:622a:5c16:b0:494:a2b8:88f0 with SMTP id
 d75a77b69052e-4a5b9d7a923mr72974071cf.33.1749224577010; Fri, 06 Jun 2025
 08:42:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602135932.464194-1-pranav.tyagi03@gmail.com>
 <053507e4-14dc-48db-9464-f73f98c16b46@lunn.ch> <202506021057.3AB03F705@keescook>
 <25d96fc0-c54b-4f24-a62b-cf68bf6da1a9@lunn.ch> <CAH4c4jJRkeiCaRji9s1dXxWL538X=vXRyKgwcuAOLPNd-jv4VQ@mail.gmail.com>
In-Reply-To: <CAH4c4jJRkeiCaRji9s1dXxWL538X=vXRyKgwcuAOLPNd-jv4VQ@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 6 Jun 2025 08:42:45 -0700
X-Gm-Features: AX0GCFu5bBYumsgogodK6DnGqjj3NSYGozTewcVjea7gPo9oQSX8_BL5MzVZrmc
Message-ID: <CANn89iJR1i3hhXrkDNtXyPCNUj1KmrTAff2=pcuYNsXBxogNpw@mail.gmail.com>
Subject: Re: [PATCH] net: randomize layout of struct net_device
To: Pranav Tyagi <pranav.tyagi03@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Kees Cook <kees@kernel.org>, andrew+netdev@lunn.ch, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 7:55=E2=80=AFAM Pranav Tyagi <pranav.tyagi03@gmail.c=
om> wrote:
>
> On Tue, Jun 3, 2025 at 12:36=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrot=
e:
> >
> > On Mon, Jun 02, 2025 at 11:03:18AM -0700, Kees Cook wrote:
> > > On Mon, Jun 02, 2025 at 04:46:14PM +0200, Andrew Lunn wrote:
> > > > On Mon, Jun 02, 2025 at 07:29:32PM +0530, Pranav Tyagi wrote:
> > > > > Add __randomize_layout to struct net_device to support structure =
layout
> > > > > randomization if CONFIG_RANDSTRUCT is enabled else the macro expa=
nds to
> > > > > do nothing. This enhances kernel protection by making it harder t=
o
> > > > > predict the memory layout of this structure.
> > > > >
> > > > > Link: https://github.com/KSPP/linux/issues/188
> > >
> > > I would note that the TODO item in this Issue is "evaluate struct
> > > net_device".
> > >
> > > > A dumb question i hope.
> > > >
> > > > As you can see from this comment, some time and effort has been put
> > > > into the order of members in this structure so that those which are
> > > > accessed on the TX fast path are in the same cache line, and those =
on
> > > > the RX fast path are in the same cache line, and RX and TX fast pat=
hs
> > > > are in different cache lines, etc.
> > >
> > > This is pretty well exactly one of the right questions to ask, and
> > > should be detailed in the commit message. Mainly: a) how do we know i=
t
> > > will not break anything? b) why is net_device a struct that is likely
> > > to be targeted by an attacker?
> >
> > For a), i doubt anything will break. The fact the structure has been
> > optimised for performance implies that members have been moved around,
> > and there are no comments in the structure saying don't move this,
> > otherwise bad things will happen.
> >
> > There is a:
> >
> >         u8                      priv[] ____cacheline_aligned
> >                                        __counted_by(priv_len);
> >
> > at the end, but i assume RANDSTRUCT knows about them and won't move it.
> >
> > As for b), i've no idea, not my area. There are a number of pointers
> > to structures contains ops. Maybe if you can take over those pointers,
> > point to something you can control, you can take control of the
> > Program Counter?
> >
> > > > Does CONFIG_RANDSTRUCT understand this? It is safe to move members
> > > > around within a cache line. And it is safe to move whole cache line=
s
> > > > around. But it would be bad if the randomisation moved members betw=
een
> > > > cache lines, mixing up RX and TX fast path members, or spreading fa=
st
> > > > path members over more cache lines, etc.
> > >
> > > No, it'll move stuff all around. It's very much a security vs
> > > performance trade-off, but the systems being built with it are happy =
to
> > > take the hit.
> >
> > It would be interesting to look back at the work optimising this
> > stricture to get a ball park figure how big a hit this is?
> >
> > I also think some benchmark numbers would be interesting. I would
> > consider two different systems:
> >
> > 1) A small ARM/MIPS/RISC-V with 1G interfaces. The low amount of L1
> > cache on these systems mean that cache misses are important. So
> > spreading out the fast path members will be bad.
> >
> > 2) Desktop/Server class hardware, lots of cores, lots of cache, 10G,
> > 40G or 100G interfaces. For these systems, i expect cache line
> > bouncing is more of an issue, so Rx and Tx fast path members want to
> > be kept in separate cache lines.
> >
> > > The basic details are in security/Kconfig.hardening in the "choice" f=
ollowing
> > > the CC_HAS_RANDSTRUCT entry.
> >
> > So i see two settings here. It looks like RANDSTRUCT_PERFORMANCE
> > should have minimal performance impact, so maybe this should be
> > mentioned in the commit message, and the benchmarks performed both on
> > full randomisation and with the performance setting.
> >
> > I would also suggest a comment is added to the top of
> > Documentation/networking/net_cachelines/net_device.rst pointing out
> > this assumed RANDSTRUCT is disabled, and the existing comment in
> > struct net_device is also updated.
> >
> >         Andrew
>
> Resending to the list=E2=80=94my previous reply was accidentally sent off=
-list.
>
> Apologies for the delayed response, and thank you
> all for the detailed feedback.
>
> Regarding the concern about breaking functionality,
> I did compile and boot the kernel successfully with
> this change, and everything appeared to work as
> expected during basic testing. However, I agree
> that this is not a substitute for thorough
> benchmarking.
>
> You're absolutely right that applying
> __randomize_layout to net_device will shuffle
> structure fields and likely incur a performance
> penalty. As mentioned, this is a trade-off that
> targets hardening over performance. It's worth
> noting that CONFIG_RANDSTRUCT has two options:
> RANDSTRUCT_FULL and RANDSTRUCT_PERFORMANCE, with
> the latter aiming to minimize the impact by only
> shuffling less performance-critical members.
>
> I=E2=80=99d appreciate guidance on which specific
> benchmarking tests would be most appropriate to
> quantify the performance impact. Based on your
> suggestions, I plan to run benchmarks on a small
> SoC (ARM/MIPS/RISC-V) with 1G NICs. However, I
> currently don=E2=80=99t have access to high-end server
> hardware with 10G/40G+ NICs, so I=E2=80=99ll start with the
> systems I have and clearly note the limitations in
> the revised commit message.
>
> I=E2=80=99ll also update the commit message to reflect the
> security vs performance trade-offs, mention
> RANDSTRUCT_PERFORMANCE, and add a reference to
> net_cachelines/net_device.rst to document the
> assumption of structure layout.
>
> Thanks again for the thoughtful review=E2=80=94I=E2=80=99ll revise
> the patch accordingly.
>

Do you have evidence of added security on this particular structure ?

What particular bug could have been avoided with __randomize_layout ?

Most distros use CONFIG_RANDSTRUCT_NONE=3Dy, I do not think
__randomize_layout has a future.
