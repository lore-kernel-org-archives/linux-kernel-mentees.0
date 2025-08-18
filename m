Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA522BE7B0
	for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 08:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755504179; cv=none; b=QA0T+8IugTyhgVKENufnrR/cmLyUQa1SClgBoyVcZF3gO5U28ewLfVj9XSuwXUhoWFm3u/JaRy2rdEN1YR886z49AKdStaMDaKdJvjWRxvpz4ZHfoHhGlGnMva9ehUOuDPdeo8FpQXNHKtfflhAunlm3YcyqTRS/9TGjQFURR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755504179; c=relaxed/simple;
	bh=BTDvtIT10/Y7dpj6Bwu/egzP7OKMQ3oLE5KC8jPsBrs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iM1wIWTJ8DmFBH75Y85w5M6R8Bi3hvsaYn6VYGgKqrQmUTAX6ijeSAnVT3NfbKSZBdZPV9p2s+Ais8VImLRWSAjGZcI/HwTsCitpIc4XceolE+CjY0M2qc6esq70KBk+jkFlZ1rLRs983WosqW6meOVHz0E5gTfzItt47E6bL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DlQ9Q3lm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DlQ9Q3lm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755504177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BTDvtIT10/Y7dpj6Bwu/egzP7OKMQ3oLE5KC8jPsBrs=;
	b=DlQ9Q3lmbt2J5vklTZ/1nnKPw9GWXZb7iC2ulDqg2G4uhN10AY8FdzhSfK/sOg4/I7TeUE
	fOmo02ICJlUeoVtGXZHvHfEwbiSCYncNz4tlq0/ALq4jy6P7uI8ujQ/QUjvggiPdOLB+dF
	pKePc1cWXPqY3H25wsxy1smDRnpai90=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-rRCWIFalNuSSE86MSQnfTw-1; Mon, 18 Aug 2025 04:02:53 -0400
X-MC-Unique: rRCWIFalNuSSE86MSQnfTw-1
X-Mimecast-MFC-AGG-ID: rRCWIFalNuSSE86MSQnfTw_1755504173
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a9f5b078bso41333506d6.3
        for <linux-kernel-mentees@lists.linux.dev>; Mon, 18 Aug 2025 01:02:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755504173; x=1756108973;
        h=mime-version:user-agent:content-transfer-encoding:autocrypt
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTDvtIT10/Y7dpj6Bwu/egzP7OKMQ3oLE5KC8jPsBrs=;
        b=pqpmKOdvq92cB+QCUOWjRU/WymPaCo3+LHJ8SFJSlrb02HZMOHcndrymnDe8904Yms
         dHpo+KtLtnJHLE/36ltcMXRHubAkZolMhqCsmOct4oIvuy9BqsH3RPRwPAfEgNdHpDSx
         jV1nlR8IFrp1bMsrlsV3/5teoJqxrn/DAcWZfWz0zh0uiRrqwsAmjXl+dcZPVx7h9TIT
         fkHpbhKLZTbGum+GdUGtcRsohdLunzGG6NV+nrsSyFDlxTZ1A3weAIi4a7kUmRBhsQOZ
         Lf8Bx9RiuPd3HEDCcd0M0nEPztFO/ahA6Wyqls6kWZOoSsXE+gBix67B3cVbTm1VEisK
         GWrg==
X-Forwarded-Encrypted: i=1; AJvYcCXoZGQSKS6Zj3VhWktprL/GNWqZivIrOGS9TTdloOnJnRBD5SfluEUZKKEyEQ80ggUAmPlD06BHIuRQ5k14vagE0nNY1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBDCyClPZV+nGLPVNlhB2RfIVq8RPlKDM6Xby6r2QLPNUvIdy6
	9XuKO3OZE9DyAu+O/0j5wLwUN/A5BkZUM4QQwu4ntntoGwXpApNJ1IxZKcic9sLVOhy1EotBB7A
	ma87CstFEmR6gXMqRRytP/r4PDwwFbTcVHHvUX9AINU29dFAKp40/AFgMKovi7bMYWctjKbktOR
	bj
