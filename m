Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7640C1DFDE
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 17:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7EE9405B2
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 17:19:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7EE9405B2
X-Virus-Scanned: amavisd-new at osuosl.org
X-Spam-Flag: NO
X-Spam-Score: -1.151
X-Spam-Level:
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EP3XwY2E6BEB
	for <linux-kernel-mentees@lists.linuxfoundation.org>;
	Mon, 20 Nov 2023 17:19:07 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 01F664040D
	for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 17:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01F664040D
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7afff3ea94dso169365139f.3
        for <linux-kernel-mentees@lists.linuxfoundation.org>; Mon, 20 Nov 2023 09:19:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700500746; x=1701105546;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oyclGiDya5ElTdlrbB14+3v/ARVDiHt2Ibniy8Hf1lw=;
        b=J960wdFd7MYG0SAOwua6eBimVhSj+xN5FnU5gheLCY5kJNjtyxenCE//zYFuu3GxId
         hcvXOaTsr5Jj9eeupBzv7SydID7XD8X4/RXcau7DEEYBP1t3U+bsNDiAGyLtB1J4VxQD
         /+8h+ve8ej38868nsSvUnlO3YyFwhybLAdZ834Etbx9qQDIotd5rE7ufMVAmedCu5XLf
         SOPGEd8TIBK1wl593zXJFlaQgG4xUPtGAhUQyft3UIGxq6Zyzewem6/b+5CBHVFtIf70
         4Kus/fcwaq3SQ9Nu4agQUD0SO5YJrXHy90OqLIqDs+daoHqVO5stuixB7hoqrlcH43vJ
         iLqA==
X-Gm-Message-State: AOJu0YzcUTTnshaCu/3SsTOc3TmBkK8z3BLX7++yuZiWN1qCTLBsEl4e
	IVi0f/1nLOcNCIJzerS9Ag==
X-Google-Smtp-Source: AGHT+IGNqd6Hys+K1K83ex6FyIigc5GrfZUb/ep+oTstiRwKRhxOw7OPOP+jex+P9qmBuMGob+wskQ==
X-Received: by 2002:a05:6602:3718:b0:7a9:4268:fc26 with SMTP id bh24-20020a056602371800b007a94268fc26mr10884199iob.10.1700500745982;
        Mon, 20 Nov 2023 09:19:05 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b17-20020a056638389100b0042b1061c6a8sm2141009jav.84.2023.11.20.09.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 09:19:05 -0800 (PST)
Received: (nullmailer pid 2370658 invoked by uid 1000);
	Mon, 20 Nov 2023 17:19:03 -0000
Date: Mon, 20 Nov 2023 10:19:03 -0700
From: Rob Herring <robh@kernel.org>
To: Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel-mentees@lists.linuxfoundation.org, Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: pressure: add honeywell,hsc030
Message-ID: <20231120171903.GA2318732-robh@kernel.org>
References: <20231117164232.8474-1-petre.rodan@subdimension.ro>
 <20231117192305.17612-1-petre.rodan@subdimension.ro>
 <20231119134939.GA8784-robh@kernel.org>
 <ZVpswo3MSScT43Bo@sunspire>
Precedence: bulk
X-Mailing-List: linux-kernel-mentees@lists.linux.dev
List-Id: <linux-kernel-mentees.lists.linux.dev>
List-Subscribe: <mailto:linux-kernel-mentees+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-kernel-mentees+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZVpswo3MSScT43Bo@sunspire>

On Sun, Nov 19, 2023 at 10:14:58PM +0200, Petre Rodan wrote:
> 
> Good morning!
> 
> On Sun, Nov 19, 2023 at 07:49:39AM -0600, Rob Herring wrote:
> > On Fri, Nov 17, 2023 at 09:22:57PM +0200, Petre Rodan wrote:
> > > Adds binding for digital Honeywell TruStability HSC and SSC series pressure 
> > > and temperature sensors.
> > > 
> [..]
> > > Changes for v2:
> > > - Removed redundant quotations reported by robh's bot
> > > - Fixed yamllint warnings
> > > 
> > > I'm failing to run 'make DT_CHECKER_FLAGS=-m dt_binding_check' due to
> > > python errors and exceptions
> > 
> > What exceptions?
> 
> thanks for asking.
> 
> first off, installed packages. the first 4 are not part of the 
> official Gentoo repo, so I might have prepared them with missing 
> options if any where not included by default.
> I know nothing about python.
> 
> $ equery l dtschema pylibfdt ruamel-yaml yamllint jsonschema python 
> [I-O] [  ] dev-python/dtschema-2023.9:0
> [I-O] [  ] dev-python/pylibfdt-1.7.0_p1:0
> [I-O] [  ] dev-python/ruamel-yaml-0.18.5:0
> [I-O] [  ] dev-python/yamllint-1.33.0:0
> [IP-] [  ] dev-python/jsonschema-4.19.1:0

4.18 and later are not supported.

Apparently behavior we relied on in pre-4.18 was "wrong" usage... 4.18 
also makes rust a hard dependency. That's a problem for any arch without 
LLVM support.

Installing via pip will check this dependency.

Rob
