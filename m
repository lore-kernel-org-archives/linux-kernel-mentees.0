Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D3E244687
	for <linux-kernel-mentees@lists.linux.dev>; Sat, 11 Oct 2025 10:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760179113; cv=none; b=OAJhTxMHbDRT+e89bKlpg4HcNbdbbyJOEPC1+DSqoCTG4HtSJzYiPdUSp0LDY3lsTLDn0ZnfZM/7YMaB6ctZzL2vFrmOiujYmdEskGeg+n5u/bY4KCdbJ6fey9lNLd6d2jcsD1TxfNcEqqo2thklLLVVVvXXSqqy2xztq9Lhtek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760179113; c=relaxed/simple;
	bh=ZM6gK8/ptNL07x+/PAG3f+iZfMJySGfBm2OlXDFCx6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CdlQBIDdCfqk20TBjkVm2T5r4pBpA9punRNe+vFIWKcbBl6/CSk51pfXljWs3JN4kBrB81b5GhagJiUJQVxN3l2ldVhzMmd7CPjgmlezQ423Xb6HOfHaRalGjlPhrBSC8/7r7LKCIn2CZ1Vx0dsL9JoIuEp3i2GgMr+q8J3/4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WAuDjNOE; arc=none smtp.client-ip=209.85.218.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WAuDjNOE"
Received: by mail-ej1-f68.google.com with SMTP id a640c23a62f3a-afcb78ead12so449334466b.1
        for <linux-kernel-mentees@lists.linux.dev>; Sat, 11 Oct 2025 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760179104; x=1760783904; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xny2m3uhM/SxXH2HjS7Fl5XTjSKvXRs2Du0+aNtpjtY=;
        b=WAuDjNOEmpiMM1bwAbkmtjXUxyWgtN5cOL755maLNsuL1lSv5CktIJP4rdhWCM2FX4
         A0+d7/I2tbPT5A2xIcRwsJxjW+vSc9phqJZwu9zUkQWZFO24Fdhg/oo7ZNG6wSxnOmsK
         C+LThJLrb3K61C4q+9g0FrYzu8TSkRBeZqepMiP8C10sXWwJCvd1915ZVXEQ55WiVOOU
         STW47AYmpZxlKXv7DqWelXuxPn6wKSofxEbMAW3qwdPgCMr7bqOj03aSTOe8U83TeqY9
         nbXOO4/Q4Fh5It4MDgjCisqzSxWmblJhK1F8if5/JRmQGo29VxspTjJa2kPsz3EWVuMh
         c1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760179104; x=1760783904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xny2m3uhM/SxXH2HjS7Fl5XTjSKvXRs2Du0+aNtpjtY=;
        b=ZDuW6yDt7qvz0wbqt0ijzf1OSN33jQMubiVo0P3SreFRg+AY9jmYWeL9SqmM/Xm3qD
         PJkG6o7wdElbBlwY1ddZWj/gHS9T4Bhs6GhK2FIr9CHhA1MGsY4ncN2vVfzLYNAfjFma
         bi+rtVSfnlFfoXuR9ErNjP3Y71mXYOsNG7JYPJHN+XSv1aL31lJxCC1xhDqW2Wu8dzF0
         opF9ENFIC1+rEFPV6l+y1UG/vJuY2e9IqjgAPpFZorkKvJjTjaWrgo/g5MD1R6srO+L7
         Ovqm1E2OmhJu3tkh+dHUe21hNhVQNfL6KXUoUqZyh45+SLhAwjCRzTtKywho+jg7mSco
         J4Hw==
X-Forwarded-Encrypted: i=1; AJvYcCVyRAEUymei6QCkV7PUsEO+KiZZJeo3jOwV18dpvP0t8lu5BKLscmEw8SiixtCfgcyaFVu8a/uhUPCrxYcqMcLCDxmvyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHyOeuKJ9Ffa9cb7qhAHhEmeHxPBuyR6TvNyzcW978lQmv/O5F
	ZYQeHHgx4ODxC/xUJoTUp3hZZfhbru1FcHxDG5Sw0tflx29po5WUeuaTLrgIDdni4v+i1qjWEkO
	eaEJlAG7aJO0bTVuygHzSat/azhSAAeE=
