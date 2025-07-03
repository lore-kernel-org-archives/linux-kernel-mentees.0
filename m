Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A492DE719
	for <linux-kernel-mentees@lists.linux.dev>; Thu,  3 Jul 2025 09:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751533339; cv=none; b=TifGB9hgjjkFLpQDa8i8r8hZTneGwcd1DGFC+b+1HIuTTU5WK9ILhRuyAzIMfLPwXGDhH65s9ZGOWjhTS/LqIWhUitRL4hI0vvopzWVaA4TOpZtEZ22XWSb5O/4DWLPE9vOOvinUw79OWbUsWOAds+ksOIq5Q79fmAvljLI9ndY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751533339; c=relaxed/simple;
	bh=r9iNBHzBMwWsOC2LNoiI/v8Ks+Adv9SBboC7T9eoqaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6KiExIh5g2KI4wnKn6MNs4rD3m+l7u9wNXCPJo6z6ALFPut65hvcZ5ievSCArVO467yVnfUT3ZLeatIFJLO6WQpw7zj/YSy54NtrrBFP44GrCTaJTKgzom6eG4y3l9CWS9clkBmRsF4eCI6QPEq7mX108yBtEi9TF327RwqIYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ANn2Z6dG; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ANn2Z6dG"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70e4043c5b7so52626207b3.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 03 Jul 2025 02:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751533337; x=1752138137; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dua4EX6vICZ4ncNmnpExr5W8cwU+tQuHJtXdNhi/iGU=;
        b=ANn2Z6dGAfoOXuvMVbhtPBoOt2t2MTmdxT9EhkQ1XibjIb3O0x7b738q6JxEhPQFkI
         jXrO5YI7hH7E9GqjIHiEbhEGKLwYPFpjNfNDurebCHoJKas7c7LUPaGj/anQalZ/DbKo
         ZjZMqpYTnl+eCiaIInz9VBepvEIRyvfIBLjjRBDXadDiw5TP8SjpszIiCnRjpystrOEY
         oru242zhYtm9cfztuzEVpbGsAtAolEYkmd8ZIwCVf06WlfZb37TNcWnAIF1CXkPveneC
         6YHhJlcWKRRU1hvDilfIj2CgJZtAkVxQYRND+DodYAdeUGYLEWe+O9oTjc4Rzhk692Bo
         hXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751533337; x=1752138137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dua4EX6vICZ4ncNmnpExr5W8cwU+tQuHJtXdNhi/iGU=;
        b=O5EHt6AxkZcFBzqFMPQ2DvuMQYCyY2eULe1Li24Ra/9O+bEVagepBkgmCObfa0KJUF
         xpJO2ibGFYpyhjfVg9IfvvP4NTMqbqiZxh4jUXRsjcHg0Uen1C0kyLow/aAe1SPR9+qe
         x/qxieMrirmUtvMyoilt9YNF1gWLlBg5Yxv5Dvzf/YV5nFRzo93w6175Rxvwa7zgIg6d
         0OiG7br6nD9gZZ4wescWDe7lqw3dYuHunfVmQGwG0L9ZOqIlVURVPPM2pPvPikPh6hEm
         qWkXSYh8phh/qFKl/Zo2n7gLxjiWBQRG9MK5mWiK36NbqmEingkxtY7hpqDlF+ScDRTP
         5BVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnodeZGfd8OV7JWWxqbZ/Va/PGA8G99plWKLQef5KRXCQNKyIayxFtvV1qaSFZgsewbtHRLz4a9ermfQd++uSQKOKCOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7vs/Tyz/+AuGA/cMv94cDIBgibgnc46soYK178V9b9qnYgAKi
	4x4l2qftA2mxjSNmRY0pRkb1lavT7jdlrQcJ03TPVxdONLMFbPG6NPaEFujkunql/ac42giiZb/
	Y/OXI4bvZqQws+N515tbu5DZjNtUVV7U=
X-Gm-Gg: ASbGncuXt88IqOJy/9ij9/QIIB4OD4+6oe8r/Hg1nO/uOuj6tn0nnuDCEOINEdtHopt
	ir3s1++WDxaTbFbiFtM9OHF5K34d63AOyl2kWFGAYB23WZyCh4MvBESXIwhGjjmEzjFCEpZj4oX
	DkJx3H9pkkMTHHZjIa1xomcEg248bOSEhpEvJiMxME6rJNV0qVTusOShmWuiuRjD29WPpHEVJs3
	1rq1jI5pzcjacY=
X-Google-Smtp-Source: AGHT+IFPagC/bJXD/I8xAFfYmmHWH8z3OLkpesDap76h+qYDoOuGP8g36pSAUapeCBHboIP7KJtMiM5WqD9+MQ8t/7I=
X-Received: by 2002:a05:690c:fcc:b0:709:197d:5d3c with SMTP id
 00721157ae682-7164d2c7e12mr90141507b3.11.1751533337096; Thu, 03 Jul 2025
 02:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250702065908.430229-2-moonhee.lee.ca@gmail.com> <DB29OMQH4W9Z.1GPKEZBBIRSTS@gmail.com>
In-Reply-To: <DB29OMQH4W9Z.1GPKEZBBIRSTS@gmail.com>
From: Moonhee Lee <moonhee.lee.ca@gmail.com>
Date: Thu, 3 Jul 2025 02:02:06 -0700
X-Gm-Features: Ac12FXxcX-6zWRjtsp0bKhB4_ffVbC4IS-cAUihVV3UL7VYsPXyWVqyR0taTsEQ
Message-ID: <CAF3JpA7wM4JBdd6OvGS+hmv0UahcW=h4HrPNDwRNhduk8iKsWw@mail.gmail.com>
Subject: Re: [PATCH wireless-next] wifi: mac80211: reject VHT opmode for
 unsupported channel widths
To: Nicolas Escande <nico.escande@gmail.com>
Cc: johannes@sipsolutions.net, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
	syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

On Thu, Jul 3, 2025 at 1:12=E2=80=AFAM Nicolas Escande <nico.escande@gmail.=
com> wrote:

> Is this really specific for VHT ? or for HE /EHT as well ?
>
> > +             switch (width) {
> > +             case NL80211_CHAN_WIDTH_20_NOHT:
> Because this seems weird for VHT
> > +             case NL80211_CHAN_WIDTH_320:
> And this did not exist for VHT either
>

Thanks for the feedback. The intention was to handle VHT opmode notificatio=
ns,
as noted in the commit message, but the check incorrectly included widths t=
hat
are not valid for VHT, such as 20_NOHT and 320. I will update v2 to reject =
any
invalid widths, not just 5 or 10 MHz, and restrict the check to the valid s=
et
for VHT: 20, 40, 80, 160, and 80+80.

Best regards,
Moonhee
