Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DC9264624
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 06:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755585622; cv=none; b=HdhWNvASDnA2DEEwHjKRz2x+78u2r6Tn0MfXImW398wd9U9uFzaY46xffcvCsEAGhyFSLAxa1eGIzC1wN9bR7sc3HZuTkhMgJ4e/K6+L4WnqPD2JahVyKCh+Hh0oFg6vJfBR/T4DHUqp6rq3ciwx+gRmvomEnSk9Kz2MQggegJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755585622; c=relaxed/simple;
	bh=qD0vQssPqxpj7lej1JnmRiBOzgpAai+Uu6JQSkCuAA0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seRv8Z40e9ZpDeBBPzx4X2qO3Q81RYOMEN1ZeZkOd08PadJ7ymjNps1JdGmtiCb2fluPsC3WUF9y5KCiEZYjTEJztlZDNBptfNJiCs6YspcuO+0+9YzDpYXAAaWl+YLDkDhtXmF1INsvxCjb0pgfRXZI1IYBkJRLnxDFmADbL7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SqDk+fy0; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SqDk+fy0"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CF5D60857
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 06:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bMhUp6yItavT for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Tue, 19 Aug 2025 06:40:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::a32; helo=mail-vk1-xa32.google.com; envelope-from=kubik.bartlomiej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8112960856
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8112960856
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=SqDk+fy0
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
	by smtp3.osuosl.org (Postfix) with ESMTPS id 8112960856
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Tue, 19 Aug 2025 06:40:17 +0000 (UTC)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-53b17534eeeso1784463e0c.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 18 Aug 2025 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755585616; x=1756190416; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/hsSyp0BU0dIGoQ1I943HbjW/hqPyxYDs1Igup4dMw=;
        b=SqDk+fy0r//86a2Fsq9CPP4o3Z99VY9KF8t7M4ZfGW/QceOpUrAOQMedKFmOkiAayl
         EHHLYVMs0UKO13gumlkIGA3MkjgLj8vfFav1JVi38ePfp9G3tF1YGt5/0/M5Ptg8xFbO
         0agxbMaN0lOOKvuQ+kVFBGmGSoYuWCl1KCJPU7pCzyGnGZ1RpKgafDDJZ4KaRYGPFawW
         /zXt9kTG8JlBEouaAUFNcEKIf+2lLDhaajHiuu4k4IpRVrpdKzIyDzPlLLgItMiWTyrD
         qHtftH31PpL3qJmcLYxRR4+vQZqcoe6MbihsJuC8WSgyop1LdIq9s6Yky3u/IJ514gyJ
         jOJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755585616; x=1756190416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/hsSyp0BU0dIGoQ1I943HbjW/hqPyxYDs1Igup4dMw=;
        b=UkLMwgXbtOKT5VYhIQU5iVIekL9S1fW4fV2V6ydsV4VMFPZnLD3AOXusLK167Uucx9
         /Y8tWcv5lnEbj7wn9sN1lExq8o3qJsLh1UxNLHCLcVjNWXrxQZ0Vb+S+rwSLLqKUABwm
         N6+pzYUJmmuLedzg+QZrU0kC2qoEsziA5WJadCRz9oNgHifw3jncvBlHPwoxjlU1AqMF
         eg/OKDHJjQWKY8/IuQdWRNnG3uIOkraeDl19V5R81FdU4aBByJz87kQp7tNWMXrDUbti
         YHMseoggVXOw/fvc/GUnlbev5Xe0x4s/v2BnVJ6fJgtiL4sng/NWM/1UBr3reWEBbSWr
         rpwg==
X-Forwarded-Encrypted: i=1; AJvYcCVvDQYeUSLLWqQmaqAqI7pZ6Q0KgoTbm/iRIn2t2k9OTHoUbHedHstlr7XLElKK3CdEnxluEBOQLoRACFA81WSlDZDYEA==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YxZYPVtzk73JC3JlWUxczDRnGTRX9vtdn1iiywset6KUS5a8pHy
	I0RdLifb8alotWEUi2CnFcoLAAgeRIceJfGiiacue8S0pR5ocwPIm7HrdeDdh3E64nyhqaRYJxT
	RrMhG77prvV1NGvOcn1uIk/OYZQthVFc=