X-Gm-Gg: ASbGncsv3GjY7FMEb5fwCelgqx8FWd61vgQq0UEeKFaMr6IVpLtsq1EgjrTr2rryFP7
	FYKw05fRbwS4KRw8KXR5zyjAoyGtV13sXND/fsTxuT8uRF8/4g3lFxLnBXuvp4oE++TXYYx1I17
	U01WL3ubds5doXM8AWXoRMe09Pqoza7UZktOlND3n/oSFSaSYfnfNpAgiXZnVgR4nFEkNItSVzN
	zcCKdZF1kGFxsOgBN7QxaX7ANU7UnszTQSLiY13B2x86c9TDd0EIHTknsZ9bu1Xzg7hYRskC/dB
	zZ5X1BFUpPaXoGMgUb0/s0Jg0T10ePqxBBzPtnZPAt0x8y9OHZuShPcBgp9fcjpALQ==
X-Received: by 2002:a05:6214:21e2:b0:707:5e7e:20f with SMTP id 6a1803df08f44-70ba7a8e0c9mr127652396d6.5.1755504173087;
        Mon, 18 Aug 2025 01:02:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHbS9oN+bmVLXNWkCtLoe4KkJAUB/SBpAzOahmwwKpbcS5hEqU1zFKZK8VNdKmOFa0tdBVBA==
X-Received: by 2002:a05:6214:21e2:b0:707:5e7e:20f with SMTP id 6a1803df08f44-70ba7a8e0c9mr127652076d6.5.1755504172501;
        Mon, 18 Aug 2025 01:02:52 -0700 (PDT)
Received: from gmonaco-thinkpadt14gen3.rmtit.csb ([185.107.56.42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba959f401sm48756146d6.69.2025.08.18.01.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:02:52 -0700 (PDT)
Message-ID: <93e01a77105007dff602ab9a2a9af5b4cff86522.camel@redhat.com>
Subject: Re: [PATCH] Documentation/rv: Fix minor typo in monitor_synthesis
 page
From: Gabriele Monaco <gmonaco@redhat.com>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>, rostedt@goodmis.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Date: Mon, 18 Aug 2025 10:02:49 +0200
In-Reply-To: <20250810111249.93181-1-krishnagopi487@gmail.com>
References: <20250810111249.93181-1-krishnagopi487@gmail.com>
Autocrypt: addr=gmonaco@redhat.com; prefer-encrypt=mutual;
 keydata=mDMEZuK5YxYJKwYBBAHaRw8BAQdAmJ3dM9Sz6/Hodu33Qrf8QH2bNeNbOikqYtxWFLVm0
 1a0JEdhYnJpZWxlIE1vbmFjbyA8Z21vbmFjb0ByZWRoYXQuY29tPoiZBBMWCgBBFiEEysoR+AuB3R
 Zwp6j270psSVh4TfIFAmbiuWMCGwMFCQWjmoAFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgk
 Q70psSVh4TfJzZgD/TXjnqCyqaZH/Y2w+YVbvm93WX2eqBqiVZ6VEjTuGNs8A/iPrKbzdWC7AicnK
 xyhmqeUWOzFx5P43S1E1dhsrLWgP
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9wLZ0R-qTE5q3fyQR_erFCVLaqfW2K3TbaOpdMxqVsM_1755504173
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2025-08-10 at 16:42 +0530, Gopi Krishna Menon wrote:
> Specifically, fix spelling of "practice"
>=20
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Thanks for finding this!

Reviewed-by: Gabriele Monaco <gmonaco@redhat.com>

> ---
> =C2=A0Documentation/trace/rv/monitor_synthesis.rst | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/trace/rv/monitor_synthesis.rst
> b/Documentation/trace/rv/monitor_synthesis.rst
> index ac808a7554f5..3a7d7b2f6cb6 100644
> --- a/Documentation/trace/rv/monitor_synthesis.rst
> +++ b/Documentation/trace/rv/monitor_synthesis.rst
> @@ -181,7 +181,7 @@ which is the list of atomic propositions present
> in the LTL specification
> =C2=A0functions interacting with the Buchi automaton.
> =C2=A0
> =C2=A0While generating code, `rvgen` cannot understand the meaning of the
> atomic
> -propositions. Thus, that task is left for manual work. The
> recommended pratice
> +propositions. Thus, that task is left for manual work. The
> recommended practice
> =C2=A0is adding tracepoints to places where the atomic propositions
> change; and in the
> =C2=A0tracepoints' handlers: the Buchi automaton is executed using::
> =C2=A0

