Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15111FDA8B
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748860141; cv=none; b=hAownHPZ2UjPNz6YkQK9edebc5ZiYYP6ltfnFLhDnsNv044LD7vfXxMASP1DlDEo/V8287WlsudW2sNrk7jHfJceCXMi6qy9qj0PIgPcZ19xVQTFmTAICFFQUNPkj7TRg1fkPPW1YZ5h+AVVjFkViuA65uLUE4ZA+to4iKr9dIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748860141; c=relaxed/simple;
	bh=Lgz+BLFeEQabK0+ZpWJOlQc4IuQGHDjipBLDp5yZ7v0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ajKN9xg4IENJaTa3pWouocyBxS6pIMFaLM1+7nDNhcdvpeABaPl+QlL8Py+vafGF0p3O2VH922g6Fa9Q9bJ3KTjKfhT8DBjq+/hsRO/so40nJWlxYhNV46feVTBbgs1YUkD2MQGpI01+SQeTYezpD+ZaOcREQx+7TYfT56FYFY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VtE96yzy; arc=none smtp.client-ip=140.211.166.136
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VtE96yzy"
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BD4860E55
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 10:28:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.849
X-Spam-Level:
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ptZzlImEn48E for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Mon,  2 Jun 2025 10:28:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com; envelope-from=marcelomoreira1905@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C3C2461110
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C3C2461110
Authentication-Results: smtp3.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VtE96yzy
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com [IPv6:2001:4860:4864:20::30])
	by smtp3.osuosl.org (Postfix) with ESMTPS id C3C2461110
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon,  2 Jun 2025 10:28:58 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-2da73155e91so1708020fac.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 02 Jun 2025 03:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748860137; x=1749464937; darn=lists.linuxfoundation.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qycxfetkp2Y445+JA1NY9RHjOJR61Z4glWtbTUVoHw=;
        b=VtE96yzyIVZjllp35IVmaUof8o8ZjmmDMQIJSOyYD1OxF7sx+ic74q709OFH3ZbGaq
         2n3aqYyKEyrX9ByXGWHQs5ZqeZ0IuWmBi94hG4Y6CZKz1uJZk1zQsW/qo50bu8pfRMCg
         L7eMdh/Ge2MBL+aKcQmjFJk75mlCDt/09rz4LV0S1+r5zoL11bIVgOHqHthIa15X+187
         gpUILt8Il5T9cotMnc0Nz1yuE+2dJ6TmJq1mVc6+qkJPHajVLdMtbtSk/hob+1q4zSQc
         YfD4HBX088dDxsEkQbmXxOfDc0Yn+QgzbL2eywT5RQkNJXnTIXNpv/ymUudfmj+PdJwo
         4hCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748860137; x=1749464937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7qycxfetkp2Y445+JA1NY9RHjOJR61Z4glWtbTUVoHw=;
        b=WN8cI+c7FkJYNxPlgbeDTmgy9GOIBYUwHMGjk3Z/aB0dAzZeHLeUewp5DZkdE8Qi/9
         6cvtbjMLJL9G+hFN42FyAldjj2CEsNO3tonK6aDWLPaWOCtxnylGo796knOOUoC5jlp3
         SApiCQ+KdsZUiMJtH7q6UtbXJuMRUMwJ/ZzuYN/Dqsr2ozcKGf2TQZQ4r4QWaWkpg8ff
         nfOnWmZ6S7AeKjodkgqgFj5TO8ZewH6wT4PrvtZzP8mur2LSProI6VyT3Nl80NBZoXE9
         QHJY6w31yxR392bsAHfQ4EpQefRT4sCoJgYPAz5ACvDSOKADC5s92E4EHyuIDssca2jZ
         7jUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhGFUpBWsUpOMfGZSLJBq60SMOBfegQw5W1UW1s759HsmNbvKpMeoeyYrOBMm7FEqBS0c8xwGgmDoTTDjYZ1vnb7qk3w==@lists.linuxfoundation.org
X-Gm-Message-State: AOJu0YwvpT4Q3k/6KS5ABaNf4eabRh8TMnHm9IppwKt1+MJcOMJcf5Jf
	R0Q8ZGYWpIcy+ko4j/bZw1i8uC7dJ+Oc3XqVXjvOnyxZOnQbb8ayuAWi/BSLjoHQlkOKCSzrm1E
	6mz80FTccZhSa5p5FDWYJNd8IlgmweMA=
X-Gm-Gg: ASbGncu5vsNYMcBDI16fDL1m0W8LyE4nK+CUaBD0MfihnHFfRfvkoIb1Nv9fa0QIAXh
	+hbpgjBkEqkLKHJoI4RHiO4O8IDWtL0hTUN7diLG5kykXP+lpOjcMZKv57nSojoEAMG5AGBCIUX
	DyAnlgwBA+Wd+MXh9ECo0ZoUXORyKKU7LyUAbYwQIY8ymr
X-Google-Smtp-Source: AGHT+IF4SACnTbASdDZkerZF5fG9yGeHSIrww7kc0Vl6pFDo9/75ariOqTK6uDMBYZt1rLPbLUKDxLa2SaUTUv/DtU8=
X-Received: by 2002:a05:6870:799a:b0:2d6:109d:2598 with SMTP id
 586e51a60fabf-2e92a10d609mr6943321fac.5.1748860137546; Mon, 02 Jun 2025
 03:28:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250526020125.382976-1-marcelomoreira1905@gmail.com>
 <DA5YTSGIN9DK.3HQ7DNKTVQRP4@kernel.org> <CAPZ3m_h3rFpMBNmP95H0z_nZn-oG0q2-9VDbSE+Ntt+PBBDYgw@mail.gmail.com>
 <DA6XFLKUTP1P.RR6P5AK9PKIZ@kernel.org> <CAPZ3m_gCY=8PScnfGZmJrpxgPFtTOaSh6Xw-9hS5pcUs7y4p7A@mail.gmail.com>
 <CANiq72=MZ63Yyspe+XoHkT6zQNWmLt8_qRScoX=2jhLzV73e8w@mail.gmail.com>
In-Reply-To: <CANiq72=MZ63Yyspe+XoHkT6zQNWmLt8_qRScoX=2jhLzV73e8w@mail.gmail.com>
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
Date: Mon, 2 Jun 2025 07:28:45 -0300
X-Gm-Features: AX0GCFtNSGU_9kIiBSaaKE2gVPOqmTcX_fyaVKbKhODzCVXl8Pb3LSUjhysNYCA
Message-ID: <CAPZ3m_hTr7BN=zy10m8kWchYiJ04MXKuJAp9wt67Krqw6wH-JQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: revocable: Correct safety comments and add invariants
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Benno Lossin <lossin@kernel.org>, dakr@kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 2 de jun. de 2025 =C3=A0s 03:38, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> escreveu:
>
> On Mon, Jun 2, 2025 at 3:18=E2=80=AFAM Marcelo Moreira
> <marcelomoreira1905@gmail.com> wrote:
> >
> > oh no, it looks like I submitted the patch without the explicit v4
> > version and without the 0/3 part :/...  Sorry for that, it's the first
> > time I've made a split patch like that.
>
> No worries!
>
> I saw the other message with the extra "manual" v4 cover letter, but
> that may confuse tooling, since it is wrapped and the title does not
> match etc., so it is best to resubmit it properly at this point.

Ok, I will resend, Thanks!

> The cover letter, and the right titles etc. should be generated by
> `git format-patch` for you, so I would suggest using that an
> reviewing the output (you will need to fill the cover letter in the
> file it generates) before sending it.

Ok.

Cheers,
Marcelo Moreira.