X-Gm-Gg: ASbGncv7gFUIGLtnnFol7eCC6slxl+uxbSP0ZKFcOwvx5yxoBEd+nEjnVJ1EBc+KpG+
	rkyqQoALLhYJ2TuqjubtcO8A/jCt79PNsvAnxKuoi5iuncTzBMYlvglTsaoLXkiWNuYgSCd2lcW
	5aAXjW0Z3MZv1DDYtqwdeq3oM+wE1SIeQaukv3ScndMhZWtdf9ljJFIQDJFt3AS0+wAxqwCciRD
	MILQ84aOOd+WSDtB4vC
X-Google-Smtp-Source: AGHT+IGIp9L40rMIB/aowtWlVCpWwoAnLOKn+XiCciGgI7/tRZjmsc4dZJQpXr0goyuxaIU9p7AaWzlMhyhPD14SX+k=
X-Received: by 2002:a05:6122:468f:b0:539:2a2c:6efe with SMTP id
 71dfb90a1353d-53b5d1af882mr510444e0c.4.1755585615892; Mon, 18 Aug 2025
 23:40:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250818082630.40097-1-kubik.bartlomiej@gmail.com> <87ikikaaev.fsf@trenco.lwn.net>
In-Reply-To: <87ikikaaev.fsf@trenco.lwn.net>
From: =?UTF-8?Q?Bart=C5=82omiej_Kubik?= <kubik.bartlomiej@gmail.com>
Date: Tue, 19 Aug 2025 08:40:04 +0200
X-Gm-Features: Ac12FXxtQ25zbgGof2ZlIbrulFoGItlTzkHFXiu_IIvm1IAkA51qtfPdhbh-3Ew
Message-ID: <CAPqLRf15U31=VnXsEBiB-G7BsOH65FLCeoepSMc=D5bS4P_Y=g@mail.gmail.com>
Subject: Re: [PATCH] kernel-parameters.rst: fix document warnings v2
To: Jonathan Corbet <corbet@lwn.net>
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, rdunlap@infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thank you for clarifying my mistakes, and I apologize for them.
I mistakenly generated this patch against linux-mainline, which is why
it doesn=E2=80=99t apply to docs-next.
I will switch to the correct docs-next repository
(git://git.lwn.net/linux.git docs-next), recreate the patch from a
clean checkout, and include a full changelog section as you mentioned
to me.




On Mon, 18 Aug 2025 at 17:59, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Bartlomiej Kubik <kubik.bartlomiej@gmail.com> writes:
>
> > Fixed missing definite article "states that the parameter" as suggested=
.
> >
> >
> > Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
> > ---
> >  Documentation/admin-guide/kernel-parameters.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Document=
ation/admin-guide/kernel-parameters.rst
> > index 445248787e77..7bf8cc7df6b5 100644
> > --- a/Documentation/admin-guide/kernel-parameters.rst
> > +++ b/Documentation/admin-guide/kernel-parameters.rst
> > @@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/b=
oot.rst>.
> >  There are also arch-specific kernel-parameters not documented here.
> >
> >  Note that ALL kernel parameters listed below are CASE SENSITIVE, and t=
hat
> > -a trailing =3D on the name of any parameter states that parameter will
> > +a trailing =3D on the name of any parameter states that the parameter =
will
> >  be entered as an environment variable, whereas its absence indicates t=
hat
>
> Thank you for working to improve our documentation.  That said, there
> are a number of problems to address here.
>
> - The patch does not apply to docs-next, or to any recent kernel
>   release.  Which version did you generate the patch against?
>
> - When you do a "v2" patch, you should include, after the "---" line, a
>   summary of what changed since the previous version.  That is
>   especially true when you have seemingly just dropped one of the
>   changes you made the first time around?
>
>   Ah, I think I see...you generated this on top of your previous
>   version?  That explains why it didn't apply.  Please do not do that;
>   when a patch needs changes due to review comments, recreate the patch.
>
> - "Fix a warning" is rarely a good subject line for a patch; you should
>   say what you actually did.  In this case, "replace a duplicated word"
>   or some such would be better.
>
> - Finally, Documentation/process/submitting-patches.rst asks that
>   changelogs be written in the imperative form.  I am not a stickler for
>   that, but some other maintainers definitely are, so it is a good habit
>   to adopt for all of your patches.
>
> Thanks,
>
> jon



--
Best regards



Bart=C5=82omiej Kubik