X-Gm-Gg: ASbGncuySwJvXARWlRsnHRoHBlAONz19LrI7leaR0+1IVrkqWiWkOQkqNHZPg+DRFeP
	wF7lLnazwVHrHT/VTinbM9tozlU7IntAXXok/7p2DFaK2lsal0X9OQY3iyE3xKBVGD9QeqxZpnH
	ZqwEtPNCbp89Z0jdjhB41rwipMTuYegxV5BIHdef1WMHtFHhnHcLSbIvvjM3ubfIgAc+GEHr8D/
	fDJQD7xZm+G+fwHrBiwOQje5g==
X-Google-Smtp-Source: AGHT+IE7l5xvIFgT9i4m7mh7Oy/v5NjT9bqTFYELpGCEXyYpZaEcHvHT3oTtVXEc7bXN+PyntmQrK0WQUm7ynfY+S08=
X-Received: by 2002:a17:907:3e13:b0:b40:a71b:152e with SMTP id
 a640c23a62f3a-b50ac1cc39emr1445899966b.40.1760179103638; Sat, 11 Oct 2025
 03:38:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251008031737.7321-1-raskar.shree97@gmail.com>
 <20251008031737.7321-2-raskar.shree97@gmail.com> <175992812188.3371104.5716471946724146308.robh@kernel.org>
In-Reply-To: <175992812188.3371104.5716471946724146308.robh@kernel.org>
From: Shrikant <raskar.shree97@gmail.com>
Date: Sat, 11 Oct 2025 16:08:12 +0530
X-Gm-Features: AS18NWAnttKcW-sKW8_JBGa9qUMRxmLzTjvvzFAZDNvf13qm3vN4yW9SF_3ub_k
Message-ID: <CAHc1_P6xDS1kec8mScCGHfPiVYbBBK8Hr8rgve5xSsLk=2Keyg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: max30100: Add pulse-width property
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: nuno.sa@analog.com, dlechner@baylibre.com, linux-kernel@vger.kernel.org, 
	andy@kernel.org, linux-iio@vger.kernel.org, matt@ranostay.sg, 
	linux-kernel-mentees@lists.linux.dev, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, skhan@linuxfoundation.org, jic23@kernel.org, 
	conor+dt@kernel.org, david.hunter.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i=
io/health/maxim,max30100.yaml: properties:maxim,pulse-width-us: 'enum' shou=
ld not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclu=
siveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
>         hint: Scalar and array keywords cannot be mixed
>         from schema $id: http://devicetree.org/meta-schemas/keywords.yaml=
#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/i=
io/health/maxim,max30100.yaml: properties:maxim,pulse-width-us: 'anyOf' con=
ditional failed, one must be fixed:
>         'enum' is not one of ['maxItems', 'description', 'deprecated']
>                 hint: Only "maxItems" is required for a single entry if t=
here are no constraints defined for the values.
>         Additional properties are not allowed ('enum' was unexpected)
>                 hint: Arrays must be described with a combination of minI=
tems/maxItems/items
>         'maxItems' is not one of ['description', 'deprecated', 'const', '=
enum', 'minimum', 'maximum', 'multipleOf', 'default', '$ref', 'oneOf']
>         1 is less than the minimum of 2
>                 hint: Arrays must be described with a combination of minI=
tems/maxItems/items
>         hint: cell array properties must define how many entries and what=
 the entries are when there is more than one entry.
>         from schema $id: http://devicetree.org/meta-schemas/core.yaml#
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202510=
08031737.7321-2-raskar.shree97@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
Hi Rob,
Thank you for reviewing my patch and pointing out the dt-binding schema iss=
ues.
I=E2=80=99ve updated the YAML to fix the reported warnings. I=E2=80=99ll ve=
rify with
yamllint and dtschema
to confirm there are no remaining errors and submit a corrected v3
patch shortly.

Thanks for your guidance.

Regards,
Shrikant
