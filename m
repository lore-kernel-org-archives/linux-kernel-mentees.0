Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2FA22257B
	for <linux-kernel-mentees@lists.linux.dev>; Mon,  2 Jun 2025 14:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748875411; cv=none; b=RLH+9SDkNTDJgwab1Dw59QLxuk2Hk8niiavXMJZTDxzrwV9LmQuBAs65L5A1RPDUQFDV8Yt049y0KJwYsrG7iR1jOAiETM3NVnQxvuwwO4vC5RMdrG4D3ASzG0z2OkD9BwJjgWhHy3fiLEC12sqi+MBnkj1HjZIrMkXJ/QKSmeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748875411; c=relaxed/simple;
	bh=7yC8mUe3M+J54KwrHUwtf8a40GQET+WZucGHxfgArQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IYFDv3ot52At3mDYYI+qF+CduCne/+9z5S+cqfSMMT2/q2DkvGr8z/k/g9VXLjf2s/VBEcrwiADbKLR0daIiaNtFxWZaAyz3+WJuTsopPWDmp2DwCyH2ISPpiNYfpmdE+d09TCqzi3ubiJ0cSUrRVRVrfrCbJDVQXylgshMu2k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAy7Q+fI; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAy7Q+fI"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32a5eb73ad4so37512431fa.2
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 02 Jun 2025 07:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748875408; x=1749480208; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8sRLCr7yx/MIni75hw8rTaRQ6OP4AeVqvCRwGnHFnfA=;
        b=NAy7Q+fI/PM59o40bWK0WejymE+joVasoH8QZoKioQ20yVdsAuOelbyHrp7FLrUXWs
         11bNlYjaBjuQ92F7TtxqSEjXloxJVDJFMOi6MeDC0w0yrdmsTUga0FuczMSZ47+bolvX
         67ZEeAlJ+bLPpdKoqLwsWMzpXDUJInRiq52wSVaTTl3yLSekikBJ958e8uJeeFs8rGXT
         6nQ/VDnPw/BLb25n0qTu7SIMbP4wQYeq8km+c4ewLv76QuHhqThlanLIqId3gVDC2Irw
         yAWtw4PzmBZtEWccT5X5vozm2YZJEGzdFQ3njVlVYgnubdPrvz8R5O3bns0qRyeyEUwo
         IV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748875408; x=1749480208;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sRLCr7yx/MIni75hw8rTaRQ6OP4AeVqvCRwGnHFnfA=;
        b=iH1UaLeOexf8U886eYFMrbN12HaHjXY45B6wx4e0S0H+ksyDQ0ypkVWJ3bemAI6Ke1
         zrh7nsfa5wyq93twKjCj10fvjAWIT5D4ZJUzZ1r5gBLpDlc4DBiFA+K5G7FiDcL4FNyM
         rxWpowpTPKj8Kvqzw0qoQTa2JPvc8cb0oZ92wdV58bLDBMLc64iumB01PNw1NDSOmdME
         m9re7bU38qd8+XfyNdJCo0mF98Y5F/dYm/99oL+eNx3O7r5bndOTJcbXnx6OnHY8Vrr/
         Op8veqGsUPisi+UEFpgMW6mGgVmeT/+Bh4mV0OE/BpGYE1dnsb4BtEwxfzeACrlJQoOv
         3y+w==
X-Forwarded-Encrypted: i=1; AJvYcCVfzp2CUNyfGj3acOlooKOH4c2zeycKXbagGfyXxIrbnKw6xwmg3X3M2RXDLjLYR1MfoOlxEsh7dUr5bvO8VVNIQf9BAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCIYqovUc0sX84724Z/INCmwHHKm06Boh0yDsAuulA0XzKX8Aj
	rR6SlccRB/gtrMUx5JxAGUv81E1doKozNPYthazXBdUAQIRRKNnk26LAndw+iPT3jG2mVXZaIvB
	Vrw6QhvzwyJ/vhwyeS7Vj/uGPNO3iYfFb4kaQNBA=
