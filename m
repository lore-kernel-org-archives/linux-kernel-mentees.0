Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE3A471CF8
	for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 17:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642137; cv=none; b=FdSfIx257eySfn+PqfjrX2eW6BcBYcnG73PPMibZh60Vhlpy2rm9L3vLA6Y2ycwtxHqMnNxMIglkES34o+osIny9wiwZbeGYHd9fIyLA8WavdsB+Naag1Hvra1h2kEMAK3Ogw38dwe1MmVONbG0YA9gOhIPzEE5iPlS0G0yo2z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642137; c=relaxed/simple;
	bh=TMSjSdPy1mFMoDQ0bB+ffUgJOOHQfmPq1+pZYXoAxm8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=VrH9H/bD9xShvaq3jJKojc8dQoRVK0X2rgf6D9uoSEjhmsK1MuQixCMWRB0EvBLrwyp+utPacF59P3UH2sjOrT6+/Pz66DvYL2R/BS52BiK1AlhAN3+gZjOBfUCiyy0NT46Pre8USyBGjJjq1anea47h1cRrDKaVVfZRYekrpUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H9BPs2Ej; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9BPs2Ej"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso1161566b3a.1
        for <linux-kernel-mentees@lists.linux.dev>; Thu, 13 Aug 2026 10:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642135; x=1787246935; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3QAmNckJusENFi3b8PAoUfCMcO2O6+LVywV/5dZdBLk=;
        b=H9BPs2EjZ5M4UCdl9eP/wY/6w0N+9IEthpbhXkQLo/SCQYmrLDSq7f298l1Esqkd9L
         eSuc+IU7Z9qCkxrRKNMBQM98NSlZ36YPrRUtNNC/w3GQt1CtXTSQ747CTkvz7kNyCp4t
         1ETn/V6NHS4gXYea/j7JFciOdIpu9AYFBtgVcCWIxKvrQKnR0bs3kbTpJ/DRpUWWYpGR
         lKC+ABeKUiPb2ieIECYkLDj3AA1uQr9pa9KHZsvJL2etVaHbK20ipp49ApTqXiqG6ER1
         unGh5RtRrrBwuu/DpLNniQq7Zsj2z8gNQ+IR5/8CwBzeR7lwi3ykB3B1BZvZzpX7KuIB
         YMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642135; x=1787246935;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3QAmNckJusENFi3b8PAoUfCMcO2O6+LVywV/5dZdBLk=;
        b=TI6qR+AY/r3rxnNlrnQceCwJrsSSmFLuk1jUt4oS7bziNztauHdYbDcb5upqpsmya/
         ElLkvsB9UmUtGQNIdRoue8dpWbCQIVsL9Tfna3kB7SCN2ce/XClF1mM5X7IKWFiNuN9f
         h1xXTDeBNWFReNOq/X9xQ4T4DrPXI4m+OTw8qcNMasawy4Mtq6QJC39VgJaRXgbMCI9M
         xD3WlhBDWOHlDvdfasddDE2ek6cggcuuXKWHeJpwj5jK7+799HNvIdzyxaA85ctBGi+G
         5V8EH1oQ7v2Fu+Fkw7rIEKGIljlDIA5llxSM9Io5flOe2lMJOZxOe/6GV4/MJe09dHVs
         8KiA==
X-Forwarded-Encrypted: i=1; AHgh+RpYVuC5n+hrkr/0dUAEY5vc7JOsLxUDVYD48LXyQ5EUrNOsNujMfWLI4mfmXTC5HNMKriEhEX3IbK55klcpuWQan1eXDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2w0KqgN9HLvSrexoLcjbkHykAPShJBliqjn3DayYWT/ftrcot
	PPAIxE6hnf0CEk21kCTJubNdlN0ZUg0VOHWqr3pnklJ+vYKWRn1EjH4=
