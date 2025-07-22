Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D39279DDB
	for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 16:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753201708; cv=none; b=OV2nx8GXGfuoL7w8oAkMOAlLWLa8vc7lsMyMQVVJeGKbSaSEY2kfhkuyaaY4kgZoBtgqPPMT6TLIknGahzis1QjezI9JXA2ZO9yFhFHoXPbwlbNA5+at/X5Fv7s2BlakxmLyqlGESq6CzhHA8fUqio9aNFhhNNUpmBZR+xZRbm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753201708; c=relaxed/simple;
	bh=2ngJ2kRGxmj//2+PG4hWPab7EQBzvrPtsys183PFZbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gIfb6cdZJ1dYHk/yYvFpCEIfN64Ty4Ly0kh1T/VnjiVG6kJEJdUDOj1sV3uSie5p3oByhIV81Adh5SzSjbhk7EAKaE1hLT2Oo7FVxegEGUbCKqMEIRa3/OVLkkj5Vuo3spX4PPyBkd0fFVQExbUz7uOKufU5HnIZfSWSO4eTPfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WllWvn3D; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WllWvn3D"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4ab63f8fb91so49069691cf.0
        for <linux-kernel-mentees@lists.linux.dev>; Tue, 22 Jul 2025 09:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753201706; x=1753806506; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9sCVh46Bww8YRXEQZffVRJrwKL4AozPZ8WZKTowec4g=;
        b=WllWvn3DmIuWDY9ndNqRQuRPtkZioAxsI3vnq9kVRIZz1n68ny8uTU6mjVqRB1ymz/
         rSpZUz5ViFZ1MDSCRgRMh8yfpZHCGkTo0peKddeNWE1GeTglb9FQeEgTi9g9ZyNPVzkH
         YfixtKbLt7C45AFnSg1K9z88U252wXWDV/wxFKtWx2mBM8aKt19YnJSbXgxtQZlWYVos
         Ak/ZdphwPQhGITYHfcm53nh7CDcaYcUH1VzgHLcpA1XahyaEhhRgQXGvhEztJl6/HcEs
         7fYlVcgYFggHczPVgB2xu4FbMMYTyF9sSBK7bZ3E7ib43Id8BEHzaRTKP4T9Ci9XFv49
         x6eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753201706; x=1753806506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9sCVh46Bww8YRXEQZffVRJrwKL4AozPZ8WZKTowec4g=;
        b=h6z+01RLOvfs6Nbn9yZ1wV8ZDLJw137S0RW6zw2VBzg4xOqQXlm/RxyaqAUSdTN/Nm
         BBA17rasQs7iRBKm4SClBl4vLmMFgXISAYJDnD3BCFl6uXlr/0RmCGBSypcwdjKUWQpQ
         7mfbhDNHCp+LKc+CnJe2zWE9bG2HyrOoK05xhJNRPrynHpPPx98f6y5DQyWQgSbik5aj
         QkXUMjTuvpQNzLGNM84JHCVPMkOzWj+p/9XJvzeJP1vWGB40UTTM4z3IAgKI0dfyW/dC
         wXHY1mZX5dBdQuKdlGAWQDRhCUqLp7EV72X3BAPbNd7fKs+YanBDzXasep4pf8dCTotv
         2WAA==
X-Forwarded-Encrypted: i=1; AJvYcCVeu1++mlLQnoDWsGhpfWXFnd2W3T6zWL0T/YscwLFP71QoSrzvbXjdbYC1cI1nQUzSA0OkDwFM5SVEJOizaGkMXq/2oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZwOYf24lw6KJnlMl0mJToVeZ0CDB2eszxI7ioGozQp9DAvUKJ
	lyVZfKzjw5Rh8OdV8DKp3ljGgbgLAsCtVQ9rXU0rxkSI17fRGyNdtiGwDIdWA+OdHTxTsN2dIjN
	32NuDjty6w6/3YxVZfgJ4ozOTJx34JUxxM+u3Wn3C
X-Gm-Gg: ASbGncuVx+lTzu9T3R0Tu1/lKzE/6PGViV+bIjBo5mUj8biZ0oDAvlskbmFapRirh8T
	fLVhbuiZV7ySCch/F4IzfbtZH/8DhO8TdoyCQs3bl4ODOC0oTzESenVUO/ysFHyTBCwiKAKJoGe
	EIwyvwofgxMSAz2RcziaHjA48EyKAgJvnxl8lVvoShMPS5w06ThW22bvUb+yg1YvGAveIAIgnCC
	OlIo/oH/2/InRiI
X-Google-Smtp-Source: AGHT+IGKZynev0wRanI4s1eGTM+ft5BRNAdPwJV6J2EKTZZT9RumWxttQkZsc++d0yfo5VetxU5YpsYhHadXnkW1sEs=
X-Received: by 2002:a05:622a:15c1:b0:4ab:6e68:117d with SMTP id
 d75a77b69052e-4ab93d4837amr332784471cf.24.1753201705864; Tue, 22 Jul 2025
 09:28:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250722071508.12497-1-suchitkarunakaran@gmail.com>
 <CANn89iJgG3yRQv+a04wzUtgqorSOM3DOFvGV2mgFV8QTVFjYxg@mail.gmail.com> <CAO9wTFgzNfPKBOY5XanjnUeE9FfAGovg02ZU6Q1TH-EnA52LAA@mail.gmail.com>
In-Reply-To: <CAO9wTFgzNfPKBOY5XanjnUeE9FfAGovg02ZU6Q1TH-EnA52LAA@mail.gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Tue, 22 Jul 2025 09:28:14 -0700
X-Gm-Features: Ac12FXy4knn3eMDleOqMY1e7I4kseMX2vfET1LKRx4dKWQ_shE1ef1-YvpuilDg
Message-ID: <CANn89i+dif2qjKM6oO1o=BKutXoO6w9kWnnPfc50BDBJ7VpAeQ@mail.gmail.com>
Subject: Re: [PATCH] net: Revert tx queue length on partial failure in dev_qdisc_change_tx_queue_len()
To: Suchit K <suchitkarunakaran@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	jhs@mojatatu.com, xiyou.wangcong@gmail.com, jiri@resnulli.us, sdf@fomichev.me, 
	kuniyu@google.com, aleksander.lobakin@intel.com, netdev@vger.kernel.org, 
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 9:22=E2=80=AFAM Suchit K <suchitkarunakaran@gmail.c=
om> wrote:
>
> >
> > WRITE_ONCE() is missing.
>
> Oops, I'm sorry about that.
>
> >
> > > +               while (i >=3D 0) {
> > > +                       qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
> >
> > What happens if one of these calls fails ?
> >
> > I think a fix will be more complicated...
>
> I did consider that, but since I didn=E2=80=99t have a solution, I assume=
d it
> wouldn=E2=80=99t fail.

But this definitely could fail. Exactly the same way than the first time.

I also have a question. In the Qdisc_ops structure,
> there=E2=80=99s a function pointer for change_tx_queue_len, but I was onl=
y
> able to find a single implementation which is
> pfifo_fast_change_tx_queue_len. Is that the only one? Apologies if
> this isn=E2=80=99t the right place to ask such questions. I=E2=80=99d rea=
lly
> appreciate any feedback. Thank you!

I think only pfifo_fast has to re-allocate its data structures.

Other qdiscs eventually dynamically read dev->tx_queue_len (thus the
WRITE_ONCE() I mentioned to you)