X-Gm-Gg: ASbGncvP0G0focvlSLBW//1PeC/y+EQ1VL+autw/WzIbS4Q8CiHp4xqQkIyg02h0wV+
	/xn+Fnc90X6fhPQH/q3yFXas7jeG3gKw9qXhj3exeOrV9PvjT+wBb4jNVrwH+Z3A1bpPyhcB7fH
	0lsSNt0l8GjiqKlDCP9cjI7AW086gHFPFx+aNs4KNNktQAIupr/oAGcT/W1tQYHIeeiJOJtG37H
	m/TGg==
X-Google-Smtp-Source: AGHT+IEEcH+4OLZzCssFzfwa/cKP04dOQbVZS9DKOiJVdgSrGkQ0Fps7ZkZnqqJcxvfYZLHPVGhPVzV1C2bpZmGOxDI=
X-Received: by 2002:a2e:ae1a:0:b0:32a:7826:4d42 with SMTP id
 38308e7fff4ca-32a8ce1a85dmr33732011fa.31.1748875407557; Mon, 02 Jun 2025
 07:43:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250602135932.464194-1-pranav.tyagi03@gmail.com>
 <EEF63CCD-BEED-4471-BF07-586452F4E0BE@kernel.org> <CAH4c4jJYxXr=Q_cWCmDrRyWGEHnSfyOzM1kWCBWUC+jSXFafpw@mail.gmail.com>
In-Reply-To: <CAH4c4jJYxXr=Q_cWCmDrRyWGEHnSfyOzM1kWCBWUC+jSXFafpw@mail.gmail.com>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Mon, 2 Jun 2025 20:13:16 +0530
X-Gm-Features: AX0GCFsctWBBCiIn9aID_uSBMZ7fA1PXMIhUWRhKJ7qfTF05O2WXmZUCcCzjZiw
Message-ID: <CAH4c4jJ_jKmPPOVfKKBbQzsQesNGdYbz4AWb9ZVZPpPEgtOP_g@mail.gmail.com>
Subject: Re: [PATCH] net: randomize layout of struct net_device
To: Kees Cook <kees@kernel.org>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, keescook@chromium.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 2, 2025 at 7:52=E2=80=AFPM Pranav Tyagi <pranav.tyagi03@gmail.c=
om> wrote:
>
> On Mon, Jun 2, 2025 at 7:37=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> >
> >
> >
> > On June 2, 2025 6:59:32 AM PDT, Pranav Tyagi <pranav.tyagi03@gmail.com>=
 wrote:
> > >Add __randomize_layout to struct net_device to support structure layou=
t
> > >randomization if CONFIG_RANDSTRUCT is enabled else the macro expands t=
o
> > >do nothing. This enhances kernel protection by making it harder to
> > >predict the memory layout of this structure.
> > >
> > >Link: https://github.com/KSPP/linux/issues/188
> > >Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
> > >---
> > > include/linux/netdevice.h | 4 ++++
> > > 1 file changed, 4 insertions(+)
> > >
> > >diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
> > >index 7ea022750e4e..0caff664ef3a 100644
> > >--- a/include/linux/netdevice.h
> > >+++ b/include/linux/netdevice.h
> > >@@ -2077,7 +2077,11 @@ enum netdev_reg_state {
> > >  *    moves out.
> > >  */
> > >
> > >+#ifdef CONFIG_RANDSTRUCT
> > >+struct __randomize_layout net_device {
> > >+#else
> > > struct net_device {
> > >+#endif
> >
> > There no need for the ifdef. Also these traditionally go at the end, be=
tween } and ;. See other examples in the tree.
> >
> > -Kees
>
> Thanks for the feedback. I will update the patch accordingly.

I also wanted to know if the __randomize_layout can go in between
struct and net_device as ____cacheline_aligned
is placed between } and ; at the end of the struct?
> >
> > >       /* Cacheline organization can be found documented in
> > >        * Documentation/networking/net_cachelines/net_device.rst.
> > >        * Please update the document when adding new fields.
> >
> > --
> > Kees Cook