X-Gm-Gg: AR+sD12eXdyC3Y2IlMcCnceJHa0pmGeIk4vpguprcqu3Rbw/s1mFlu6DOZ3oxGvirRx
	a056zh3CPXHCTkk+qmaBF22pJ6Cyvbv8dYJZS5llKbJqg3S55pniy2dFFGEUcTXZ4AB7cvCCM+Y
	oXRvFjFJ58Rl4zdZavbq8k+AbttdgF8/OBxCQSjkImj+0Bg+Epnb/s58cp0k0CbcLXyif0m2lKB
	z1m85SQVmA2ZlyNw0do6EnnTx7KcC2QKkKdem/o96kSwzPi1wHd6kUBx2DRJ0qWAsrf2fkvj4s8
	x0rZmRdSeu7XnpUdyokunkqBTKGfG3uTzW2ey/nQO0rUmCQBQlKNmJf475kTRLN0WR90RBZjaw3
	lzYF1Kcq2tJWbLPa+c4WwQmnmLotyGVQAbM34J3nrGu+i7L/M1P552vMb0wicHfsMaDpLf/VbJ1
	aJ0sfFctvA/44I/1QsIjUSCXsQVt98HuRhieAoVHDnKXxi8p5ABxxT+8km9mUc3G1WDb/mIlCly
	wqf+r6l4eyJyfxfvaC4Eabt
X-Received: by 2002:a05:6a00:44ce:b0:848:6b43:35dc with SMTP id d2e1a72fcca58-84fc767caa3mr8813674b3a.35.1786642134845;
        Thu, 13 Aug 2026 10:28:54 -0700 (PDT)
Received: from localhost ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc5a1bcaasm1251435b3a.29.2026.08.13.10.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 10:28:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Aug 2026 14:28:48 -0300
Message-Id: <DKNZRYZZVSEA.I0LC7DRPXFK9@gmail.com>
Cc: "David Airlie" <airlied@gmail.com>, "Jori Koolstra"
 <jkoolstra@xs4all.nl>, "Conor Dooley" <conor+dt@kernel.org>, "Brigham
 Campbell" <me@brighamcampbell.com>, <linux-kernel-mentees@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Shuah Khan"
 <skhan@linuxfoundation.org>, "Maxime Ripard" <mripard@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: display: add Chipwealth CH1115 OLED
 controller
From: =?utf-8?q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
X-Mailer: aerc 0.20.0
References: <cover.1786110720.git.nico.antinori.7@gmail.com>
 <cf9b02d618db4eca88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com> <178611771198.882916.15330377894023589629.robh@kernel.org>
In-Reply-To: <178611771198.882916.15330377894023589629.robh@kernel.org>

Hello Rob,

On Fri Aug 7, 2026 at 12:48 PM -03, Rob Herring (Arm) wrote:
>
> On Fri, 07 Aug 2026 11:19:50 -0300, Nicol=C3=A1s Antinori wrote:
>> Chipwealth CH1115 is a controller for monochrome dot matrix OLED panels.
>>=20
>> Signed-off-by: Nicol=C3=A1s Antinori <nico.antinori.7@gmail.com>
>> ---
>>  .../bindings/display/chipwealth,ch1115.yaml   | 73 +++++++++++++++++++
>>  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
>>  2 files changed, 75 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/chipwealth=
,ch1115.yaml
>>=20
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> Documentation/devicetree/bindings/display/chipwealth,ch1115.example.dtb: =
display@3c (chipwealth,ch1115): 'contrast', 'first-page' do not match any o=
f the regexes: '^pinctrl-[0-9]+$'
> 	from schema $id: http://devicetree.org/schemas/display/chipwealth,ch1115=
.yaml
> Documentation/devicetree/bindings/display/chipwealth,ch1115.example.dtb: =
display@3c (chipwealth,ch1115): contrast: b'\x00\x00\x00\x7f' is not of typ=
e 'object', 'integer', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml
> Documentation/devicetree/bindings/display/chipwealth,ch1115.example.dtb: =
display@3c (chipwealth,ch1115): first-page: b'\x00\x00\x00\x01' is not of t=
ype 'object', 'integer', 'array', 'boolean', 'null'
> 	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/cf9b02d618db4ec=
a88e2d32b4bf779011fcd550d.1786110720.git.nico.antinori.7@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.

The patch is based in 7.2-rc6, I am going to rebase it to rc1 in v2
(or wait until rc1 of 7.3, depending on how much it takes me to solve=20
some observations found by sashiko).

Thank you for the clarifications!

