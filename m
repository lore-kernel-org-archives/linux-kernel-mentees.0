Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A72273D84
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Dec 2025 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765033439; cv=none; b=CsNMEwQ+QV5LQcAUPr8Xr0u8IjEvWJGpUBkq2V6kNZmBD9CyY2Ay7c178sH68TUJPPF/lySHNDLcxF2ay53fZygvFrB6fVhB4mKIvThDDpgUt6hWO9j3nxiiwS4snv0n9p/nyPj78Vi950L6ZMfYhW7HOJ0vKntMUpyE68HaXEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765033439; c=relaxed/simple;
	bh=fN2Xexoi/B9ctLaAFFwv+iZ85CtawTyBDeizMK5ec0o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EMuxwbjybmRxlKUdfBZ+rP8DgGTvan36AT2++65JulShGnbhlVp4XutlnUi66HvJagvOBEe7LP31YkokBJgaJHcoxI35mrVjyDMRY7iZo1JaYqgb2iN5M8Ott75zDfjFbuzDt6D/Fb3KbueEZzk6fCyl/vjs5WcNWx2WtxE63uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrHfp3e8; arc=none smtp.client-ip=140.211.166.138
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrHfp3e8"
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A78784207
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Dec 2025 15:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.25
X-Spam-Level:
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDT4qM1JPlWF for <linux-kernel-mentees@lists.linuxfoundation.org>;
 Sat,  6 Dec 2025 15:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:20::132a; helo=mail-dy1-x132a.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D784183F2E
Authentication-Results: smtp1.osuosl.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D784183F2E
Authentication-Results: smtp1.osuosl.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hrHfp3e8
Received: from mail-dy1-x132a.google.com (mail-dy1-x132a.google.com [IPv6:2607:f8b0:4864:20::132a])
	by smtp1.osuosl.org (Postfix) with ESMTPS id D784183F2E
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat,  6 Dec 2025 15:03:56 +0000 (UTC)
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2a45877bd5eso5266262eec.0
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Sat, 06 Dec 2025 07:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765033436; x=1765638236; darn=lists.linuxfoundation.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m+tR6RUcnOhStP3t3KnBwgUkXc4dKjHlIZuatPHOKmc=;
        b=hrHfp3e8SYO0gxYrojLUoWRHpMK1cpXs+jK0W2g/ATLUO5jKk6qYC4dQwfWvs1VgJu
         nBrBbv89n91wnznrklHMotz2S4OApsqXNK/JW2nOQ4LN2E5rXyeHuIlvDQugT2kuuQbd
         3Yr5ldAumNz87V55Z9uKDAb0kzKpjilR83a3cZx6uPkWkovljEq5UZzevV9STiG/6gNs
         2Ova5oXnU66WLd7EBjoJbrq/uIdQ7KR00Yn11DpIj15GO8kvrWyW8rgtBGn+fWPTam39
         dxZS519NcRTEgmUz6VP74+uJ4Lxvxfl/RPFlU6ek5WTl7vshw5W3+F5/mgCWKtWbq+Jb
         ag/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765033436; x=1765638236;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m+tR6RUcnOhStP3t3KnBwgUkXc4dKjHlIZuatPHOKmc=;
        b=SG2uc2/11u6WdNJuAKTbcKRDnZSusBLBwaKvAP2W9LXQAcLnhnDGPY8iPbj5b6zlJ7
         XqP7cJ/29Gt0FBj9C3JDpjxBZsxYMf0EngrcvWACZ2+qhe/CLrXwPbCxRrKv1lnlFxyJ
         psD7MT04B2JZfOdylCz6n9HH/JW+IkmDcKU1DUnwrtnpjqGMrdRoadMni0nVJhmcJZXl
         XgKoSi33coMSja9lDCojBLgEFu98NT2AX/sLN5iixhsIUqklmS04i1wzoOlzAdEq6BrC
         BZGpOGTQ7X0p5c0II7crZaFM9H05O2N1piYoMjlyTPMnlU+5c2tZFUYh5fPscJtajd/g
         Nauw==
X-Gm-Message-State: AOJu0YzdyeRfU0Juc/ZIvtaHwDhMd6WSyF2JEwQF3SGxPcUzWz6oSQeY
	/A9dmJicB3S/Mm1batAhfHxls6Ov2+6lGN8qI3PjpCNi/kkw8/1uaRlk
