Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D2084FCC
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Apr 2024 13:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712066389; cv=none; b=UhsJJv2UugkWjqDrgMHZUY9jvl90ZOs9QwQwFSY5CjsypJR+lftnPGrFZouXq+YQjoGw7hbiqboA0SvzAGo5WSK3kDi8m0nGVa8MfIzyt8/BBS+4a0GywSI3L5vICNKJz6TmFF4qHaTU/UpQPyjuOSxGU2qlhGm3w7kPme0djPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712066389; c=relaxed/simple;
	bh=42K8nROeT6dOc/vahsjMTQ2TJejhqqvIR62/11kWiD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TXctqJ6kvQj3QkYG59hBPj2z3cuf8TkIxH40WeToLErWzxqIs/2UNMYQchpW6NhZLmwcLx74qEFpB2Ik8C+66CXaj/19AwgAMgrltSwEnErvUr18Q0pB6TJx7F8Gn7p0R+r65bQLWMaP+IuTuezHEz1Q1gUbHecVFrdbF9aq1pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kEMIfY5K; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kEMIfY5K"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 441AF60873
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Apr 2024 13:59:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkcmJuorX3su for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue,  2 Apr 2024 13:59:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=shresthprasad7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7FFFD60810
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FFFD60810
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kEMIfY5K
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 7FFFD60810
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue,  2 Apr 2024 13:59:47 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-2a1fdcc3659so3815701a91.2
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 02 Apr 2024 06:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712066387; x=1712671187; darn=lists.linuxfoundation.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uuuVrZPyzr64KS5dQg/A1NNJWj7HElaPDjPANjVr5sU=;
        b=kEMIfY5KBLiCTES2lUVMp6tNkt8S/W4tPT7S4yB5L9ukVG/afg7dSkhNxbInGxUmvQ
         g0iTUjRIPqS25cKb6kuYQ7ocLkGD/tI94xHM+mvdAEPS4KKy4L1mMbWqLfD/yin2/6ao
         HTy0CqZKM6fg6EiQ3QFi8IpuGvzLvWKBieWZc1A2NbK5KhP3tgU1CI8FZtw1MDrMfG+s
         sGrEPnGK0KwqlsN5QMsKxdC77gCIu6FjzLU2slcAJP4iTGpQG3NAfM1K5KtbAPKaCEp9
         XKna5geGdgPwgYxWIpdSW81PKA5/05XIDrUOklgquI3XHgYRkFoI59pMz1hV6Lt5dILT
         0gCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712066387; x=1712671187;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuuVrZPyzr64KS5dQg/A1NNJWj7HElaPDjPANjVr5sU=;
        b=GqapCT9WCvicoG5IABjyUCHRv1OB+y03fEmbpt3ELwjyPnuEPpCKPdTW8x5CHIUR9F
         XtraZJEyvo7CjjKMmfqM09SuNO1z5J89SMz0goZzD7oyxv4jLjYOF2cIf8sssfwRGRfs
         k5E9aAQQuzzOhJlLT5SCDTSxlH9qGdJItfkoAAUpVrE7dTqZAdy0CdYpj72Qhx+izezr
         PPFM+f5G9LNFb5dpKCNKkqWULSkfSBw9BXFXhVU2oESlTOgjv+b7V0Vinlfydcg7pjAN
         SRNgfBLJJUjhlTtviS2yBno4VAlKfvr8CUhpFwwKjfoDkRBvjm0Z2JAYwq/BhyBcQcAN
         Cl/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVLSlzXmdBSnXWRJhmESpH2iwM0hto/xct9kqye7lHUcIxawJIaHRsWXIG/T8MQHZJ9IGL4RfqNYH0Z1JKKeQrERgBLuwdaYeqPICFW5TJV1zumF4EvPRE1fZUIThNL
X-Gm-Message-State: AOJu0Yw3D1S1OUkcAtm2T4e5K+gCbOI++RxPfdeRgO3LoV+7DQDgF4fd
	1h/S9X5URaUcDMlFwCP5ATDTx9mT9PD+TK9g9Qnt+U2v1a7c6xfa/uIAbs/BwH4RXxCYti3EGxe
	5pQ7mYlNv+WzoCw3wtaMpayakqEM=
X-Google-Smtp-Source: AGHT+IE6qUICTNOSpzFpnEgWw1aZpDkMOxwpZZfJ7CwYPASbAghPZ0S5E/rKol7m6M75I5a3WTJVLsqMMIJoZuFdjsI=
X-Received: by 2002:a17:90a:4294:b0:2a2:3223:1903 with SMTP id
 p20-20020a17090a429400b002a232231903mr5147022pjg.47.1712066386686; Tue, 02
 Apr 2024 06:59:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <z2ewk44rjutv24i6lqau3adrmlprj524ulqtqbncvfaj44dwcg@2dnnbm75abbp>
 <72dc90fb-79ef-4dd4-b30e-97b1e7058156@gmail.com> <qnljnwccqvqzilxuoat2s6md2zwcuhfruzbpepxebk65k34t3g@cyl67lk5lsoe>
 <fdc25599-f8a7-4d66-9535-494de8439da0@moroto.mountain>
In-Reply-To: <fdc25599-f8a7-4d66-9535-494de8439da0@moroto.mountain>
From: eretmochelys imbricata <shresthprasad7@gmail.com>
Date: Tue, 2 Apr 2024 19:29:35 +0530
Message-ID: <CAE8VWiJbjQ-LmeNRsVkXtTEbytqux-7Xv0c5JT86=FSxemgGSw@mail.gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: align arguments to open parenthesis
 in axis-fifo.c
To: dan.carpenter@linaro.org
Cc: christophe.jaillet@wanadoo.fr, frank.li@vivo.com, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, luca.ceresoli@bootlin.com, me@wantyapps.xyz, 
	prathubaronia2011@gmail.com, robh@kernel.org, shresthprasad7@gmail.com, 
	skhan@linuxfoundation.org, u.kleine-koenig@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

>No, we're always taking patches.  You just had bad luck/timing where you
>sent the patch 2 days before Greg went on vacation.

>Greg is back now, but I imagine he has a long list of stuff to catch up
>with.  It's possible that he also accidentally dropped your patch
>because of the vacation...  I could imagine a situation where that
>happened.

That's quite unfortunate. It's good to know that you guys are still
taking patches tho!

Regards,
Shresth Prasad