X-Gm-Gg: ASbGncufxeCJsK3LLOEcYOwp8IuyuuszhRglptfyDZ0JdIYnjVNByJ6bf89DBv+EWri
	M1IYc6DuiOXteVW7ztDCmI3J1a/ZyfGTA0/LLt7icoACpcXYh6j7spcTHWyfqe4aJHF12582l3+
	wSXfGTViCRQTzFcIfz/rnxLvK6fvrB9YuTzDrCQ0a1F8W/ZK1xVxJLJ6KhvIdqzsOmPxstgcgY5
	IOqZAHuvXdzU2QUi1XZUuZYm7D45FnKVW31EshDKOslt+SvLv3lhPYFyBQ46hjq3EkNERx0tGcW
	Riceke9X3wYb9n/EvPekqv9ukXx+TJzLWLpjuMqE4JUpUIXLoUN9Q49z39Vbdx9q1ya4pvc9Zko
	z0TtU6EU6mwG+ja0BMNdjnqPSJt5DOoYun/6zUEi7s20G4nHoEJezlk71fDwBss8C7VEV3Q9cQG
	Yok3v/a/3qoPxPBQer4fha6/I=
X-Google-Smtp-Source: AGHT+IFzojphrHRVtMjAYXF3z/dTrYB/zZKE8NoGiyXHbs+9+cXXnLG2F0IpmuMealC4iJgXnHs01w==
X-Received: by 2002:a05:7300:e7ac:b0:2a4:3593:ccc8 with SMTP id 5a478bee46e88-2abc6f0ff38mr1683190eec.15.1765033435525;
        Sat, 06 Dec 2025 07:03:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba88433fesm21958618eec.6.2025.12.06.07.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Dec 2025 07:03:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 6 Dec 2025 07:03:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Soham Metha <sohammetha01@gmail.com>
Cc: linux-kernel-mentees@lists.linuxfoundation.org, shuah@kernel.org,
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: hwmon: g762: fix dead link to G762
 binding
Message-ID: <0b01dafa-9d77-4ea6-a10e-05bc67ee2eaf@roeck-us.net>
References: <20251203181213.51618-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203181213.51618-1-sohammetha01@gmail.com>

On Wed, Dec 03, 2025 at 11:42:13PM +0530, Soham Metha wrote:
> The old text binding 'g762.txt' was replaced by a DT schema in
> commit 3d8e253724170ae9c8948c36801204fc2aa53682
> ("dt-bindings: hwmon: Convert g762 to YAML schema").
> 
> Update the reference to point to the new YAML binding:
>     Documentation/devicetree/bindings/hwmon/gmt,g762.yaml
> 
> Signed-off-by: Soham Metha <sohammetha01@gmail.com>
> ---
> Changelog:
> - Use proper commit SHA reference syntax

Really ?

ERROR: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 3d8e25372417 ("dt-bindings: hwmon: g762: Convert to yaml schema")'
#106:
commit 3d8e253724170ae9c8948c36801204fc2aa53682
("dt-bindings: hwmon: Convert g762 to YAML schema").

I am going to apply
https://patchwork.kernel.org/project/linux-hwmon/patch/20251205215835.783273-1-katharasasikumar007@gmail.com/mbox/
instead.

Guenter

> 
>  Documentation/hwmon/g762.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/g762.rst b/Documentation/hwmon/g762.rst
> index 0371b3365c48..f224552a2d3c 100644
> --- a/Documentation/hwmon/g762.rst
> +++ b/Documentation/hwmon/g762.rst
> @@ -17,7 +17,7 @@ done via a userland daemon like fancontrol.
>  Note that those entries do not provide ways to setup the specific
>  hardware characteristics of the system (reference clock, pulses per
>  fan revolution, ...); Those can be modified via devicetree bindings
> -documented in Documentation/devicetree/bindings/hwmon/g762.txt or
> +documented in Documentation/devicetree/bindings/hwmon/gmt,g762.yaml or
>  using a specific platform_data structure in board initialization
>  file (see include/linux/platform_data/g762.h).
>  
